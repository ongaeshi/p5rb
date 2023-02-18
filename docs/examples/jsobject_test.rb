require "js"

class JS::Object
  def method_missing(sym, *args, &block)
    ret = self[sym]
  
    case ret.typeof
    when "function"
      self.call(sym, *args, &block).to_r
    when "undefined"
      super
    else
      ret.to_r
    end
  end

  def respond_to_missing?(sym, include_private)
    return true if super
    self[sym].typeof != "undefined"
  end

  def to_r
    case self.typeof
    when "number"
      self.to_f
    when "string"
      self.to_s
    else
      self
    end
  end
end

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
p main[:innerHTML].class

# これ無理
p main.innerHTML
p main.innerHTML.class