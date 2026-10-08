class_name Player
extends CharacterBody2D

const SPEED : float = 100.0

var isActive := false

func _physics_process(_delta: float) -> void:
	if isActive:
		# rotate towards mouse
		look_at(get_global_mouse_position())
		
		# Get the input direction and handle the movement.
		var direction := Input.get_vector("left", "right", "up", "down") * SPEED
		if direction:
			velocity = direction
		else:
			#velocity.x = move_toward(velocity.x, 0, 100)
			#velocity.y = move_toward(velocity.y, 0, 100)
			velocity.x = 0
			velocity.y = 0
		move_and_slide()
