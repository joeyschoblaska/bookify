module Bookify::Node
  class List < Base
    def render
      font :primary

      move_up 5

      data = node.css("li").each_with_index.map do |li, i|
        [bullet(i), li.inner_html.strip]
      end

      table(data) do
        cells.inline_format = true
        cells.borders = []
        cells.padding = 5
      end

      move_down 5
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
