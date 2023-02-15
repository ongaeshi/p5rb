$p = nil

def method_missing(name, *args)
  if $p.respond_to?(name)
    $p.call(name, *args)
  else
    super
  end
end

def width = $p[:width].to_i
def height = $p[:height].to_i
def random(*args) = $p.call(:random, *args).to_f
 