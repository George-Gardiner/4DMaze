extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func save():
	return {
		"position": self.position,
		"rotation": self.rotation
	}


func loadObject(data):
	self.position = data["position"]
	self.rotation = data["rotation"]