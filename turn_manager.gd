extends Node

@onready var timer := $Timer

@export var players : Array[Player]
var current_player_index := 0

enum TurnState {ACTIVE, WAITING}
var currentState : TurnState = TurnState.ACTIVE

func _ready() -> void:
	players[current_player_index].isActive = true;
	timer.start()

func _on_timer_timeout() -> void:
	if currentState == TurnState.ACTIVE:
		currentState = TurnState.WAITING
		players[current_player_index].isActive = false;
		current_player_index = (current_player_index + 1) % len(players)
		players[current_player_index].isActive = true;
		print("Turn ended!")
		
		timer.start() # for testing im restarting right away
		currentState = TurnState.ACTIVE

func get_turn_time_left() -> float:
	return timer.time_left
