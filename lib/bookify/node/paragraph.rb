module Bookify::Node
  class Paragraph < Base
    def render
      node.children.each do |child|
        if child.name == "text"
          html = clean_html(node.inner_html)
          font :primary
          text html, inline_format: true
          move_down 10
        else
          SUBCLASSES[child.name.to_sym].render(child, pdf)
        end
      end
    end
  end
end
