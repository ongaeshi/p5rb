$positions = []

def setup
  createCanvas(720, 400)
end

def draw
  background(102)

  $positions.each do |pos|
    circle(pos[:x], pos[:y], 5)
  end
end

def mousePressed(e)
  p e.shiftKey
  $positions << {x: mouseX, y: mouseY}
end