local triangle = {}

function triangle.kind(a, b, c)
    if (a <= 0 or b <= 0 or c <= 0) then
      error('Input Error')
    end

    if (not ((a+b) >= c and (b+c) >= a and (a+c) >= b)) then
      error('Input Error')
    end
    
    if (a == b and b == c) then
      return 'equilateral'
    end

    if ( a == b or b == c or c == a) then
      return 'isosceles'
    end
    
    return 'scalene'
end

return triangle
