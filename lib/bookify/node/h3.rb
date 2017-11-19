module Bookify::Node
  class H3 < Base
    def render
      font :h3
      move_down 5
      break_if_close_to_bottom
      text decode_html(node.inner_html.strip)
      move_down 2
    end
  end
end
