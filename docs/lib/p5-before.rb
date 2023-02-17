$p = nil

# HSB (hue, saturation, brightness) is a type of color model.
# You can learn more about it at
# <a href="https://learnui.design/blog/the-hsb-color-system-practicioners-primer.html">HSB</a>.
HSB = 'hsb'

# ruby.wasm/ext/js/lib/js.rb
# https://github.com/ruby/ruby.wasm/blob/main/ext/js/lib/js.rb#L105
module JS::Object
  def method_missing(sym, *args, &block)
    obj = self[sym]
  
    if obj != nil
      if obj.typeof == "function"
        self.call(sym, *args, &block).to_r
      elsif args.count == 0
        obj.to_r
      end
    end

    super
  end

  def respond_to_missing?(sym, include_private)
    return true if super
    self[sym] != nil
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
end

def method_missing(name, *args)
  if args.count == 0
    field = $p[name]
    return field unless field.nil?
  end

  if $p.respond_to?(name)
    $p.call(name, *args).to_r
  end

  super
end

