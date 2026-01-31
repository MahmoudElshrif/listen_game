extends MiniGame


func _ready() -> void:
	get_tree().auto_accept_quit = false
	TTSPlayer.play("close")
	super._ready()

func _notification(what: int) -> void:
	if(what == NOTIFICATION_WM_CLOSE_REQUEST):
		correct.emit()

func _exit_tree() -> void:
	get_tree().auto_accept_quit = true
