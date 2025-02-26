def setup
  createCanvas(710, 400, WEBGL)
  @voxel_colors = Array.new(11) { Array.new(11) { [random(255), random(255), random(255)] } }
end

def draw
  background(100)
  orbitControl

  noStroke()
  fill(50)
  push()
  translate(-275, 175)
  rotateY(1.25)
  rotateX(-0.9)
  box(100)
  pop()

  noFill()
  stroke(255)
  push()
  translate(500, height * 0.35, -200)
  sphere(300)
  pop()

  push()
  translate(0, -200, 0)
  rotateY(frameCount * 0.01)
  rotateX(frameCount * 0.01)
  beginShape()
  (0..9).each do |i|
    phi = map(i, 0, 9, 0, TWO_PI)
    (0..9).each do |j|
      theta = map(j, 0, 9, 0, PI)
      x = 10 * sin(theta) * cos(phi)
      y = 10 * sin(theta) * sin(phi)
      z = 10 * cos(theta)
      vertex(x, y, z)
    end
  end
  endShape(CLOSE)
  pop()

  push()
  rotateY(frameCount * 0.01)
  draw_voxel_mountain
  pop()
end

def draw_voxel_mountain
  size = 20
  (0..10).each do |i|
    (0..10).each do |j|
      h = noise(i * 0.1, j * 0.1) * 400
      push()
      translate(i * size - 100, -h / 2 + 100, j * size - 100)
      fill(*@voxel_colors[i][j])
      box(size, h, size)
      pop()
    end
  end
end