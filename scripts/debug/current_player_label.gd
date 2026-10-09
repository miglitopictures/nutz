extends Label

@export var turn_manager : Node

func _process(_delta: float) -> void:
	text = turn_manager.get_current_player().name
