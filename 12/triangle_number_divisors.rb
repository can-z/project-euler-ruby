class TriangleNumberDivisors

  def solve
     triangle_number = 1
     i = 1
     while (true)


       divisors = find_divisors(triangle_number)
       if divisors > 500
         print 'Found: ', i, ' = ', triangle_number
         return triangle_number
       end
       i += 1
       triangle_number += i

     end
  end


  def find_divisors(num)
    ret = 0
    sqrt = Math.sqrt(num)
    (1..sqrt).each do |i|
      if num % i == 0
        ret += 2
      end
    end

    if sqrt * sqrt == num
      ret -= 1
    end

    return ret
  end
end

c = TriangleNumberDivisors.new()
puts c.solve()


