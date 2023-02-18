def setup()
  createCanvas(720, 400)
  background(51)
  noStroke()
  noLoop()
end

def draw()
  drawTarget(width * 0.25, height * 0.4, 200, 4)
  drawTarget(width * 0.5, height * 0.5, 300, 10)
  drawTarget(width * 0.75, height * 0.3, 120, 6)
end

def drawTarget(xloc, yloc, size, num)
  grayvalues = 255 / num
  steps = size / num
  num.times do |i|
    fill(i * grayvalues)
    ellipse(xloc, yloc, size - i * steps, size - i * steps)
  end
end