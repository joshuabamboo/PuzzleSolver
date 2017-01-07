class PuzzleSolver
  attr_accessor :scrammbled_chars, :puzzle, :delineator, :character_count

  def initialize(scrammbled_string, puzzle, delineator='_')
    @scrammbled_chars = scrammbled_string.split('')
    @puzzle = puzzle.split('')
    @delineator = delineator
  end
end