class Trie
  attr_reader :data,
              :children

  def initialize
    @data = ""
    @children = {}
    @end_of_word = false 
  end

  def add_child(character, node)
    children.merge!(character => node)
    children[character]
  end

  def is_end_of_word?
    @end_of_word
  end

  def is_end_of_word
    @end_of_word = true
  end
end
