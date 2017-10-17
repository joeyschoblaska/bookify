module Bookify::Node
  class Image < Base
    def render
      options = {
        position: html_classes.include?("center") ? :center : :left,
        fit: [bounds.width, bounds.height]
      }

      image node.attr(:src), options
      move_down 15
    end
  end
end
