require_relative 'trie' 

class TrieBuilder
  attr_reader :root

  def initialize
    @root = Trie.new
  end

  def build(words)
    words.each do |word|
      add(word)
    end

    root
  end

  private

  def add(word)
    current_node = root

    word.chars.each do |ch|
      if current_node.children.key?(ch)
        current_node = current_node.children[ch]
      else
        current_node = current_node.add_child(ch, Trie.new)
      end
    end

    current_node.is_end_of_word
  end
end
