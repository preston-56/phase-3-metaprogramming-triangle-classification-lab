class Triangle
  # write code here
  #macro accessor
  attr_reader :a, :b, :c
  #initialize method
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  #define instance method
  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  #define instance method
  def not_zero?
    [a, b, c].all?(&:positive?)
  end

  def triangle_inequality?
    a + b > c && a + c > b && b + c > a
  end

  def validate_triangle
    raise TriangleError unless not_zero? && triangle_inequality?
  end

  class TriangleError < StandardError
  end
end
