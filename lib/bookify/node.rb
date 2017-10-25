module Bookify::Node
  SUBCLASSES = {
    blockquote: Blockquote,
    div: Div,
    h1: H1,
    h2: H2,
    h3: H3,
    h4: H4,
    h5: H4,
    h6: H4,
    hr: Hr,
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
