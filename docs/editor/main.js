// Expose `Buffer` into the global.
window.Buffer = window['buffer'].Buffer;
const { DefaultRubyVM } = window["ruby-wasm-wasi"];
const globalData = {};

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

  const p5 = await fetch("../lib/p5.rb");
  const t = await p5.text();
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

  globalData.vm.eval(codeEditor.getValue() + "\nP5::init");
}

const selectAllScripts = () => {
  codeEditor.focus();
  codeEditor.execCommand("selectAll");
};

