extends Camera2D

@onready var turn_manager: Node = $"../TurnManager"

@export var zoom_speed := 1.5
@export var wheel_step := 1.1
@export var min_zoom := 0.4
@export var max_zoom := 3.0

var target_zoom := 1.0

func _ready() -> void:
	# posicoa inicial do zoom (caso nao seja 1s)
	target_zoom = zoom.x

func _unhandled_input(event: InputEvent) -> void:
	# zoom com mouse wheel
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			apply_zoom(wheel_step)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			apply_zoom(1.0 / wheel_step)

func _process(delta: float) -> void:
	# target da camera
	var player = turn_manager.get_current_player()
	position = player.global_position

	# zoom com teclado
	var zoom_input := Input.get_axis("zoom-out", "zoom-in")
	apply_zoom(exp(zoom_input * zoom_speed * delta))

	# realmente aplicamos o zoom penas aqui
	var z := lerpf(zoom.x, target_zoom, 1.0 - exp(-10.0 * delta))
	zoom = Vector2(z, z)

func apply_zoom(factor: float) -> void:
	target_zoom = clamp(target_zoom * factor, min_zoom, max_zoom)
