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

class ExtendJSObject
  attr_reader :obj

  def initialize(obj)
    @obj = obj
  end

  def method_missing(sym, *args, &block)
    ret = @obj[sym]
  
    case ret.typeof
    when "function"
      @obj.call(sym, *args, &block).to_r
    when "undefined"
      super
    else
      ret.to_r
    end
  end

  def respond_to_missing?(sym, include_private)
    return true if super
    @obj[sym].typeof != "undefined"
  end
end

def createVector(*args) = ExtendJSObject.new($p.call(:createVector, *args))

def setup
  # p random(1)
  p $p.call(:random, 1).class    #=> JS::Object
  p $p.call(:random, 1).typeof   #=> "number"
  p random(1)
  p dist(1, 0, 2, 0)
  createCanvas(710, 400)
  p width
  p height

  slider = createSlider(0, 255, 127)
  p slider.class
  p slider.methods
  # p slider.position(1, 1)
  # p slider.style('width', '80px')

  button = createButton('click me')
  p button.class # JS::Object
  button.position(0, 0)
  p button[:xxxxx]
  # 
  # button.

  v1 = createVector(40, 50);
  v2 = createVector(40, 50);
  p v1.class
  p v1.x
  ellipse(v1.x, v1.y, 50, 50)
  ellipse(v2.x, v2.y, 50, 50);
  # v1.add(v2);
  # ellipse(v1.x, v1.y, 50, 50); 
  describe("2 white ellipses. One center-left the other\nbottom right and off canvas");
end

def draw
  circle(mouseX, mouseY, 10)
end