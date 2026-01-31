extends Node2D


var wrongpressed := 0

func _on_timer_timeout() -> void:
	$redaudio.play()


func _on_red_pressed(id: int) -> void:
	get_tree().change_scene_to_file("res://game_manger.tscn")

func _ready() -> void:
	await get_tree().create_timer(1).timeout
	$redaudio.play()

func _on_green_pressed(id: int) -> void:
	if(not $mfaudio.playing):
		if(wrongpressed == 7):
			$mfaudio.play()
			$redaudio.stop()
		else:
			$redaudio.play()
			$Timer.start()
			wrongpressed += 1
