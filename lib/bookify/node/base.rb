module Bookify::Node
  class Base
    attr_accessor :node, :pdf

    FONTS = {
      h1: ["Book Antiqua", size: 18, style: :bold],
      h2: ["Book Antiqua", size: 13, style: :bold],
      h3: ["Book Antiqua", size: 12, style: :bold],
      h4: ["Book Antiqua", size: 11, style: :bold],
      primary: ["Book Antiqua", size: 10]
    }

    def self.render(node, pdf)
      new(node, pdf).render
    end

    def method_missing(method, *args, &block)
      pdf.send(method, *args, &block)
    end

    def initialize(node, pdf)
      self.node = node
      self.pdf = pdf
    end

    def html_classes(element = node)
      (element.attr(:class) || "").split(" ")
    end

    def font(name, &block)
      pdf.font(*FONTS[name], &block)
    end

    def clean_html(html)
      html.delete("\n").gsub(/\s+/, " ")
    end

    def decode_html(html)
      HTMLEntities.new.decode(html)
    end

    def break_if_close_to_bottom(tolerance = 125)
      bounds.move_past_bottom if pdf.y <= tolerance
    end

    def page_top
      pdf.bounds.parent.height + 50
    end
  end
end
