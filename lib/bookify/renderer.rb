class Bookify::Renderer
  MARKDOWN_CONVERTER = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

  attr_accessor :filename

  def initialize(filename)
    self.filename = filename
  end

  def render
    Prawn::Document.generate(pdf_path) do |pdf|
      pdf.font_families["Book Antiqua"] = {
        normal:      { file: "fonts/BookAntiqua.ttf" },
        bold:        { file: "fonts/BookAntiqua-Bold.ttf" },
        italic:      { file: "fonts/BookAntiqua-Italic.ttf" },
        bold_italic: { file: "fonts/BookAntiqua-BoldItalic.ttf" }
      }

      pdf.fill_color "000000"
      pdf.stroke_color "333333"
      pdf.line_width(0.5)

      pdf.reflow_column_box [0, pdf.cursor], columns: 2, width: pdf.bounds.width do
        doc.children.each { |c| Bookify::Node.render(c, pdf) }
      end
    end
  end

  private

  def markdown
    @markdown ||= File.read(filename)
  end

  def doc
    @doc ||= Nokogiri::HTML(html)
  end

  def html
    @html ||= MARKDOWN_CONVERTER.render(markdown)
  end

  def pdf_path
    filename.gsub(/\.\w+/, ".pdf")
  end
end
