extends "res://Assets/Scenes/Levels/Scripts/common.gd"

@onready var portals = [get_node("Portal1")]


# Called when the node enters the scene tree for the first time.
func _ready():
	# portal setup
	portals[0].exit = "res://Assets/Scenes/Levels/level_2.tscn"
	portals[0].active = true
	portals[0].exitLocation = 1
