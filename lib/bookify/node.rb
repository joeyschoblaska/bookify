module Bookify::Node
  SUBCLASSES = {
    blockquote: Blockquote,
    h1: H1,
    h2: H2,
    img: Image,
    ol: List,
    p: Paragraph,
    ul: List
  }

  def self.render(node, pdf)
    if subclass = SUBCLASSES[node.name.to_sym]
      subclass.render(node, pdf)
    else
      node.children.each { |c| render(c, pdf) }
    end
  end
end
