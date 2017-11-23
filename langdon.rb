require "pry"

module Color
  WHITE = false
  BLACK = true
end

class Ant
  attr_reader :direction

  module Direction
    NORTH = 0
    EAST = 1
    SOUTH = 2
    WEST = 3
  end

  def initialize
    @direction = Direction::NORTH
  end

  def change_direction(rotation:)
    if rotation == :clockwise
      @direction =  (@direction + 1) % 4
    elsif rotation == :counter_clockwise
      @direction = (@direction + 3) % 4
    else
      raise StandardError.new "Invalid rotation"
    end
  end
end

class Cell
  attr_accessor :color, :ant

  def initialize(color: Color::WHITE)
    @color = color
  end

  def toggle_color!
    @color = !@color
  end
end

class Game
  def initialize(n)
    @board = Array.new(n) { Array.new(n, Cell.new) }
    @current_row = n / 2
    @current_column = n / 2
    @ant = Ant.new
  end

  def display
    board.count.times do |row|
      board[row].count.times do |column|
        if board[row][column].color
          print "black "
        else
          print "white "
        end
      end
      puts ""
    end
  end

  def play(turns:)
    display
    turns.times do |turn|
      puts "Playing turn #{turn + 1}"
      move_ant
      display
    end
  end

  def current_cell
    @board[@current_row][@current_column]
  end

  def move_ant
    if current_cell.color
      rotation = :counter_clockwise
    else
      rotation = :clockwise
    end

    @ant.change_direction(rotation: rotation)

    current_cell.toggle_color!

    case ant.direction
    when Ant::Direction::NORTH
      @current_row -= 1
    when Ant::Direction::EAST
      @current_column += 1
    when Ant::Direction::SOUTH
      @current_row += 1
    when Ant::Direction::WEST
      @current_column -= 1
    end
  end

  private

  attr_reader :board, :ant
end

Game.new(3).play(turns: 5)
