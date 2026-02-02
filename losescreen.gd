extends Node2D

signal restart

var score = 0
var isover = false
var waseasy = false

func enter():
	modulate.a = 0
	score = 0
	$CanvasGroup/score.text = "Score: " + str(score)
	waseasy = Global.easymode
	if(waseasy):
		$CanvasGroup/score.modulate = Global.colors["blue"]
	else:
		$CanvasGroup/score.modulate = Color.WHITE
	
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

func _on_text_button_pressed(id: int) -> void:
	if(not isover):
		return
	$click.play()
	if(Global.easymode):
		disable_easy()
	else:
		enable_easy()

func enable_easy():
	Global.easymode = true
	$CanvasGroup/retry.modulate = Global.colors["blue"]
	$CanvasGroup/easymode.modulate = Global.colors["blue"]
	var tween = get_tree().create_tween()
	tween.tween_property($CanvasGroup/easymode,"scale",Vector2(1.1,1.1),0.1)
	tween.parallel().tween_property($CanvasGroup/easymode,"rotation_degrees",10,0.1)


func disable_easy():
	Global.easymode = false
	$CanvasGroup/retry.modulate = Color.WHITE
	$CanvasGroup/easymode.modulate = Color.WHITE
	var tween = get_tree().create_tween()
	tween.tween_property($CanvasGroup/easymode,"scale",Vector2(1,1),0.1)
	tween.parallel().tween_property($CanvasGroup/easymode,"rotation_degrees",0,0.1)
