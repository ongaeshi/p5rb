def setup
  createCanvas(720, 400)
end

def draw
  background(127)
  noStroke()
  0.step(height, 20) do |i|
    fill(129, 206, 15)
    rect(0, i, width, 10)
    fill(255)
    rect(i, 0, 10, height)
  end
end