module Bookify::Node
  class Div < Base
    def render
      html_classes = (node.attr(:class) || "").split(" ")
      bounds.move_past_bottom if html_classes.include?("page-break")
    end
  end
end
