#require 'pry'
class Triangle
  # write code here

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    #examples: 2, 3, 4
    sides = [@side1, @side2, @side3]
    uniques = sides.uniq
    num_of_uniques = uniques.size
    sorted_sides = sides.sort

    #binding.pry
    if sorted_sides[0] + sorted_sides[1] <= sorted_sides[2] || sides.any? {|n| n <= 0}
      begin
        raise TriangleError
      rescue TriangleError => error
        error.message
      end
    elsif num_of_uniques == 1
      return :equilateral
    elsif num_of_uniques == 2
      return :isosceles
    else
      return :scalene
    end
  end


end

class TriangleError < StandardError
  def message
    "Invalid dimensions."
  end
end
puts Triangle.new(0,0,0).kind
