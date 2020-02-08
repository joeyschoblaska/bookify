require_relative "base"

module Bookify::Node
  class Blockquote < Base
    def render
      font :primary

      data = node.css("p").map { |p| [" ", p.inner_html.strip] }

      table(data) do
        cells.inline_format = true
        cells.borders = []
        cells.padding = 5

        column(0).borders = [:left]
        column(0).border_width = 0.5
      end

      move_down 10
    end
  end
end
