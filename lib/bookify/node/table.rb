module Bookify::Node
  class Table < Base
    def render
      table table_data, header: true, width: bounds.width do
        cells.borders = []

        row(0).borders = [:top, :bottom]
        row(0).border_top_width = 0.5
        row(0).border_bottom_width = 0.5
        row(0).font_style = :bold

        row(-1).borders = [:bottom]
        row(-1).border_bottom_width = 0.5

        cells.columns(0).padding = [5, 5, 5, 0]
        cells.columns(-1).padding = [5, 0, 5, 5]
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
