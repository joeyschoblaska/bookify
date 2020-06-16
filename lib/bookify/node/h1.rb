require_relative "base"

module Bookify::Node
  class H1 < Base
    def render
      break_if_close_to_bottom(250)
      move_down 30 unless pdf.y == page_top

      html = decode_html(node.inner_html.strip)
      dest = dest_xyz(0, pdf.y, nil, pdf.page)

      Bookify::Sections.add(:h1, html, dest)
      add_dest(html, dest)

      font :h1 do
        text html, align: :center
      end

      move_down 30
    end
  end
end
