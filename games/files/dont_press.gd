extends MiniGame

func timeout():
	correct.emit()
	
func _pressed(id : int):
	wrong.emit()

func _ready() -> void:
	super._ready()
	TTSPlayer.play("stop")
