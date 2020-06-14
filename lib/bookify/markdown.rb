class Bookify::Markdown < Redcarpet::Render::HTML
  @@preprocessors = []
  @@postprocessors = []

  def preprocess(string)
    Bookify::Markdown.preprocessors.each do |preproc|
      string = preproc.call(string)
    end

    string
  end

  def postprocess(string)
    Bookify::Markdown.postprocessors.each do |postproc|
      string = postproc.call(string)
    end

    string
  end

  def self.add_preprocessor(preprocessor)
    @@preprocessors << preprocessor
  end

  def self.reset_preprocessors
    @@preprocessors = []
  end

  def self.preprocessors
    @@preprocessors
  end

  def self.add_postprocessor(postprocessor)
    @@postprocessors << postprocessor
  end

  def self.reset_postprocessors
    @@postprocessors = []
  end

  def self.postprocessors
    @@postprocessors
  end
end
