extends Node

@onready var timer := $Timer

@export var players : Array[Player]
var current_player_index := 0

enum TurnState {ACTIVE, WAITING}
var currentState : TurnState = TurnState.ACTIVE

func _ready() -> void:
	players[current_player_index].isActive = true;
	timer.start()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("dbg-change-turn"):
		change_turn() # for debug reasons, i want to change the turn on command

func _on_timer_timeout() -> void:
	# the turn timer has run out, change the turn
	if currentState == TurnState.ACTIVE: # should we have this check?
		change_turn()
		

# change turn
func change_turn() -> void:
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

# "getter" for time_left on current turn
func get_time_left() -> float:
	return timer.time_left

# "getter" for current_player on current turn
func get_current_player() -> Player:
	return players[current_player_index]
