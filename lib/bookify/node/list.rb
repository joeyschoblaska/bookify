require_relative "base"

module Bookify::Node
  class List < Base
    PADDING = 3

    def render
      font :primary

      move_up PADDING

      data = node.css("li").each_with_index.map { |li, i|
        [bullet(i), li.inner_html.strip]
      }

      table(data) do
        cells.inline_format = true
        cells.borders = []
        cells.padding = PADDING
      end

      move_down 10
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
