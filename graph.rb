

require_relative 'edge_list'
require 'pry'

class AdjacencyMatrix
  attr_reader :names, :adj_matrix

  def initialize(array)
    @lookup_hash = {}
    matrix_size = matrix_sizer(array)
    @adj_matrix = Array.new(matrix_size){ Array.new(matrix_size, "nil")}
    build_matrix(array)
    print_matrix
  end

  def matrix_sizer(array)
    array.each do |item|
        @lookup_hash[item[0].id] = item[0].name
        @lookup_hash[item[1].id] = item[1].name
    end
    @lookup_hash.keys.count
  end

  def build_matrix(array)
    array.each do |ele|
      @adj_matrix[ele[0].id][ele[1].id] = ele[2]
    end
  end

  def print_matrix
    print "     "
    @lookup_hash.keys.sort.each do |key|
      print build_name(@lookup_hash[key])
    end
    print "\n"
    @adj_matrix.each_with_index do |row, row_index|
      print build_name(@lookup_hash[row_index])
      row.each do |item|
        print build_square(item)
      end
      puts
    end
  end

  def build_square(input)
   "|" + "#{input}".center(3) + "|"
  end

  def build_name(input)
    "|" + "#{input[0..2].center(3)}" + "|"
  end

end

AdjacencyMatrix.new(EDGE_LIST)
