require 'rspec'
require 'adjacency_matrix'
require 'person'

describe AdjacencyMatrix do
  # let(:a) { AdjacencyMatrix.new }
  let(:el) { 
    [
      [Person.new(1 ,'Harry'), Person.new(2 ,'Alice'), 2],
      [Person.new(1 ,'Harry'), Person.new(0 ,'Bob'), 9],
      [Person.new(2 ,'Alice'), Person.new(0 ,'Bob'), 11]
    ]
  }
  let(:matrix) {
    [
      [nil, nil, nil],
      [9,   nil,   2],
      [11,  nil, nil]
    ]
  }

  describe '#new' do
    it "accepts an edge list" do
      expect{AdjacencyMatrix.new(el)}.not_to raise_error
    end

    it "creates a matrix based on the dimensions given" do
      am = AdjacencyMatrix.new(el)
      expect(am.matrix(el).length).to be(4)
    end

    it "converts the edge list into a matrix" do
      am = AdjacencyMatrix.new(el)
      (am.matrix).to eq(matrix)
    end
  end

  describe '#get_dimensions' do
    it 'returns the highest id in the edge_list plus one' do
      am = AdjacencyMatrix.new(el)
      expect(am.get_dimensions(el)).to equal(3)
    end
  end
end
