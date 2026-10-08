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
		# end current player`s turn
		players[current_player_index].isActive = false;
		print(players[current_player_index].name + "`s turn ended!")
		
		# change current to next player
		current_player_index = (current_player_index + 1) % len(players)
		players[current_player_index].isActive = true;
		print("Current player: " + players[current_player_index].name)
		print()
		
		# reset timer and set state to active [just for testing :p]
		timer.start()
		currentState = TurnState.ACTIVE

# Getter for time_left on current turn [used in timer label for now]
func get_time_left() -> float:
	return timer.time_left

func get_current_player() -> Player:
	return players[current_player_index]
