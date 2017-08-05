module Bookify::Node
  class H4 < Base
    def render
      font :h4
      text node.inner_html.strip
      move_down 5
    end
  end
end
