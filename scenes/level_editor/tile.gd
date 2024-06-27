class_name Tile
extends Node3D

var coordinates := Vector2.ZERO

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Tile at coordinates ", coordinates, " clicked")
