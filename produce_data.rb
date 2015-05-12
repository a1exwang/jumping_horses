
def near(a, b)
  x = a.to_i / 10
  y = a.to_i % 10
  i = b.to_i / 10
  j = b.to_i % 10
  x - i != 0 && y - j != 0 && ((x-i).abs + (y-j).abs) == 3
end
def construct_table(size)
  table = {}
  size.times do |x|
    size.times do |y|
      if (x + y) % 2 == 0
        line = {}
        size.times do |i|
          size.times do |j|
            if (i + j) % 2 == 1 && near("#{x}#{y}", "#{i}#{j}")
              line["#{i}#{j}"] = 1
            end
          end
        end
        table["#{x}#{y}"] = line if line.keys.count > 0
      end
    end
  end
  table
end