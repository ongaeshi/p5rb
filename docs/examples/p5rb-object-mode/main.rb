class Circle
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
    @color = 255
    @speed = random(5)
  end

  def draw
    @color += @speed
    @speed *= -1 if @color < 0 || @color > 255
    fill(@color)
    circle(@x, @y, 50)
  end
end

class App
  def initialize
    @bgcolor = 102
    @circles = []
    @t = 0
  end

  def setup
    createCanvas(720, 400)
  end

  def draw
    @t += 1

    if @t > 60
      add_circle(random(width), random(height))
      @t = 0
    end

    background(@bgcolor)
    fill(255)
    circle(width / 2, height / 2, 30)
    @circles.each(&:draw)
  end

  def mousePressed
    add_circle(mouseX, mouseY)
  end

  def add_circle(x, y)
    @circles << Circle.new(x, y)
  end
end

P5::init(App.new)