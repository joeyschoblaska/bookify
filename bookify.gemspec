Gem::Specification.new do |s|
  s.name = "bookify"
  s.version = "2.0.0"
  s.summary = "Transform Markdown docs into two-column PDFs."
  s.author = "Joey Schoblaska"
  s.homepage = "https://github.com/joeyschoblaska/bookify"
  s.license = "MIT"

  s.files = `git ls-files lib fonts`.split("\n")
  s.executables << "bookify"

  s.add_development_dependency "rake"

  s.add_runtime_dependency "nokogiri", "~> 1.8"
  s.add_runtime_dependency "prawn", "~> 2.2"
  s.add_runtime_dependency "prawn-table", "~> 0.2"
  s.add_runtime_dependency "redcarpet", "~> 3.3"
  s.add_runtime_dependency "htmlentities", "~> 4.3"
end
