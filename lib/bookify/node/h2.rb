require_relative "base"

module Bookify::Node
  class H2 < Base
    def render
      font :h2
      move_down 5
      break_if_close_to_bottom
      html = decode_html(node.inner_html.strip)
      text html
      Bookify::Sections.add(:h2, html, dest_xyz(0, pdf.y, nil, pdf.page))
      move_down 1
      stroke { horizontal_rule }
      move_down 10
    end
  end
end
