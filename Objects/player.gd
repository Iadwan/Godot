extends CharacterBody2D


@onready var ladder_ray: RayCast2D = $RayCast2D


const SPEED = 100.0
const JUMP_VELOCITY = -350.0
const LADDER_SPEED = 100.0

func _ready() -> void:
	print("Position: " + str($Sprite2D.position))
	print("Global Position: " + str($Sprite2D.global_position))



func _physics_process(delta: float) -> void:
	var on_ladder := ladder_ray.is_colliding()
	var vertical_input := Input.get_axis("ui_up", "ui_down")
	
	var posGlobal: Vector2  = $Sprite2D.global_position
	print("Global Position: " , posGlobal.y)
	
	if posGlobal.y >500:
		print("PLAYER FELL!")
		get_tree().change_scene_to_file("res://game_over.tscn")
		return
		
	#Climbing ladder
	if on_ladder and vertical_input != 0:
		velocity.x = 0
		velocity.y = vertical_input * LADDER_SPEED
		move_and_slide()
		return
		
	# Add the gravity.s
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
			
		

		
	move_and_slide()
