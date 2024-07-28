extends Node3D

@onready var location


# Called when the node enters the scene tree for the first time.
func commonReady():
	# teleport player
	var file = FileAccess.open("res://Data/Location.data", FileAccess.READ)
	location = file.get_var()
	file.close()
	if location != null:
		get_node("MainPlayer").position = get_node("Location"+str(location)).position
	
	# load
	if FileAccess.file_exists("res://Data/Location.data") and FileAccess.file_exists("res://Data/Save.data"):
		var saveFile = FileAccess.open("res://Data/Save.data", FileAccess.READ)
		var saveData = saveFile.get_var()
		saveFile.close()
		for node in get_tree().get_nodes_in_group("saveGroup"):
			node.loadObject(saveData[node.name])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func save():
	return {}
