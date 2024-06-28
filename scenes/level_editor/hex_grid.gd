extends Node3D

const TILE_SIZE := 2.0
const TILE = preload("res://scenes/level_editor/tile.tscn")
@export var hex_grid_data: HexGridData

func _ready() -> void:
	_generate_grid(hex_grid_data)
	
func _generate_grid(data: HexGridData):
	for key in data.grid_dict.keys():
		var x = key.x
		var y = key.y
		var id = data.grid_dict[key]['id']
		
		# Calculate the position of the tile base on the coordinate
		var tile_coordinates := Vector3.ZERO
		tile_coordinates.x = x * TILE_SIZE * cos(deg_to_rad(30))
		tile_coordinates.z = y * TILE_SIZE + (0 if x % 2 == 0 else TILE_SIZE / 2)
		
		# Instantiate the tile and set its position
		var tile = TILE.instantiate()
		add_child(tile)
		tile.translate(Vector3(tile_coordinates.x, tile_coordinates.y, tile_coordinates.z))

		# Set the tile's coordinates
		tile.coordinates = Vector2(x, y)
