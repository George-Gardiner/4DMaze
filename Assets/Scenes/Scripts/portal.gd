extends Area3D

var active = false
var exit
var exitLocation


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if active:
		var LocationDataFile = FileAccess.open("res://Data/Location.data", FileAccess.WRITE)
		LocationDataFile.store_var(exitLocation)
		LocationDataFile.close()
		get_tree().change_scene_to_file(exit)
