# https://twitter.com/SnowEsamosc/status/1632363858307457026

def stroke(*args) = $p5.stroke(*args)
def noise(*args) = $p5.noise(*args).to_f
def pow(*args) = $p5.pow(*args).to_f
def arc(*args) = $p5.arc(*args)

R=0.5
W=500*R
$f=0

def setup
  createCanvas(W,W)
end

def draw
  background(0)
  noFill()
  strokeWeight(3*R)

  (1...900*R).each do |r|
    $f += 1
    ii=r*PI/5
    (ii...ii+TAU).step(TAU/4) do |i|
      stroke(W,W,noise(i*9,r)*255)
      rr=pow(1.03,r+$f/5%5)
      $t=i+noise(i*9,r-($f/5)|0)
      arc(350*R,150*R,rr,rr,$t,$t+PI/6)
    end
  end

  textSize(16)
  fill(255)
  stroke(0)
  text("FPS: #{frameRate().round(1)}", 10, 10, 100, 100)
end