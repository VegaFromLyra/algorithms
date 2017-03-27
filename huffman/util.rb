class Util
  class << self
    def frequency_map(sentence)
      output = {}

      sentence.chars.each do |char|
        if output.key?(char)
          output[char] += 1
        else
          output[char] = 1
        end
      end

      output
    end
  end
end
