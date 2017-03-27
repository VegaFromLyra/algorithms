require_relative 'util'
require_relative 'node'
require_relative 'priority_queue'

class Main
  MIN_NODES_FOR_TREE = 2

  def build_huffman_tree(input)
    priority_queue = PriorityQueue.new

    Util.frequency_map(input).map do |key, value|
      priority_queue << Node.new(
        character: key,
        freq: value
      )
    end

    while priority_queue.size >= MIN_NODES_FOR_TREE
      left_child = priority_queue.pop
      right_child = priority_queue.pop

      freq = left_child.freq + right_child.freq
      priority_queue << Node.new(
        freq: freq,
        left_child: left_child,
        right_child: right_child
      )
    end

    puts "Frequency of root node is #{priority_queue.pop.freq}
  end

  def encode
    raise NotImplementedError
  end

  def decode
    raise NotImplementedError
  end
end
