require 'js'

# --------------------------------------------
# Constants 
# 
# Copyright: p5.js(https://p5js.org/copyright.html)
# The p5.js library is free software; 
# you can redistribute it and/or modify it under the terms of 
# the GNU Lesser General Public License as published
# by the Free Software Foundation, version 2.1.
# --------------------------------------------
_PI = Math::PI

# The default, two-dimensional renderer.
P2D = 'p2d'

# One of the two render modes in p5.js: P2D (default renderer) and WEBGL
# Enables 3D render by introducing the third dimension: Z
WEBGL = 'webgl'

# ENVIRONMENT
ARROW = 'default'
CROSS = 'crosshair'
HAND = 'pointer'
MOVE = 'move'
TEXT = 'text'
WAIT = 'wait'

# TRIGONOMETRY

# HALF_PI is a mathematical constant with the value
# 1.57079632679489661923. It is half the ratio of the
# circumference of a circle to its diameter. It is useful in
# combination with the trigonometric functions <a href="#/p5/sin">sin()</a> and <a href="#/p5/cos">cos()</a>.
HALF_PI = _PI / 2

# PI is a mathematical constant with the value
# 3.14159265358979323846. It is the ratio of the circumference
# of a circle to its diameter. It is useful in combination with
# the trigonometric functions <a href="#/p5/sin">sin()</a> and <a href="#/p5/cos">cos()</a>.
PI = _PI

# QUARTER_PI is a mathematical constant with the value 0.7853982.
# It is one quarter the ratio of the circumference of a circle to
# its diameter. It is useful in combination with the trigonometric
# functions <a href="#/p5/sin">sin()</a> and <a href="#/p5/cos">cos()</a>.
QUARTER_PI = _PI / 4

# TAU is an alias for TWO_PI, a mathematical constant with the
# value 6.28318530717958647693. It is twice the ratio of the
# circumference of a circle to its diameter. It is useful in
# combination with the trigonometric functions <a href="#/p5/sin">sin()</a> and <a href="#/p5/cos">cos()</a>.
TAU = _PI * 2

# TWO_PI is a mathematical constant with the value
# 6.28318530717958647693. It is twice the ratio of the
# circumference of a circle to its diameter. It is useful in
# combination with the trigonometric functions <a href="#/p5/sin">sin()</a> and <a href="#/p5/cos">cos()</a>.
TWO_PI = _PI * 2

# Constant to be used with the <a href="#/p5/angleMode">angleMode()</a> function, to set the mode in
# which p5.js interprets and calculates angles (either DEGREES or RADIANS).
DEGREES = 'degrees'

# Constant to be used with the <a href="#/p5/angleMode">angleMode()</a> function, to set the mode
# in which p5.js interprets and calculates angles (either RADIANS or DEGREES).
RADIANS = 'radians'
DEG_TO_RAD = _PI / 180.0
RAD_TO_DEG = 180.0 / _PI

CORNER = 'corner'
CORNERS = 'corners'
RADIUS = 'radius'
RIGHT = 'right'
LEFT = 'left'
CENTER = 'center'
TOP = 'top'
BOTTOM = 'bottom'
BASELINE = 'alphabetic'

POINTS = 0x0000
LINES = 0x0001
LINE_STRIP = 0x0003
LINE_LOOP = 0x0002
TRIANGLES = 0x0004
TRIANGLE_FAN = 0x0006
TRIANGLE_STRIP = 0x0005

QUADS = 'quads'
QUAD_STRIP = 'quad_strip'
TESS = 'tess'
CLOSE = 'close'
OPEN = 'open'
CHORD = 'chord'
PIE = 'pie'
PROJECT = 'square' # PEND: careful this is counterintuitive
SQUARE = 'butt'
ROUND = 'round'
BEVEL = 'bevel'
MITER = 'miter'

# COLOR
RGB = 'rgb'
# HSB (hue, saturation, brightness) is a type of color model.
# You can learn more about it at
# <a href="https://learnui.design/blog/the-hsb-color-system-practicioners-primer.html">HSB</a>.
HSB = 'hsb'
HSL = 'hsl'

# DOM EXTENSION

# AUTO allows us to automatically set the width or height of an element (but not both),
# based on the current height and width of the element. Only one parameter can
# be passed to the <a href="/#/p5.Element/size">size</a> function as AUTO, at a time.
AUTO = 'auto'

# INPUT
ALT = 18
BACKSPACE = 8
CONTROL = 17
DELETE = 46
DOWN_ARROW = 40
ENTER = 13
ESCAPE = 27
LEFT_ARROW = 37
OPTION = 18
RETURN = 13
RIGHT_ARROW = 39
SHIFT = 16
TAB = 9
UP_ARROW = 38

