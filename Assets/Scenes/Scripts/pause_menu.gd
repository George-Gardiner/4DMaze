extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_return_button_button_down():
	if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
		Input.mouse_mode= Input.MOUSE_MODE_CAPTURED
		set_visible(false)
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		set_visible(true)


func _on_main_menu_button_button_down():
	get_tree().change_scene_to_file("res://Assets/Scenes/Menus/main_menu.tscn")


func _on_save_button_down():
	# open file
	var saveFile = FileAccess.open("res://Data/Save.data", FileAccess.WRITE)
	var saveData = {}
	
	#save level and location
	saveData["general"] = {}
	saveData["general"]["level"] = str(get_tree().current_scene.name)
	var locationFile = FileAccess.open("res://Data/Location.data", FileAccess.READ)
	saveData["general"]["location"] = locationFile.get_var()
	locationFile.close()
	
	for node in get_tree().get_nodes_in_group("saveGroup"):
		saveData[node.name] = node.save()
	saveFile.store_var(saveData)
	saveFile.close()
	print(saveData["general"]["level"])
