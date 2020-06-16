require_relative "base"

module Bookify::Node
  class H2 < Base
    def render
      move_down 15 unless pdf.y == page_top
      break_if_close_to_bottom

      html = decode_html(node.inner_html.strip)
      dest = dest_xyz(0, pdf.y, nil, pdf.page)
      parent_h1 = Bookify::Sections.current_h1_title

      Bookify::Sections.add(:h2, html, dest)
      add_dest(html, dest)
      add_dest("#{parent_h1}/#{html}", dest) if parent_h1

      font :h2 do
        text html
      end

      move_down 1
      stroke { horizontal_rule }
      move_down 10
    end
  end
end
