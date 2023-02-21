$angles = [30, 10, 45, 35, 60, 38, 75, 67]

def setup
  createCanvas(720, 400)
  noStroke()
  noLoop() # Run once and stop
end

def draw
  background(100)
  pieChart(300, $angles)
end

def pieChart(diameter, data)
  lastAngle = 0
  (0...data.length).each do |i|
    gray = map(i, 0, data.length, 0, 255)
    fill(gray)
    arc(
      width / 2,
      height / 2,
      diameter,
      diameter,
      lastAngle,
      lastAngle + radians($angles[i])
    )
    lastAngle += radians($angles[i])
  end
end
