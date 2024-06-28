extends Node3D

func _ready():
		# Get all TileOption nodes
	var tile_options = get_tree().get_nodes_in_group("tile_options")
	
	# Connect the tile_selected signal for each TileOption
	for tile_option in tile_options:
		tile_option.connect('tile_selected', _on_tile_selected)

func _on_tile_selected(tile_id):
	print("Tile selected with ID: %d" % tile_id)
