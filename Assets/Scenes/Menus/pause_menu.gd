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
