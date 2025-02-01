// Expose `Buffer` into the global.
window.Buffer = window['buffer'].Buffer;
const { DefaultRubyVM } = window["ruby-wasm-wasi"];
const globalData = {};
let myP5 = null;

const codeEditor = CodeMirror.fromTextArea(
  document.getElementById("input"),
  {
    theme: 'rubyblue',
    mode: "text/x-ruby",
    indentUnit: 2,
    matchBrackets: true,
    autoCloseBrackets: true
  }
);

codeEditor.setOption("extraKeys", {
  "Ctrl-Enter": function (cm) {
    runScript()
  }
});

const main = async () => {
  const queryString = window.location.search;
  const urlParams = new URLSearchParams(queryString);
  const code = urlParams.get('q')
  if (code !== null) {
    if (code === "") {
      codeEditor.setValue("")
    } else {
      codeEditor.setValue(LZString.decompressFromEncodedURIComponent(code))
    }
  }

  // Fetch and instantiate WebAssembly binary
  const response = await fetch(
    //      Tips: Replace the binary with debug info if you want symbolicated stack trace.
    //      (only nightly release for now)
    //      "https://cdn.jsdelivr.net/npm/ruby-3_2-wasm-wasi@next/dist/ruby.debug+stdlib.wasm"
    "https://cdn.jsdelivr.net/npm/ruby-3_2-wasm-wasi@next/dist/ruby.wasm"
  );
  const buffer = await response.arrayBuffer();
  const module = await WebAssembly.compile(buffer);
  const { vm } = await DefaultRubyVM(module);

  globalData.vm = vm;

  const p5rb = await fetch("../lib/p5.rb");
  const t = await p5rb.text();

  vm.eval(t);

  vm.printVersion();

  document.getElementById("run").onclick = runScript;
  document.getElementById("clear").onclick = selectAllScripts;

  codeEditor.focus();

  runScript();
};

main();

const runScript = () => {
  // Rewrite URL
  const queryString = window.location.search;
  const urlParams = new URLSearchParams(queryString);
  urlParams.set("q", LZString.compressToEncodedURIComponent(codeEditor.getValue()))
  history.replaceState('', '', "?" + urlParams.toString());
  const vm = globalData.vm;
  document.getElementById("error-console").value = "";

  try {
    vm.eval(codeEditor.getValue());
  } catch (e) {
    console.error("ppp" + e);
  }

  // Initialize p5.js
  function sketch(p) {
    vm.eval("P5").call("init", vm.wrap(p))

    p.setup = function () {
      try {
        vm.eval("setup")
      } catch (e) {
        document.getElementById("error-console").value = e.message + "\n";
        throw e
      }
      // p.createCanvas(400, 400);
      // p.background(200);
    };

    p.draw = function () {
      // try {
      //   // console.log("hello")
      //   p.background(200);
      //   p.fill(255, 0, 0);
      //   p.rect(50, 50, 100, 100);
      // } catch (e) {
      //   console.error("hi" + e);
      // }
      try {
        vm.eval("draw");
      } catch (e) {
        document.getElementById("error-console").value = e.message;
        throw e
      }
      // p.fill(255, 0, 0);
      // p.ellipse(p.width / 2, p.height / 2, 50, 50);
    };
  }

  myP5 && myP5.remove();
  myP5 = new p5(sketch, 'main');
}

const selectAllScripts = () => {
  codeEditor.focus();
  codeEditor.execCommand("selectAll");
};
