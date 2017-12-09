require "forwardable"

class Set
  LOAD_FACTOR = 0.75

  def initialize(collection = [], total_capacity: 16)
    @total_capacity = total_capacity
    @map = Array.new(total_capacity) { Array.new }
    @used_capacity = collection.to_a.count

    collection.each do |item|
      map[position(item)] << item
    end
  end

  def load_factor
    used_capacity.to_f / total_capacity
  end

  def add(item)
    entries = map[position(item)]
    if entries.empty? || !entries.any? { |entry| entry == item }
      map[position(item)] << item
    end

    @used_capacity += 1
  end

  def each
    @map.flatten.each do |item|
      yield item
    end
  end

  private

  attr_accessor :total_capacity, :map, :used_capacity

  def position(item)
    hash_key = item.hash
    hash_key.abs % total_capacity
  end
end
