extends Node2D


@export var gamestate : GameState

@export var colors : Dictionary[String,Color]

var easymode := false


func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("fullscreen")):
		if(DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED):
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
