extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_down():  # start game
	FileAccess.open("res://Data/Location.data", FileAccess.WRITE).close()
	get_tree().change_scene_to_file("res://Assets/Scenes/Levels/level_1.tscn")


func _on_quit_button_down():  # quite button
	get_tree().quit()


func _on_load_button_down():
	if FileAccess.file_exists("res://Data/Location.data") and FileAccess.file_exists("res://Data/Save.data"):
		var saveFile = FileAccess.open("res://Data/Save.data", FileAccess.READ)
		var saveData = saveFile.get_var()
		saveFile.close()
		print("res://Assets/Scenes/Levels/"+str(saveData["general"]["level"])+".tscn")
		get_tree().change_scene_to_file("res://Assets/Scenes/Levels/"+str(saveData["general"]["level"])+".tscn")
