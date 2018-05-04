# Utility for autotiling.

@simple_tileset = {
  nw: 5,
  w: 6,
  c: 7,
  n: 8,
  ne: 9,
  inw: 10,
  ine: 11,
  ise: 12,
  isw: 13,
  e: 14,
  se: 15,
  s: 16,
  sw: 17
}

def simple_auto!(map, tileset=@simple_tileset)
  vals = tileset.values
  map.each_with_index do |row, r|
    next if row == nil
    row.each_with_index do |cell, c|
      next if cell == nil
      if vals.include? cell
        neighbors = {nw: nil,
                     n: nil,
                     ne: nil,
                     e: nil,
                     se: nil,
                     s: nil,
                     sw: nil,
                     w: nil}
        if r > 0
          
        end
        row[c] = process_cell(tileset, neighbors)
      end
    end
  end
  map
end

def process_cell(tileset, neighbors)
  cell = tileset[:c]
end

