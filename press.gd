extends MiniGame


func timeout():
	wrong.emit()

func _pressed(id : int):
	correct.emit()

func _ready() -> void:
	super._ready()
	TTSPlayer.play("click")
