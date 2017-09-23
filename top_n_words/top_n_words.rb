def top_n_words(sentence, n_words)
  words = parse(sentence)
  frequency_map = build_freq_map(words)
  pick_top_n(frequency_map, n_words)
end

def parse(sentence)
  delimiters = /[.,?!':]/
  words = sentence.gsub(delimiters, "").split
  words.each { |word| word.downcase! }.sort
end

def build_freq_map(words)
  words.inject(Hash.new(0)) do |output, word|
    output[word] += 1
    output
  end
end

def pick_top_n(freq_map, n_words)
  freq_map
    .sort_by { |key, value| value }
    .reverse
    .map { |key, value| key }
    .take(n_words)
end

str = "Two vast and trunkless legs of stone Stand in the desert. Near them, on the sand, Half sunk, a shattered visage lies, whose frown, And wrinkled lip, and sneer of cold command, Tell that its sculptor well those passions read Which yet survive, stamped on these lifeless things, The hand that mocked them and the heart that fed: And on the pedestal these words appear: 'My name is Ozymandias, king of kings: Look on my works, ye Mighty, and despair!' Nothing beside remains. Round the decay Of that colossal wreck, boundless and bare The lone and level sands stretch far away."

puts top_n_words(str, 10)
