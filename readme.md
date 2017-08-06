<p align="center">
  <img width="319" src="https://raw.githubusercontent.com/joeyschoblaska/bookify/master/img/bookify.png">
</p>

A gem for converting Markdown documents to book style, two-column PDFs.

## Usage

### On the command line

```
gem install bookify
bookify document.md
```

You can specify the output file with a second argument (`bookify document.md output.pdf`),
otherwise it will default to a PDF with the same name and directory as your input file.

### In Ruby

```ruby
require "bookify"
Bookify::Renderer.new("document.md", "output.pdf").render
```

## TODO
* finish converting support for images
