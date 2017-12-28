class Bookify::Renderer
  MARKDOWN_CONVERTER = Redcarpet::Markdown.new(Redcarpet::Render::HTML, tables: true)

  attr_accessor :input_file, :output_file, :layout, :columns

  def initialize(args)
    if ["-l", "--landscape"].include?(args[0])
      args.shift
      self.layout = :landscape
      self.columns = 3
    else
      self.layout = :portrait
      self.columns = 2
    end

    self.input_file = args[0]
    self.output_file = args[1] || input_file.split("/").last.gsub(/\.\w+/, ".pdf")
  end

  def render
    Prawn::Document.generate(output_file, margin: 50, page_layout: layout) do |pdf|
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

      pdf.column_box [0, pdf.cursor], columns: columns, width: pdf.bounds.width do
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
