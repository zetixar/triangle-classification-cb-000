class Triangle
  attr_accessor :sides

  def initialize first, second, third
    self.sides = [first, second, third]
  end

  def unvalid_triangle?
    self.sides.any? { |side| side <= 0 } || (self.sides[0] + self.sides[1] <= self.sides[2] || self.sides[0] + self.sides[2] <= self.sides[1] ||
       self.sides[1] + self.sides[2] <= self.sides[0])
  end

  def kind
    raise TriangleError if unvalid_triangle?
    if sides[0] == sides[1] || sides[0] == sides[2] || sides[1] == sides[2]
      if sides[0] == sides[1] && sides[1] == sides[2]
        :equilateral
      else
        :isosceles
      end
    else
      :scalene
    end
  end
end

class TriangleError < StandardError; end
