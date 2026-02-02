extends Node2D


@export var gamestate : GameState

@export var colors : Dictionary[String,Color]

var easymode := false

var maxscore = 0
var maxeasyscore = 0

func save_scores():
	var scores = {
		"maxscore" : maxscore,
		"maxeasyscore" : maxeasyscore
	}
	
	var file = FileAccess.open("user://scores.json",FileAccess.WRITE)
	
	var json = JSON.stringify(scores)
	file.store_string(json)
	

func _ready() -> void:
	read_scores()

func read_scores():
	if(not FileAccess.file_exists("user://scores.json")):
		return
	
	var file := FileAccess.open("user://scores.json",FileAccess.READ)
	var scoresline := file.get_as_text()
	var scores = JSON.parse_string(scoresline)
	
	maxscore = scores["maxscore"]
	maxeasyscore = scores["maxeasyscore"]

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("fullscreen")):
		if(DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED):
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
