def setup
  # p random(1)
  p $p.call(:random, 1).class    #=> JS::Object
  p $p.call(:random, 1).typeof   #=> "number"
  p random(1)
  p dist(1, 0, 2, 0)
  createCanvas(710, 400)
  p width
  p height
end

def draw
  circle(mouseX, mouseY, 10)
end