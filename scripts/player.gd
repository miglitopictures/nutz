class_name Player
extends CharacterBody2D

const SPEED : float = 50.0

var isActive := false
@onready var active_marker: ColorRect = $ActiveMarker

@onready var hand: Sprite2D = $Hand
@onready var weapon: Node2D = $Hand/Weapon
@onready var hp_label: Label = $HpLabel

@export var selectedWeapon : WeaponResosurce

@export var health : float = 100.0

func _physics_process(_delta: float) -> void:
	hp_label.text = "%03.0f" % health
	if isActive:
		active_marker.visible = true
		
		if Input.is_action_pressed("shoot"):
			weapon.shoot()
			
		
		
		# rotate towards mouse
		hand.look_at(get_global_mouse_position())
		
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

func take_damage(damage: float) -> void:
	health -= damage
