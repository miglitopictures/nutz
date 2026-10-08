class_name Player
extends CharacterBody2D

const SPEED : float = 50.0

var isActive := false
@onready var active_marker: ColorRect = $ActiveMarker

func _physics_process(_delta: float) -> void:
	if isActive:
		active_marker.visible = true
		
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
	else:
		active_marker.visible = false
