require_relative "tilemap_to_2d_array"
require_relative "autotile"

puts "Paste in the tile data:"

@tile_data = gets()
@tile_hash = to_hashed(@tile_data)
@tile_map = to_2d_array(@tile_hash)
simple_auto!(@tile_map)
pretty_print(@tile_map)
