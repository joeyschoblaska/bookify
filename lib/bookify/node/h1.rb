module Bookify::Node
  class H1 < Base
    def render
      break_if_close_to_bottom(250)
      move_down 20 unless pdf.y == page_top
      font :h1
      html = decode_html(node.inner_html.strip)
      outline.page title: html, destination: dest_xyz(0, pdf.y, nil, pdf.page)
      text html, align: :center
      move_down 10
    end

    def page_top
      pdf.bounds.parent.height + 50
    end
  end
end
