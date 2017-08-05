module Bookify::Node
  class List < Base
    def render
      font :primary

      node.css("li").each_with_index do |li, i|
        bounding_box [bounds.left, cursor], width: bounds.width do
          text bullet(i)
          move_cursor_to bounds.top

          bounding_box [bounds.left + 12, cursor], width: bounds.width - 12 do
            text li.inner_html.strip
          end
        end

        move_down 10
      end
    end

    def bullet(index)
      if node.name == "ul"
        "•" # is there a better way to render this?
      else
        "#{index + 1}."
      end
    end
  end
end
