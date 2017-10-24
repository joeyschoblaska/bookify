module Bookify::Node
  class Paragraph < Base
    def render
      if node.children.count == 1 && node.children.first.name.to_sym == :img
        SUBCLASSES[:img].render(node.children.first, pdf)
      else
        html = clean_html(node.inner_html)
        font :primary
        text html, inline_format: true
        move_down 10
      end
    end
  end
end
