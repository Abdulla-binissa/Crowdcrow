extends Panel

@export_enum("Forest", "Rock", "Sand") var selected_texture: String = "Rock"
@export_enum("base", "detail") var selected_detail: String = "base"

var textures = {
	"Forest": {
		"base": {
			"src": preload("res://assets/images/hex_forest.png"),
			"id": 1
			}, 
		"detail": preload("res://assets/images/hex_forest_detail.png")
	},
	"Rock": {
		"base":	{
			"src": preload("res://assets/images/hex_rock.png"),
			"id": 2
			},
		"detail": preload("res://assets/images/hex_rock_detail.png")
	},
	"Sand": {
		"base": {
			"src": preload("res://assets/images/hex_sand.png"),
			"id": 3
			},
		"detail": preload("res://assets/images/hex_sand_detail.png")
	}
}

@onready var texture_rect = $TextureRect

func _ready():
	update_texture()

func update_texture():
	texture_rect.texture = textures[selected_texture][selected_detail]["src"]


func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print(textures[selected_texture][selected_detail]["id"])
