extends "res://Assets/Scenes/Levels/Scripts/common.gd"

@onready var portals = [get_node("Portal1"), get_node("Portal2")]

# Called when the node enters the scene tree for the first time.
func _ready():
	# portal setup
	portals[0].exit = "res://Assets/Scenes/Levels/level_4.tscn"
	portals[0].active = true
	portals[0].exitLocation = 1
	portals[1].exit = "res://Assets/Scenes/Levels/level_3.tscn"
	portals[1].active = true
	portals[1].exitLocation = 2
	commonReady()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
