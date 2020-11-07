class Board

  attr_accessor :cells, :token

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def input_to_index(input)
    index = (input.to_i - 1)
  end

  def position(input)
    index = input_to_index(input)
    if index >= 0 && index <= 8
      @cells[index]
    end
  end

  def full?
    @cells.all? do |xo|
      xo == "X" || xo == "O"
    end
  end

  def update(input, player)
    index = input_to_index(input)
    @cells[index] = player.token
  end

  def taken?(input)
    index = input_to_index(input)
    @cells[index] != " "
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def turn_count
    counter = 0
    @cells.each do |turn|
      if turn == "O" || turn == "X"
        counter += 1
      end
    end
  return counter
  end

end
