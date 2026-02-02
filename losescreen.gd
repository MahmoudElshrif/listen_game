extends Node2D

signal restart

var score = 0
var isover = false
var waseasy = false
var oldmaxscore := 0
var oldmaxeasyscore := 0

func enter():
	modulate.a = 0
	score = 0
	$CanvasGroup/score.text = "Score: " + str(score)
	$CanvasGroup/easymodeenbale.modulate = Global.colors["blue"]
	waseasy = Global.easymode
	$CanvasGroup/scoredif.hide()
	$CanvasGroup/scoredif.modulate = Global.colors["green"]
	oldmaxeasyscore = Global.maxeasyscore
	oldmaxscore = Global.maxscore
	if(waseasy):
		$CanvasGroup/score.modulate = Global.colors["blue"]
		Global.maxeasyscore = max(Global.maxeasyscore,Global.gamestate.score)
		$CanvasGroup/easymodeenbale.show()
		enable_easy()
	else:
		$CanvasGroup/score.modulate = Color.WHITE
		$CanvasGroup/easymodeenbale.hide()
		Global.maxscore = max(Global.maxscore,Global.gamestate.score)
		disable_easy()
	Global.save_scores()
	var tween = create_tween()
	tween.tween_property(self,"modulate:a",1.,0.3).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CIRC)
	tween.tween_callback($Timer.start)
	isover = true

func _on_timer_timeout() -> void:
	if(score < Global.gamestate.score):
		score += 1
		$CanvasGroup/score.text = "Score: " + str(score)
		var curoldmaxscore = 0
		if(Global.easymode):
			curoldmaxscore = oldmaxeasyscore
		else:
			curoldmaxscore = oldmaxscore
		if(score > curoldmaxscore):
			$CanvasGroup/scoredif.show()
			$CanvasGroup/scoredif.text = "+" + str(score - curoldmaxscore)
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
	if(waseasy):
		if(score > oldmaxeasyscore):
			$CanvasGroup/scoredif.show()
		else:
			$CanvasGroup/scoredif.hide()
	$CanvasGroup/retry.modulate = Global.colors["blue"]
	$CanvasGroup/easymode.modulate = Global.colors["blue"]
	$CanvasGroup/maxscore.modulate = Global.colors["blue"]
	$CanvasGroup/maxscore.text = "Easy Max Score: " + str(oldmaxeasyscore)
	var tween = get_tree().create_tween()
	tween.tween_property($CanvasGroup/easymode,"scale",Vector2(1.1,1.1),0.1)
	tween.parallel().tween_property($CanvasGroup/easymode,"rotation_degrees",10,0.1)


func disable_easy():
	Global.easymode = false
	if(not waseasy):
		if(score > oldmaxscore):
			$CanvasGroup/scoredif.show()
		else:
			$CanvasGroup/scoredif.hide()
	$CanvasGroup/retry.modulate = Color.WHITE
	$CanvasGroup/easymode.modulate = Color.WHITE
	$CanvasGroup/maxscore.modulate = Color.WHITE
	$CanvasGroup/maxscore.text = "Max Score: " + str(oldmaxscore)
	var tween = get_tree().create_tween()
	tween.tween_property($CanvasGroup/easymode,"scale",Vector2(1,1),0.1)
	tween.parallel().tween_property($CanvasGroup/easymode,"rotation_degrees",0,0.1)
