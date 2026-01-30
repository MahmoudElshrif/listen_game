extends Node2D




func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game_manger.tscn")

func _ready() -> void:
	$score.text = "Your score is: " + str(Global.gamestate.score)
