extends Node3D

const turnSpeed = -0.2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(event.get_relative().x*turnSpeed))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
