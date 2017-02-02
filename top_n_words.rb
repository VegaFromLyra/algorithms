def extract_words(sentence)
  delimiters = /[\s,',,?]/
  sentence.split(delimiters)
end

def frequency_map(sentence)
  result = {}
  
  extract_words(sentence).each do |word|
    word = word.downcase

    if result.key?(word)
      result[word] += 1
    else
      result[word] = 1
    end
  end
  
  result
end

def top_n_words(sentence, n:)      
  frequency_map(sentence)
    .sort_by { |k, v| v }
    .reverse!
    .map { |k, v| k }
    .take(n)
end

input = "The game of life is like the Game of thrones"

top_n_words(input, n: 3).each { |item| puts item }