module Bookify::Node
  class Div < Base
    def render
      html_classes = (node.attr(:class) || "").split(" ")

      if html_classes.include?("page-break")
        bounds.move_past_bottom

        until bounds.left == 0.0
          bounds.move_past_bottom
        end
      elsif html_classes.include?("section-break")
        bounds.move_past_bottom
      end
    end
  end
end
