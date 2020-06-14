# https://github.com/prawnpdf/prawn/issues/1140

module Prawn
  class FontMetricCache
    def width_of(string, options)
      f = if options[:style]
        # override style with :style => :bold
        @document.find_font(@document.font.family, style: options[:style])
      else
        @document.font
      end

      encoded_string = f.normalize_encoding(string)

      key = CacheEntry.new(f.hash, options, encoded_string)

      @cache[key] ||= f.compute_width_of(encoded_string, options)

      length = @cache[key]

      character_count = @document.font.character_count(encoded_string)
      if character_count.positive?
        length += @document.character_spacing * (character_count - 1)
      end

      length
    end
  end
end
