class Node
  include Comparable

  attr_reader :character,
              :freq,
              :left_child,
              :right_child

  def initialize(
    freq:,
    character: nil,
    left_child: nil,
    right_child: nil
  )
    @character = character
    @freq = freq
    @left_child = left_child
    @right_child = right_child
  end

  def <=>(other)
    other.freq <=> freq
  end
end
