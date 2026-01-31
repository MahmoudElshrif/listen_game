extends MiniGame

func _pressed(id : int):
	correct.emit()
	
func _ready() -> void:
	super._ready()
	$yanny.play()
