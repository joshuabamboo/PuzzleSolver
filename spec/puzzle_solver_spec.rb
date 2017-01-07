require "puzzle_solver"

describe PuzzleSolver do
  let(:a_puzzle) {PuzzleSolver.new("abct_", "cccccaaaattt__b")}
  
  describe "#initialize" do
    context "given two arguments - the puzzle and the scrammbled chars - " do 
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

    context "given three arguments" do
      it "changes the default #delineator" do 
        expect(PuzzleSolver.new('ab','abb+','+').delineator).to eq('+')
      end
    end
  end
end