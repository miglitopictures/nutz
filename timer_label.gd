extends Label

@export var turn_manager : Node

func _process(_delta: float) -> void:
	text = "Player " + str(turn_manager.current_player_index)
