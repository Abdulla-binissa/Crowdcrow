extends Node3D

const TILE_SIZE := 2.0
const TILE = preload("res://scenes/level_editor/tile.tscn")
@export_range (2, 20, 1) var grid_size := 16

func _ready() -> void:
	_generate_grid()
	
func _generate_grid():
	for x in range(grid_size):
		var tile_coordinates := Vector3.ZERO
		tile_coordinates.x = x * TILE_SIZE * cos(deg_to_rad(30))
		tile_coordinates.z = 0 if x % 2 == 0 else TILE_SIZE / 2
		for y in range(grid_size):
			var tile = TILE.instantiate()
			add_child(tile)
			tile.translate(Vector3(tile_coordinates.x, tile_coordinates.y, tile_coordinates.z))
			tile_coordinates.z += TILE_SIZE

			tile.coordinates = Vector2(x, y)
