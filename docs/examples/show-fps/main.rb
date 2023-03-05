def setup
  createCanvas(710, 400)
  frameRate(30)
end

def draw
  background(100, 153, 0)
  textSize(16)
  fill(0)
  text("FPS: #{frameRate().round(1)}", 10, 10, 100, 100)
  line(100, 100, 200, 200)
end  