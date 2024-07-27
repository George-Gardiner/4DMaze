extends Node3D

@onready var portals = [get_node("Portal1")]
@onready var location
@onready var checkpoint

# Called when the node enters the scene tree for the first time.
func _ready():
	# portal setup
	portals[0].exit = "res://Assets/Scenes/Levels/level_2.tscn"
	portals[0].active = true
	portals[0].exitLocation = 1
	
	# teleport player
	var file = FileAccess.open("res://Data/Location.data", FileAccess.READ)
	location = file.get_var()
	file.close()
	if location != null:
		get_node("MainPlayer").position = get_node("Location"+str(location)).position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func save():
	pass
