extends Node2D

const BULLET = preload("res://scenes/bullet.tscn")

func shoot() -> void:
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = global_position
	new_bullet.global_rotation = global_rotation
	new_bullet.shooter = owner
	get_tree().current_scene.add_child(new_bullet)
	pass
