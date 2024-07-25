extends Node


const CHICKEN = preload("res://scenes/units/chicken.tscn")

@onready var hex_grid = $HexGrid


# Called when the node enters the scene tree for the first time.
func _ready():
	# Grid
	#hex_grid.generate_grid(data)
	
	# Chicken
	var chicken = CHICKEN.instantiate()
	add_child(chicken)
	chicken.translate(Vector3(0, 1, 0))	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
