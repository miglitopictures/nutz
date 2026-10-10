extends Area2D

var shooter : Player = null
@export var damage : float = 10

func _init() -> void:
	print("bullet spawned at ", global_position)

func _physics_process(delta: float) -> void:
	global_position += Vector2.RIGHT.rotated(rotation) * 200 * delta
	pass


func _on_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
	queue_free()
