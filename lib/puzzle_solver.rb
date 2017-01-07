class PuzzleSolver
  attr_accessor :scrammbled_chars, :puzzle, :delineator, :character_count

  def initialize(scrammbled_string, puzzle, delineator='_')
    @scrammbled_chars = scrammbled_string.split('')
    @puzzle = puzzle.split('')
    @delineator = delineator
  end

  def count_character_occurances
    count_hash = {}
    puzzle.each {|char| count_hash[char.to_sym] = puzzle.count(char)}
    @character_count = count_hash
  end
end