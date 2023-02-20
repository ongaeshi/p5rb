require 'js'

# Constants
_PI = Math::PI
PI = _PI
TWO_PI = _PI * 2
HSB = 'hsb'
CLOSE = 'close'
TRIANGLE_STRIP = 0x0005
WEBGL = 'webgl'

# Class
module P5
  Vector = JS.global[:p5][:Vector]
end

# JS::Object can call property via function style
class JS::Object
  def method_missing(sym, *args, &block)
    ret = self[sym]

    case ret.typeof
    when "undefined"
      str = sym.to_s
      if str[-1] == "="
        self[str.chop.to_sym] = args.first
        return args.first
      end

      super
    when "function"
      self.call(sym, *args, &block).to_r
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

# Call p5.js global functions
$p = nil

def method_missing(sym, *args, &block)
  return super unless $p.respond_to?(:[])
  ret = $p[sym]

  case ret.typeof
  when "undefined"
    # str = sym.to_s
    # if str[-1] == "="
    #   $p[str.chop.to_sym] = args.first
    #   return args.first
    # end
    super
  when "function"
    $p.call(sym, *args, &block).to_r
  else
    ret.to_r
  end
end

# Add new p5() to window.constructors.p5()
JS.eval("window.constructors = { p5: (...args) => new p5(...args) };")
