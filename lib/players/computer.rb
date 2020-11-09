module Players
  class Computer < Player

    def move(board)
      if board.taken?("5") == false
        5
      elsif board.taken?("1") || board.taken?("3") || board.taken?("7") || board.taken?("9")

      end
    end

  end
end
