extends Node3D

class_name Chicken

# Variables
var current_hex_coordinate: Vector3
var next_hex_coordinate: Vector3
#var acceleration: float
var direction: int
var velocity: float

# Constants
const TILE_WIDTH = 2.0
const TILE_HEIGHT = 1.732
const HEX_DIRECTIONS_2 = [
	Vector3(1, 1, 0), Vector3(1, 1, -1), Vector3(0, 1, -1),
	Vector3(-1, 1, 0), Vector3(-1, 1, 1), Vector3(0, 1, 1)
]
const HEX_DIRECTIONS_3 = [
	Vector3(0.5, 1, 0.866), Vector3(-0.5, 1, 0.866), Vector3(-1, 1, 0),
	Vector3(-0.5, 1, -0.866), Vector3(0.5, 1, -0.866), Vector3(1, 1, 0)
]
const HEX_DIRECTIONS = [
	Vector3(0.866, 1, 0.5), Vector3(0.866, 1, -0.5), Vector3(0, 1, -1),
	Vector3(-0.866, 1, -0.5), Vector3(-0.866, 1, 0.5), Vector3(0, 1, 1)
]
# Utility: Convert hex coordinate to 3D translation
func hex_to_translation(hex: Vector3) -> Vector3:
	var x = TILE_WIDTH * (hex.x + 0.5 * (int(hex.z) & 1))
	var z = TILE_HEIGHT * 0.75 * hex.z
	return Vector3(x, 1, z)

# Utility: Convert 3D translation to hex coordinate
func translation_to_hex(trans: Vector3) -> Vector3:
	var q = (trans.x * 2/3) / TILE_WIDTH
	var r = (-trans.x / 3 + sqrt(3)/3 * trans.z) / TILE_HEIGHT
	return Vector3(round(q), 1, round(r))

# Walk method
func walk():
	var direction_vector = HEX_DIRECTIONS[direction]
	next_hex_coordinate = current_hex_coordinate + direction_vector
	print("Walking to Hex: ", next_hex_coordinate)
	
# Turn left method
func turn_left():
	direction = int((direction - 1) % 6)
	if direction < 0:
		direction = 5
	print("Turned left. New direction: ", direction)

# Turn right method
func turn_right():
	direction = int((direction + 1) % 6)
	if direction >= 6:
		direction = 0
	print("Turned right. New direction: ", direction)


# Called when the node enters the scene tree for the first time.
func _ready():	
	current_hex_coordinate = translation_to_hex(global_transform.origin)
	#acceleration = 0.001
	direction = 5
	velocity = 0.1
	print("Initialized at Hex: ", current_hex_coordinate)
	
	## Test: should move one square in whatever direction its facing
	walk()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = global_transform.origin
	var next_pos = hex_to_translation(next_hex_coordinate)
	
	if pos.distance_to(next_pos) > 0.1:
		# Calculate the direction vector towards the next position
		var direction_vector = (next_pos - pos).normalized()
		
		# Update the position based on velocity and delta
		global_transform.origin += direction_vector * velocity
		
		# Update the current hex coordinate
		current_hex_coordinate = translation_to_hex(global_transform.origin)
		print("moving...", velocity, global_transform.origin, next_pos)
	else:
		# If close enough, snap to the next hex coordinate to avoid jitter
		global_transform.origin = next_pos
		current_hex_coordinate = next_hex_coordinate
		print("Arrived at Hex: ", current_hex_coordinate)
