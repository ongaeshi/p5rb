# $ /path/to/p5rb/
# $ ruby script/generate_example.rb form-pie-chart "Pie Chart"
require 'fileutils'

while ARGV.length >= 2
  name, title = ARGV.shift(2)

  FileUtils.mkdir_p "docs/examples/#{name}"

  File.write "docs/examples/#{name}/index.html", <<EOS
<html>
  <head>
    <script src="https://cdn.jsdelivr.net/npm/ruby-3_2-wasm-wasi@next/dist/browser.script.iife.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/p5@1.5.0/lib/p5.js"></script>
    <script src="../../lib/p5-before.js"></script>
    <script type="text/ruby" src="../../lib/p5-before.rb"></script>
    <script type="text/ruby" src="./main.rb"></script>
    <script type="text/ruby" src="../../lib/p5-after.rb"></script>
    <title>#{title} | p5.rb</title>
  </head>
  <body>
    <h1>#{title} | p5.rb</h1>
    <a href=".."><< back</a>
    <a href="https://github.com/ongaeshi/p5rb/tree/master/docs/examples/#{name}/main.rb">[rb]</a>
    <a href="https://p5js.org/examples/#{name}.html">[js]</a>
    <p></p>
    <main></main>
  </body>
</html>
EOS

File.write "docs/examples/#{name}/main.rb", ""
puts "    <li><a href=\"#{name}\">#{title}</a></li>"
end


# p foo, bar