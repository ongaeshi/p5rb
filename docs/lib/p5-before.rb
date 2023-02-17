$p = nil

# HSB (hue, saturation, brightness) is a type of color model.
# You can learn more about it at
# <a href="https://learnui.design/blog/the-hsb-color-system-practicioners-primer.html">HSB</a>.
HSB = 'hsb'

class Element
  def initialize(obj)
    @obj = obj
  end

  def obj = @obj
  def value = @obj.call(:value).to_f
end

def width = $p[:width].to_i
def height = $p[:height].to_i
def mouseX = $p[:mouseX].to_f
def mouseY = $p[:mouseY].to_f
def createSlider(*args) = Element.new($p.call(:createSlider, *args))

class JS::Object
  def to_r
    case ret.typeof
    when "number"
      ret.to_f
    when "string"
      ret.to_s
    else
      ret
    end
  end
end

def method_missing(name, *args)
  if $p.respond_to?(name)
    $p.call(name, *args).to_r
  else
    super
  end
end

