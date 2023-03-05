p [ 1, 2, 3..4, 'five' ]   # => "[1, 2, 3..4, \"five\"]"
p Time.new                 # => "2008-03-08 19:43:39 +0900"

puts "foo", "bar\n", "baz"
puts ""    # Output only newlines
puts       # Output only newlines
puts nil   # Output only newlines
puts ["oui", "non"]

print "Hello, world!"
print "Regexp is",/ant/
print nil
print "\n"
#=> Hello, world!Regexp is(?-mix:ant)

$_ = "input"
$, = "<and>"
$\ = "<end>\n"
print
print "AA","BB"
#=> input<end>
#=> AA<and>BB<end>
