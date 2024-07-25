class_name  HexGridData
extends Resource

@export_range (2, 20, 1) var grid_size := 16
var grid_dict: Dictionary = {}

func _init():
	_generate_grid_dictionary()

func _generate_grid_dictionary():

	grid_dict.clear()
	for y in range(grid_size):
		for x in range(grid_size):
			if x in range(6, 9) and y in range(6, 9):			
				grid_dict[Vector2i(x, y)] = {"id": 2}
			elif x in range(1, 15) and y in range(1, 15):			
				grid_dict[Vector2i(x, y)] = {"id": 3}
			else:
				grid_dict[Vector2i(x, y)] = {"id": 1}
			

