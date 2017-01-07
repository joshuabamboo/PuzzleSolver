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

  def top_char_occurances
    sorted_occurances = character_count.values.sort {|a,b| b<=>a}
    sorted_occurances.delete_if {|occurance| occurance <= character_count[delineator.to_sym]}
  end

  def convert_values_to_keys(values)
    values.collect {|value| character_count.key(value)}
  end

  def solve
    self.count_character_occurances
    values_greater_than_delineator = self.top_char_occurances
    secret_chars = convert_values_to_keys(values_greater_than_delineator)
    "The secret word is '#{secret_chars.join}' :)"
  end
end