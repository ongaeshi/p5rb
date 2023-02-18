require 'js'

$p = nil

# HSB (hue, saturation, brightness) is a type of color model.
# You can learn more about it at
# <a href="https://learnui.design/blog/the-hsb-color-system-practicioners-primer.html">HSB</a>.
HSB = 'hsb'

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

def method_missing(sym, *args, &block)
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
