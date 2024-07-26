extends Node3D

@onready var portals = [get_node("Portal1"), get_node("Portal2")]
@onready var location

# Called when the node enters the scene tree for the first time.
func _ready():
	portals[0].exit = "res://Assets/Scenes/Levels/level_1.tscn"
	portals[0].active = true
	var file = FileAccess.open("res://Data/Location.data", FileAccess.READ)
	location = file.get_var()
	file.close()
	get_node("MainPlayer").position = get_node("Location"+str(location)).position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
