<p align="center">
  <img width="319" src="https://raw.githubusercontent.com/joeyschoblaska/bookify/master/img/bookify.png">
</p>

<p align="center">
  A gem for converting Markdown documents to book style, two-column PDFs.
</p>

## Example

[This Markdown doc](https://raw.githubusercontent.com/joeyschoblaska/bookify/master/example/document.md), run through bookify, gets converted
into [this PDF](https://raw.githubusercontent.com/joeyschoblaska/bookify/master/example/output.pdf).

## Usage

### On the command line

```
gem install bookify
bookify document.md
```

You can specify the output file with a second argument (`bookify document.md
output.pdf`), otherwise it will default to a PDF in your current directory with
the same name as the input file.

Passing `-l` or `--landscape` as the first argument will render the document in
a three-column landscape layout.

```
bookify -l document.md
```

### In Ruby

```ruby
require "bookify"
Bookify::Renderer.new(input_file: "document.md", output_file: "output.pdf").render
```

## Syntax

Supports basic Markdown (paragraphs, ul, ol, bold, italics, h1, h2, h3, tables) and limited html (img). You can also add divs with a class of "section-break" to immediately move to the next column, or "page-break" to immediately move to the next full page.

### Pre- and Post-processors
When generating documents, bookify converts Markdown to HTML, then parses that HTML into the final PDF document. If you want to add any custom extensions to Markdown (to be applied during the Markdown-to-HTML step), you can do so by registering your own pre- and post-processors. For example, if you want wiki-style internal links (`[[Title]]` and `[[Title|Target]]`) to be parsed as internal PDF links:

```ruby
Bookify::Markdown.add_preprocessor ->(string) do
  pattern = /\[\[[^\[]+\]\]/

  string.gsub(pattern).each do |element|
    content = element.gsub(/[\[\]]/, "")

    title, target = content.split("|")
    target ||= title

    "<link anchor='#{target}'>#{title}</link>"
  end
end
```

## TODO
* support strikethrough
* nested lists
* tables with text centered within cells
* set image width
* images and headers that span the full page width
* initial / "drop cap" letters
* fix bug where font size in tables is too large if table immediately follows a header
