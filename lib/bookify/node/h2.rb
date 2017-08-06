module Bookify::Node
  class H2 < Base
    def render
      font :h2
      move_down 5
      text node.inner_html.strip
      move_down 1
      stroke { horizontal_rule }
      move_down 5
    end
  end
end
