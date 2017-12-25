module Bookify::Node
  class Paragraph < Base
    def render
      if node.children.all? { |c| c.name.to_sym == :img || c.inner_html == "" }
        node.children.select { |c| c.name.to_sym == :img }.each do |img|
          SUBCLASSES[:img].render(img, pdf)
        end
      else
        html = clean_html(node.inner_html)
        font :primary
        text html, inline_format: true
        move_down 10
      end
    end
  end
end
