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
      win(board) || corner(board) || random
    end

    def win(board)
        Game::WIN_COMBINATIONS.find { |combo|
          (board.cells[combo[0]] == token) &&
          (board.cells[combo[1]] == token) &&
          (board.taken?[combo[2]] == false)
          ||
          (board.cells[combo[1]] == token) &&
          (board.cells[combo[2]] == token) &&
          (board.taken?[combo[0]] == false)
          ||
          (board.cells[combo[0]] == token) &&
          (board.cells[combo[2]] == token) &&
          (board.taken?[combo[1]] == false)}.find { |free| 
            board.taken?(free) == false }
    end

    def block(board)

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
