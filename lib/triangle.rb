class Triangle
  
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    real_triangle
    if side1 == side2 && side1 == side3 
      :equilateral
    elsif side1 == side2 || side1 == side3 || side3 == side2
      :isosceles
    elsif side1 != side2 && side2 != side3
      :scalene
    else
      begin
        raise TriangleError
      rescue TriangleError => error
        puts error.message
      end
    end
  end

  def not_zero?
    side1 > 0 && side2 > 0 && side3 > 0 
  end

  def triangle_inequality?
    side1 + side2 > side3 && side2 + side3 > side1 && side3 + side1 > side2
  end

  def real_triangle
    raise TriangleError unless not_zero? && triangle_inequality?
  end

  #def triangle_type 
  #  if not_zero? == false && triangle_inequality? == false 
  #    kind
  #  else 
  #  raise TriangleError
  #  end
  #end

  
  
  class TriangleError < StandardError
    #def message
    #  "Your triangle is a fake!"
    #end
  end

end
