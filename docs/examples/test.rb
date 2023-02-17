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
  # 
  # button.

  v1 = createVector(40, 50);
  v2 = createVector(40, 50);
  p v1[:x]
  p v1[:x].typeof
  p v1.x
  # p v1.y
  ellipse(v1[:x].to_r, v1[:y].to_r, 50, 50)
  # ellipse(v2.x, v2.y, 50, 50);
  # v1.add(v2);
  # ellipse(v1.x, v1.y, 50, 50); 
  # describe(`2 white ellipses. One center-left the other
  # bottom right and off canvas`);
end

def draw
  circle(mouseX, mouseY, 10)
end