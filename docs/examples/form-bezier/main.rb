def setup
  createCanvas(720, 400)
  stroke(255)
  noFill()
end

def draw()
  background(0)
  0.step(200-1, 20) do |i|
    bezier(
      mouseX - i / 2.0,
      40 + i,
      410,
      20,
      440,
      300,
      240 - i / 16.0,
      300 + i / 8.0
    )
  end
end
