module Bookify::Node
  class Div < Base
    def render
      html_classes = (node.attr(:class) || "").split(" ")

      if html_classes.include?("page-break")
        if bounds.left == 0.0
          2.times { bounds.move_past_bottom }
        else
          bounds.move_past_bottom
        end
      elsif html_classes.include?("section-break")
        bounds.move_past_bottom
      end
    end
  end
end
