module Bookify::Node
  class H1 < Base
    def render
      font :h1
      html = decode_html(node.inner_html.strip)
      text html, align: :center
      move_down 10
    end
  end
end
