def setup
  # p random(1)
  p $p.call(:random, 1).class    #=> JS::Object
  p $p.call(:random, 1).typeof   #=> "number"
  p random(1)
  p dist(1, 0, 2, 0)
end
