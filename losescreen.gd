extends Node2D

signal restart

var score = 0
var isover = false

func enter():
	modulate.a = 0
	score = 0
	$CanvasGroup/score.text = "Score: " + str(score)
	var tween = create_tween()
	tween.tween_property(self,"modulate:a",1.,0.3).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CIRC)
	tween.tween_callback($Timer.start)
	isover = true


func _on_timer_timeout() -> void:
	if(score < Global.gamestate.score):
		score += 1
		$CanvasGroup/score.text = "Score: " + str(score)
	else:
		$Timer.stop()


func _on_button_pressed(id) -> void:
	if(not isover):
		return
	restart.emit()
	var tween = create_tween()
	tween.tween_property(self,"modulate:a",0,0.1).set_trans(Tween.TRANS_CIRC)
	isover = false
		
