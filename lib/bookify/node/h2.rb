require_relative "base"

module Bookify::Node
  class H2 < Base
    def render
      font :h2
      move_down 5
      break_if_close_to_bottom
      text decode_html(node.inner_html.strip)
      move_down 1
      stroke { horizontal_rule }
      move_down 10
    end
  end
end
