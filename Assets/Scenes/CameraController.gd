extends Node3D

var turnSpeed = -0.2


# Called when the node enters the scene tree for the first time.
func _ready():
	# Lock mouse in center of screen and hide
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(deg_to_rad(event.get_relative().x*turnSpeed))
	elif event.is_action_pressed("Menu"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
