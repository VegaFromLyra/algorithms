require_relative 'trie_builder'

class MatchPrefix
  def initialize(words:)
    @words = words
    @root = build_trie
  end

  def process!(prefix:)
    finder_node = match(prefix)
    traverse_depth_first(finder_node, prefix)
  end

  private

  attr_reader :words,
              :root

  def build_trie
    TrieBuilder.new.build(words)
  end

  def match(prefix)
    current_node = root

    prefix.chars.each do |char|
      if current_node.children.key?(char)
        current_node = current_node.children[char]
      else
        return nil
      end
    end

    current_node
  end

  def traverse_depth_first(node, prefix)
    return [] if node.nil?
    return [prefix] if node.children.keys.empty?

    result = []

    if node.is_end_of_word?
      result << prefix
    end

    node.children.keys.each do |char|
      result << traverse_depth_first(node.children[char], prefix + char)
    end

    result.flatten
  end
end
