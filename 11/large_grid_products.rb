def solve
  Dir.chdir(File.dirname(__FILE__))
  file = File.new("large_grid_product.txt", "r")
  data = []
  while (line = file.gets)
    chunks = line.to_s.split(' ')
    ind_chunks = 0
    chunks.each do |num|
      if chunks[ind_chunks][0] == '0'
        chunks[ind_chunks] = chunks[ind_chunks][1, ]
      end
      ind_chunks += 1
    end
    data.push(chunks)
  end

  directions = [[1, 1], [1, 0], [1, -1], [0, 1], [0, -1], [-1, 1], [-1, 0], [-1, -1]]
  x = 0
  y = 0
  max_product = 0
  data.each do |row|

    x = 0
    row.each do |cell|

      directions.each do |d|
        running_product = 1
        (0..3).each do |i|
          cur_x = x + d[0] * i
          cur_y = y + d[1] * i
          if cur_x < data[0].length and cur_y < data.length
            running_product = running_product * Integer(data[cur_x][cur_y])
          end
        end

        max_product = [max_product, running_product].max
      end

      x = x + 1
    end
    y = y + 1

  end

  print "Max product is ", max_product


end

solve
