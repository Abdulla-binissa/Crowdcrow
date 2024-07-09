class_name Tile
extends Node3D

signal tile_clicked(tile)

var models = {
	1: preload("res://assets/models/environment/tiles/hex_forest.glb"),
	2: preload("res://assets/models/environment/tiles/hex_rock.glb"),
	3: preload("res://assets/models/environment/tiles/hex_sand.glb"),
}

var coordinates := Vector2i.ZERO
var tile_id := 1

@onready var model = $Model
func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			tile_clicked.emit(self)

func update_tile():
	# Free the current model if it exists
	if model:
		model.queue_free()

	# Instance the new model based on the tile_id
	if tile_id in models:
		model = models[tile_id].instantiate()
		model.rotate_y(deg_to_rad(90))
		add_child(model)
	else:
		print("Invalid tile_id: %d" % tile_id)
