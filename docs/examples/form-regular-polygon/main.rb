def setup
  createCanvas(720, 400)
end

def draw
  background(102)

  push()
  translate(width * 0.2, height * 0.5)
  rotate(frameCount / 200.0)
  polygon(0, 0, 82, 3)
  pop()

  push()
  translate(width * 0.5, height * 0.5)
  rotate(frameCount / 50.0)
  polygon(0, 0, 80, 20)
  pop()

  push()
  translate(width * 0.8, height * 0.5)
  rotate(frameCount / -100.0)
  polygon(0, 0, 70, 7)
  pop()
end

def polygon(x, y, radius, npoints)
  angle = TWO_PI / npoints
  beginShape()
  0.step(TWO_PI, angle) do |a|
    sx = x + cos(a) * radius
    sy = y + sin(a) * radius
    vertex(sx, sy)
  end
  endShape(CLOSE)
end
