Gem::Specification.new do |s|
  s.name        = "bookify"
  s.version     = "0.0.3"
  s.date        = "2017-08-05"
  s.summary     = "Transform Markdown docs into two-column PDFs."
  s.author      = "Joey Schoblaska"
  s.files       = `git ls-files lib fonts`.split("\n")
  s.homepage    = "https://github.com/joeyschoblaska/bookify"
  s.license     = "MIT"

  s.add_runtime_dependency "nokogiri", "~> 1.8"
  s.add_runtime_dependency "prawn", "~> 2.2"
  s.add_runtime_dependency "prawn-table", "~> 0.2"
  s.add_runtime_dependency "redcarpet", "~> 3.3"

  s.executables << "bookify"
end
