require 'js'

p5 = JS.global[:p5]
window = JS.global[:window]
document = window[:document]

sketch = ->(p) {
  $p = p  
  $p[:setup] = -> { setup } if defined?(setup)
  $p[:draw] = -> { draw } if defined?(draw)
  $p[:mousePressed] = ->(e) { mousePressed } if defined?(mousePressed)
}

container = document.querySelector('main')
container[:innerHTML] = ''
window[:constructors].p5(sketch, container)
