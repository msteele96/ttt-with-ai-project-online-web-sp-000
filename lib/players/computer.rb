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
      winning_combo = complete_combo?(board, self.token)
      if winning_combo && winning_combo.count{|index| board.position(index+1) == self.token} == 2
        winning_combo.detect{|index| !board.taken?(index)}
      end
    end

    def complete_combo?(board, token)
    Game::WIN_COMBINATIONS.detect do |combo|
      (
        (board.cells[combo[0]] == token && board.cells[combo[1]] == token) &&
        !board.taken?(combo[2])
      ) ||
      (
        (board.cells[combo[1]] == token && board.cells[combo[2]] == token) &&
        !board.taken?(combo[0])
      ) ||
      (
        (board.cells[combo[0]] == token && board.cells[combo[2]] == token) &&
        !board.taken?(combo[1])
      )
    end

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
