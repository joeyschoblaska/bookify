require_relative "base"

module Bookify::Node
  class Table < Base
    def render
      font :primary

      options = {
        header: true,
        width: bounds.width,
        row_colors: ["FFFFFF", "EEEEEE"]
      }

      table table_data, options do
        cells.borders = []

        row(0).borders = [:bottom]
        row(0).border_bottom_width = 0.5
        row(0).font_style = :bold

        cells.padding = 5
      end

      move_down 15
    end

    def table_data
      node.css("tr").map do |tr|
        tr.css("th, td").map do |td|
          decode_html(td.inner_html.strip)
        end
      end
    end
  end
end
