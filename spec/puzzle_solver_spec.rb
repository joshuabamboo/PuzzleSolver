require "puzzle_solver"

describe PuzzleSolver do
  let(:a_puzzle) {PuzzleSolver.new("abct_", "cccccaaaattt__b")}
  let(:another_puzzle) {PuzzleSolver.new("f9&igsqza_", "gggggggggggggg9&iiiiiiizzaaaaffffffqzsssss____")}
  
  describe "#initialize" do
    context "with two arguments - the puzzle and the scrammbled chars - " do 
      it "creates readers for #scrammbled_chars and #puzzle" do 
        expect(a_puzzle).to respond_to(:scrammbled_chars, :puzzle)
      end

      it "converts string arguments to an array of elements" do 
        expect(a_puzzle.scrammbled_chars).to eq(['a','b','c','t','_'])
        expect(a_puzzle.puzzle).to eq(['c','c','c','c','c','a','a','a','a','t','t','t','_','_','b'])
      end

      it "sets a default #delineator" do 
        expect(a_puzzle.delineator).to eq('_')
      end
    end

    context "with three arguments" do
      it "changes the default #delineator" do 
        expect(PuzzleSolver.new('ab','abb+','+').delineator).to eq('+')
      end
    end
  end

  describe "#count_character_occurances" do 
    it "counts the number of times each character appears in the puzzle" do 
      expect(a_puzzle.count_character_occurances).to eq({c: 5, a: 4, t: 3, _: 2, b: 1})
    end
  end

  describe "#solve" do 
    it "prints the secret word" do 
      expect(a_puzzle.solve).to eq("The secret word is 'cat' :)")
      expect(another_puzzle.solve).to eq("The secret word is 'gifs' :)")
    end
  end
end