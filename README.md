# [p5.rb](https://p5rb.ongaeshi.me/)
[p5.js](https://p5js.org/) with [ruby.wasm](https://github.com/ruby/ruby.wasm).

## Quick Start
```html
<html>
  <head>
    <script src="https://cdn.jsdelivr.net/npm/ruby-3_2-wasm-wasi@next/dist/browser.script.iife.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/p5@1.5.0/lib/p5.js"></script>
    <script type="text/ruby" src="p5.rb"></script>
    <script type="text/ruby">
def setup
  createCanvas(720, 400)
end

def draw
  background(127)
  noStroke()
  0.step(height, 20) do |i|
    fill(129, 206, 15)
    rect(0, i, width, 10)
    fill(255)
    rect(i, 0, 10, height)
  end
end        

P5::init()
    </script>
  </head>
  <body>
    <main>
    </main>
  </body>
</html>
```


