module Players
  class Computer < Player

    def move(board)
      if board.taken?("5") == false
        "5"
      else
        best_move(board)
      end
    end

    def best_move(board)
      win(board) || block(board) || corner(board) || random
    end

    def win(board)

    end

    def corner(board)
      corners = [1,3,7,9]
      corners.find { |corner| board.taken?(corner) == false }
    end

    def random
      (1..9).to_a.sample
    end


  end
end