# RENDERING
BLEND = 'source-over'
REMOVE = 'destination-out'
ADD = 'lighter'
#ADD: 'add', #
#SUBTRACT: 'subtract', #
DARKEST = 'darken'
LIGHTEST = 'lighten'
DIFFERENCE = 'difference'
SUBTRACT = 'subtract'
EXCLUSION = 'exclusion'
MULTIPLY = 'multiply'
SCREEN = 'screen'
REPLACE = 'copy'
OVERLAY = 'overlay'
HARD_LIGHT = 'hard-light'
SOFT_LIGHT = 'soft-light'
DODGE = 'color-dodge'
BURN = 'color-burn'

# FILTERS
THRESHOLD = 'threshold'
GRAY = 'gray'
OPAQUE = 'opaque'
INVERT = 'invert'
POSTERIZE = 'posterize'
DILATE = 'dilate'
ERODE = 'erode'
BLUR = 'blur'

# TYPOGRAPHY
NORMAL = 'normal'
ITALIC = 'italic'
BOLD = 'bold'
BOLDITALIC = 'bold italic'
CHAR = 'CHAR'
WORD = 'WORD'

# TYPOGRAPHY-INTERNAL
_DEFAULT_TEXT_FILL = '#000000'
_DEFAULT_LEADMULT = 1.25
_CTX_MIDDLE = 'middle'

# VERTICES
LINEAR = 'linear'
QUADRATIC = 'quadratic'
BEZIER = 'bezier'
CURVE = 'curve'

# WEBGL DRAWMODES
STROKE = 'stroke'
FILL = 'fill'
TEXTURE = 'texture'
IMMEDIATE = 'immediate'

# WEBGL TEXTURE MODE
# NORMAL already exists for typography
IMAGE = 'image'

# WEBGL TEXTURE WRAP AND FILTERING
# LINEAR already exists above
NEAREST = 'nearest'
REPEAT = 'repeat'
CLAMP = 'clamp'
MIRROR = 'mirror'

# DEVICE-ORIENTATION
LANDSCAPE = 'landscape'
PORTRAIT = 'portrait'

# DEFAULTS
_DEFAULT_STROKE = '#000000'
_DEFAULT_FILL = '#FFFFFF'

GRID = 'grid'
AXES = 'axes'
LABEL = 'label'
FALLBACK = 'fallback'
CONTAIN = 'contain'
COVER = 'cover'

# --------------------------------------------
# Library 
# --------------------------------------------
# JS::Object can call property via function style
class JS::Object
  def method_missing(sym, *args, &block)
    ret = self[sym]

    case ret.typeof
    when "undefined"
      str = sym.to_s
      if str[-1] == "="
        self[str.chop.to_sym] = args.first
        return args.first
      end

      super
    when "function"
      self.call(sym, *args, &block).to_r
    else
      ret.to_r
    end
  end

  def respond_to_missing?(sym, include_private)
    return true if super
    self[sym].typeof != "undefined"
  end

  def to_r
    case self.typeof
    when "number"
      self.to_f
    when "string"
      self.to_s
    else
      self
    end
  end
end

# Call p5.js global functions
$p5 = nil

def method_missing(sym, *args, &block)
  return super unless $p5.respond_to?(:[])
  ret = $p5[sym]

  case ret.typeof
  when "undefined"
    # str = sym.to_s
    # if str[-1] == "="
    #   $p5[str.chop.to_sym] = args.first
    #   return args.first
    # end
    super
  when "function"
    $p5.call(sym, *args, &block).to_r
  else
    ret.to_r
  end
end

# Add new p5() to window.constructors.p5()
JS.eval("window.constructors = { p5: (...args) => new p5(...args) };")

module P5
  Vector = JS.global[:p5][:Vector]

  module_function

  def init(query = "main", obj = self)
    unless query.is_a?(String)
      query, obj = "main", query
    end

    sketch = ->(p5) {
      $p5 = p5
      init_method(obj, :preload)
      init_method(obj, :setup)
      init_method(obj, :draw)
      init_event_method(obj, :mouseMoved)
      init_event_method(obj, :mouseDragged)
      init_event_method(obj, :mousePressed)
      init_event_method(obj, :mouseReleased)
      init_event_method(obj, :mouseClicked)
      init_event_method(obj, :doubleClicked)
      init_event_method(obj, :mouseWheel)
      init_event_method(obj, :keyPressed)
      init_event_method(obj, :keyReleased)
      init_event_method(obj, :keyTyped)
    }
    
    container = JS.global.document.querySelector(query)
    container.innerHTML = ""
    JS.global.window.constructors.p5(sketch, container)
  end

  def init_method(obj, sym)
    if obj.respond_to?(sym, true)
      m = obj.method(sym)
      $p5[sym] = ->() { m.call() }
    end
  end

  def init_event_method(obj, sym)
    if obj.respond_to?(sym, true)
      m = obj.method(sym)
      if m.parameters.count >= 1
        $p5[sym] = ->(e) { m.call(e) }
      else
        $p5[sym] = ->(e) { m.call() }
      end
    end
  end
end
