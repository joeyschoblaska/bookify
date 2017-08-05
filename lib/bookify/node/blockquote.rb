module Bookify::Node
  class Blockquote < Base
    def render
      font :primary

      bounding_box [bounds.left + 10, cursor], width: bounds.width - 10 do
        node.css("p").each do |p|
          text p.inner_html.strip, inline_format: true
          move_down 10
        end
      end
    end
  end
end
