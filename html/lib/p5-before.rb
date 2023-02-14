$p = nil

def method_missing(name, *args)
  if $p.respond_to?(name)
    $p.call(name, *args)
  else
    super
  end
end

