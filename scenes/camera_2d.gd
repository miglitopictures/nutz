extends Camera2D

@onready var turn_manager: Node = $"../TurnManager"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = turn_manager.get_current_player().global_position
	
	var zoomInput := Input.get_axis('zoom-out', 'zoom-in')
	zoom.x = zoom.x + zoomInput
	zoom.y = zoom.y + zoomInput
