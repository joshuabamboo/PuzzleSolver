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

  def sort_by_occurance
    character_count.sort_by {|_char,count| count}.reverse.to_h
  end

  def delineate
    sort_by_occurance.select{|char,count| char if count > character_count[delineator.to_sym]}
  end

  def solve
    count_character_occurances
    word_hash = delineate
    word = word_hash.keys.join
    "The secret word is '#{word}' :)"
  end
end