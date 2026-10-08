extends Label

@export var turn_manager : Node

func _process(_delta: float) -> void:
	text = str(ceil(turn_manager.get_time_left()))
