require_relative "base"

module Bookify::Node
  class Paragraph < Base
    def render
      if node.children.all? { |c| c.name.to_sym == :img || c.text == "\n" }
        node.children.select { |c| c.name.to_sym == :img }.each do |img|
          SUBCLASSES[:img].render(img, pdf)
        end
      else
        options = {
          inline_format: true,
          align: html_classes.include?("center") ? :center : :left
        }

        html = clean_html(node.inner_html.tr("\n", " "))

        font :primary do
          text html, options
        end

        move_down 10
      end
    end
  end
end
