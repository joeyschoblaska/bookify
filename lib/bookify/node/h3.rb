module Bookify::Node
  class H3 < Base
    def render
      font :h3
      move_down 5
      text node.inner_html.strip
      move_down 5
    end
  end
end
