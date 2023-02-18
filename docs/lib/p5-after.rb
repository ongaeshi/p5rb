sketch = ->(p) {
  $p = p  
  $p[:setup] = -> { setup } if defined?(setup)
  $p[:draw] = -> { draw } if defined?(draw)
  $p[:mousePressed] = ->(e) { mousePressed } if defined?(mousePressed)
}

container = JS.global.document.querySelector('main')
container.innerHTML = ""
JS.global.window.constructors.p5(sketch, container)
