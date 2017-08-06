module Bookify::Node
  class H4 < Base
    def render
      move_down 5
      font :h4
      text node.inner_html.strip
      move_down 0.5
    end
  end
end
