require './produce_data'

def clone_table(table)
  ret = {}
  table.keys.each do |line|
    this_line = {}
    table[line].keys.each do |item|
      this_line[item] = table[line][item]
    end
    ret[line] = this_line if this_line.keys.count != 0
  end
  ret
end
def get_adjacents(table, pos)
  ret = {}
  table.keys.each do |line|
    if line == pos
     return table[line]
    else
      table[line].keys.each do |item|
        if item == pos
          ret[line] = 1
        end
      end
    end
  end
  ret
end
def del_node(_table, pos)
  table = clone_table(_table)
  table.keys.each do |line|
    if line == pos
      table.delete line
      return table
    else
      table[line].keys.each do |item|
        if item == pos
          table[line].delete item
        end
      end
    end
  end
  table
end
$max = 0
def find_way(table, size, pos, waypoints)
  adjs = get_adjacents(table, pos)
  t = del_node(table, pos)
  waypoints.push pos
  if waypoints.count > $max
    $max = waypoints.count
    puts waypoints.count
    puts waypoints.to_s
  end

  return true if waypoints.count == size * size && near(waypoints[0], waypoints[-1])

  adjs.keys.each do |p|
    return true if find_way(t, size, p, waypoints)
  end

  waypoints.pop
  false
end

SIZE = 6
table = construct_table(SIZE)
#puts get_adjacents(table, '12')
puts table
waypoints = []
puts find_way(table, SIZE, '00', waypoints)
puts waypoints.to_s