extends Node3D

class_name Chicken

# Variables
var current_hex_coordinate: Vector2
var acceleration: float
var direction: int
var velocity: float

# Constants
const HEX_DIRECTIONS = [
	Vector2(1, 0), Vector2(1, -1), Vector2(0, -1),
	Vector2(-1, 0), Vector2(-1, 1), Vector2(0, 1)
]

# Constructor
func _init(x: int, y: int, acc: float = 0.0, dir: int = 0, vel: float = 0.0):
	current_hex_coordinate = Vector2(x, y)
	acceleration = acc
	direction = dir
	velocity = vel
	position = hex_to_translation(current_hex_coordinate)
	print("Initialized at Hex: ", current_hex_coordinate)

# Walk method
func walk():
	velocity += acceleration
	var next_hex_coordinate = current_hex_coordinate + HEX_DIRECTIONS[direction] * velocity
	current_hex_coordinate = next_hex_coordinate
	position = hex_to_translation(current_hex_coordinate)
	print("Walked to Hex: ", current_hex_coordinate)

# Turn left method
func turn_left():
	direction = int((direction - 1) % 6)
	if direction < 0:
		direction += 6
	print("Turned left. New direction: ", direction)

# Turn right method
func turn_right():
	direction = int((direction + 1) % 6)
	print("Turned right. New direction: ", direction)

# Utility: Convert hex coordinate to 3D translation
func hex_to_translation(hex: Vector2) -> Vector3:
	var x = TILE_WIDTH * (hex.x + 0.5 * (int(hex.y) & 1))
	var z = TILE_HEIGHT * 0.75 * hex.y
	return Vector3(x, 1, z)  # Assuming y is height in 3D space

# Utility: Convert 3D translation to hex coordinate
func translation_to_hex(trans: Vector3) -> Vector2:
	var q = (trans.x * 2/3) / TILE_WIDTH
	var r = (-trans.x / 3 + sqrt(3)/3 * trans.z) / TILE_HEIGHT
	return Vector2(round(q), round(r))

# Constants for tile dimensions (adjust these based on your hex tile size)
const TILE_WIDTH = 64
const TILE_HEIGHT = 64

# Example function to demonstrate movement
func _ready():
	_init(0, 0, 1, 0, 1)
	# Calling walk() to check if movement logic works
	print("Initial Hex Coordinate: ", current_hex_coordinate)
	walk()
	print("Current Hex Coordinate after walk: ", current_hex_coordinate)
	turn_left()
	walk()
	print("Current Hex Coordinate after turn left and walk: ", current_hex_coordinate)

# Continuous movement for testing
func _process(delta):
	walk()
