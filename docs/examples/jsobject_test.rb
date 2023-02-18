require "js"

p 1

document = JS.global[:document]
main = document.querySelector('main')
p main

main[:innerHTML] = <<~HTML
  <div class="demo">
  <div class="input">
    <label for="encode">Encode using <a href="https://github.com/makenowjust/ecoji.rb/">Ecoji.rb</a></label>
    <textarea id="encode" placeholder="😊 Let's type a text to encode here!"></textarea>
  </div>
  <div class="input">
    <label for="decode">Decode using <a href="https://github.com/makenowjust/ecoji.rb/">Ecoji.rb</a></label>
    <textarea id="decode" placeholder="🥴📊🧭📲🐂🔪🧏🤠🍉🛃🔯🌭🍉📤⛵🌭💲🚾⛵🌷🍉🔩🥈🤜👢🔥⛪🌭💚🔥🌆☕"></textarea>
  </div>
  <div class="info">
    <p>Powered by <a href="https://github.com/ruby/ruby.wasm">ruby.wasm</a></p>
    <p>#{RUBY_DESCRIPTION}</p>
  </div>
  </div>
HTML

p main[:innerHTML]

# これ無理
# p main.innerHTML