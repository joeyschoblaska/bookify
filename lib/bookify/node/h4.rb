require_relative "base"

module Bookify::Node
  class H4 < Base
    def render
      move_down 10 unless pdf.y == page_top
      break_if_close_to_bottom

      font :h4 do
        text decode_html(node.inner_html.strip)
      end

      move_down 5
    end
  end
end
