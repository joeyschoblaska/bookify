class Bookify::Renderer
  MARKDOWN_CONVERTER = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

  attr_accessor :input_file, :output_file

  def initialize(input_file, output_file = nil)
    self.input_file = input_file
    self.output_file = output_file || input_file.gsub(/\.\w+/, ".pdf")
  end

  def render
    Prawn::Document.generate(output_file) do |pdf|
      font_path = "#{File.dirname(__FILE__)}/../../fonts"

      pdf.font_families["Book Antiqua"] = {
        normal:      { file: "#{font_path}/BookAntiqua.ttf" },
        bold:        { file: "#{font_path}/BookAntiqua-Bold.ttf" },
        italic:      { file: "#{font_path}/BookAntiqua-Italic.ttf" },
        bold_italic: { file: "#{font_path}/BookAntiqua-BoldItalic.ttf" }
      }

      pdf.fill_color "000000"
      pdf.stroke_color "333333"
      pdf.line_width(0.5)
      pdf.default_leading 0.5

      pdf.column_box [0, pdf.cursor], columns: 2, width: pdf.bounds.width do
        doc.children.each { |c| Bookify::Node.render(c, pdf) }
      end
    end
  end

  private

  def markdown
    @markdown ||= File.read(input_file)
  end

  def doc
    @doc ||= Nokogiri::HTML(html)
  end

  def html
    @html ||= MARKDOWN_CONVERTER.render(markdown)
  end
end
