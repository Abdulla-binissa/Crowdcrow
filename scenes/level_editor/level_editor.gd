extends Node3D

var selected_tile_id := 1

@onready var hex_grid = $HexGrid

func _ready():
		# Get all TileOption nodes
	var tile_options = get_tree().get_nodes_in_group("tile_options")
	
	# Connect the tile_selected signal for each TileOption
	for tile_option in tile_options:
		tile_option.connect('tile_selected', _on_tile_selected)
	
	# Connect the hex_grid signal to level_editor
	hex_grid.connect('hex_grid_interacted', _hex_grid_tile_selected)


func _on_tile_selected(tile_id):
	selected_tile_id = tile_id
	print("Tile selected with ID: %d" % tile_id)

func _hex_grid_tile_selected(tile):
	print("Tile at coordinates ", tile.coordinates, " clicked")

func _update_hex_grid(data: HexGridData):
	hex_grid.generate_grid(data)
