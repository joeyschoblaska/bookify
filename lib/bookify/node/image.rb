require_relative "base"
require "open-uri"

module Bookify::Node
  class Image < Base
    def render
      options = {
        position: html_classes.include?("center") ? :center : :left,
        fit: [bounds.width, -1]
      }

      image image_from_node(node), options
      move_down 15
    end

    private

    def image_from_node(node)
      src = node.attr(:src)
      /^https?\:\/\//.match?(src) ? URI.open(src) : src
    end
  end
end
