module Bookify
  module Sections
    InvalidLevel = Class.new(StandardError)

    @@sections = []

    def self.add(level, title, dest)
      case level
      when :h1
        @@sections << {title: title, dest: dest, subsections: []}
      when :h2
        return if @@sections.empty?
        @@sections.last[:subsections] << {title: title, dest: dest}
      else
        raise InvalidLevel, level
      end
    end

    def self.all
      @@sections
    end

    def self.current_h1_title
      @@sections.any? ? @@sections.last[:title] : nil
    end

    def self.reset
      @@sections = []
    end
  end
end
