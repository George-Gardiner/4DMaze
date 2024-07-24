extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var turnSpeedX = -0.2
var turnSpeedY = -0.2
var pauseMenu
var CameraController

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	# Lock mouse in center of screen and hide
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pauseMenu = get_node("PauseMenu")
	pauseMenu.set_visible(false)
	CameraController = get_node("CameraController")


func togglePauseMenu():
	if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
		Input.mouse_mode= Input.MOUSE_MODE_CAPTURED
		pauseMenu.set_visible(false)
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		pauseMenu.set_visible(true)


func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(deg_to_rad(event.get_relative().x*turnSpeedX))
		if CameraController.rotation_degrees[0] + event.get_relative().y*turnSpeedY >=90:
			CameraController.rotation_degrees[0] = 90
		elif CameraController.rotation_degrees[0] + event.get_relative().y*turnSpeedY <=-90:
			CameraController.rotation_degrees[0] = -90
		else:
			CameraController.rotate_x(deg_to_rad(event.get_relative().y*turnSpeedY))
	elif event.is_action_pressed("Menu"):
		togglePauseMenu()


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	print($CameraController/CameraArea.get_overlapping_bodies())
	if (len($CameraController/CameraArea.get_overlapping_bodies()) > 1):
		$CameraController/CameraArea/Camera.position.z = -3
	else:
		$CameraController/CameraArea/Camera.position.z = 0

	move_and_slide()
