class Board
  def initialize(args)
    @board = []
    args.each do |r|
      @board << r.split(" ")
    end
  end

  def winner

    @board.size.times do |row|
      if check_x_win?("X", row, 0, [])
        return "X"
      end
    end

    @board.first.size.times do |col|
      if check_0_win?("O", 0, col, [])
        return "O"
      end
    end

    ""
  end

  def check_0_win?(player, row, col, visited = [])
    visited_key = "#{row} - #{col}"
    return false if visited.include?(visited_key)

    visited << visited_key

    return false unless @board[row]

    r = @board[row][col]
    return false unless r == player

    return true if is_bottom(row)

    # -> Right move
    return true if check_0_win?(player, row, col + 1, visited)

    # -> left move
    return true if check_0_win?(player, row, col - 1, visited)

    # -> Right Up move
    return true if check_0_win?(player, row - 1, col + 1, visited)

    # -> Right Up move
    return true if check_0_win?(player, row - 1, col, visited)

    # -> down left
    return true if check_0_win?(player, row + 1, col - 1, visited)

    # -> down right
    return true if check_0_win?(player, row + 1, col, visited)
  end

  def check_x_win?(player, row, col, visited = [])
    visited_key = "#{row} - #{col}"
    return false if visited.include?(visited_key)

    visited << visited_key

    return false unless @board[row]

    r = @board[row][col]
    return false unless r == player

    return true if is_right(col)

    # -> Right move
    return true if check_x_win?(player, row, col + 1, visited)

    # -> left move
    return true if check_x_win?(player, row, col - 1, visited)

    # -> Right Up move
    return true if check_x_win?(player, row - 1, col + 1, visited)

    # -> Right Up move
    return true if check_x_win?(player, row - 1, col, visited)

    # -> down left
    return true if check_x_win?(player, row + 1, col - 1, visited)

    # -> down right
    return true if check_x_win?(player, row + 1, col, visited)
  end

  def is_bottom(pos)
    pos == @board.size - 1
  end

  def is_right(pos)
    pos == @board.first.size - 1
  end
end
