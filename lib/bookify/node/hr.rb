module Bookify::Node
  class Hr < Base
    def render
      stroke { horizontal_rule }
      move_down 10
    end
  end
end
