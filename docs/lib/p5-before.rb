$p = nil

# HSB (hue, saturation, brightness) is a type of color model.
# You can learn more about it at
# <a href="https://learnui.design/blog/the-hsb-color-system-practicioners-primer.html">HSB</a>.
HSB = 'hsb'

module JS
  class Object
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
