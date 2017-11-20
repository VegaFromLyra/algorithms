require "pry"

module Color
  WHITE = "white"
  BLACK = "black"
end

class Ant
  attr_reader :direction

  def initialize
    @direction = :north
  end

  def change_direction(direction)
    @direction = direction
  end
end

class Cell
  attr_accessor :color

  def initialize(color: Color::WHITE)
    @color = color
  end

  private

  attr_reader :ant
end

class Game
  def initialize(n)
    @board = Array.new(n) { Array.new(n, Cell.new) }
    @ant = Ant.new
    @current_row = n / 2
    @current_column = n / 2
    @current_position = @board[@current_row][@current_column]
  end

  def display
    board.count.times do |row|
      board[row].count.times do |column|
        print board[row][column].color + " "
      end
      puts ""
    end
  end

  def play(turns:)
    display
    turns.times do |turn|
      puts "Playing turn #{turn + 1}"
      if @current_position.color == Color::WHITE
        @current_position.color = Color::BLACK
        if ant.direction == :north
          ant.change_direction(:east)
          @current_column += 1
        elsif ant.direction == :east
          ant.change_direction(:south)
          @current_row += 1
        elsif ant.direction == :south
          ant.change_direction(:west)
          @current_column -= 1
        else
          ant.change_direction(:north)
          @current_row -= 1
        end
      else
        @current_position.color = Color::WHITE
        if ant.direction == :north
          ant.change_direction(:west)
          @current_column -= 1
        elsif ant.direction == :east
          ant.change_direction(:north)
          @current_row -= 1
        elsif ant.direction == :south
          ant.change_direction(:east)
          @current_column += 1
        else
          ant.change_direction(:south)
          @current_row += 1
        end
      end

      @current_position = board[@current_row][@current_column]
      display
    end
  end

  private

  attr_reader :board, :ant
end

Game.new(3).play(turns: 5)
