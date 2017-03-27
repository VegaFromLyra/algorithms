class PriorityQueue
  def initialize
    @elements = []
  end

  def << (element)
    elements << element
    balance
    element
  end

  def pop
    top = elements.delete_at(0)
    balance
    top
  end

  def empty?
    elements.empty?
  end

  def size
    elements.size
  end

  private

  def balance
    (0..halfway_point).each do |index|
      parent = index
      left = 2 * index + 1
      right = 2 * index + 2

      if !elements[left].nil? && elements[parent] < elements[left]
        swap(parent, left)
      end

      if !elements[right].nil? && elements[parent] < elements[right]
        swap(parent, right)
      end
    end

    true
  end

  def halfway_point
    if empty?
      0
    else
      (elements.size - 1) / 2
    end
  end

  def swap(first, second)
    temp = elements[first]
    elements[first] = elements[second]
    elements[second] = temp
  end

  attr_reader :elements
end
