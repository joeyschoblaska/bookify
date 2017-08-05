module Bookify::Node
  class H1 < Base
    def render
      font :h1
      text node.inner_html.strip, align: :center
      move_down 10
    end
  end
end
