$circles = []
$rects = []
$bgcolor = 102

def preload
  p "preload"
end

def setup
  p "setup"
  createCanvas(720, 400)
end

def draw
  background($bgcolor)

  fill(255)
  $circles.each do |pos|
    circle(pos[:x], pos[:y], 5)
  end

  fill(128, 128, 128, 255)
  $rects.each do |pos|
    rect(pos[:x], pos[:y], 20)
  end
end

def mouseMoved(e)
  p e
end

def mouseDragged(e)
  $bgcolor = $bgcolor + 5
  $bgcolor = 0 if $bgcolor > 255
end

def mousePressed(e)
  p e.shiftKey
  $circles << {x: mouseX, y: mouseY}
end

def mouseReleased(e)
  puts "mouseReleased #{e}"
end

def mouseClicked(e)
  puts "mouseClicked #{e}"
end

def doubleClicked(e)
  $rects << {x: mouseX, y: mouseY}
end

def mouseWheel(e)
  p e.delta
  $bgcolor += e.delta * 0.2
  $bgcolor = 0 if $bgcolor > 255
  $bgcolor = 255 if $bgcolor < 0
end

def keyPressed(e)
  p [key, keyCode]
  p e.key # KeyboardEvent.key
end

def keyReleased(e)
  p "keyReleased: #{e}"
  puts "LEFT" if keyIsDown(LEFT_ARROW)
end

def keyTyped(e)
  p "keyTyped: #{e}"
end

