require "./lib/bookify"

task :render do
  # drop ARGV[0], which is always "render"
  Bookify::Renderer.new(ARGV[1..-1]).render
end
