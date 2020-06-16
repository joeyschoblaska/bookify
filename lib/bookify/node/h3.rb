require_relative "base"

module Bookify::Node
  class H3 < Base
    def render
      move_down 5 unless pdf.y == page_top
      break_if_close_to_bottom

      font :h3 do
        text decode_html(node.inner_html.strip)
      end

      move_down 5
    end
  end
end
