extends MiniGame


func _pressed(id : int):
	correct.emit()

func _ready() -> void:
	TTSPlayer.play("red")
	$elements/Button.modulate = Global.colors["red"]
	super._ready()

func _physics_process(delta: float) -> void:
	%ColorRect.material.set_shader_parameter("pos",get_global_mouse_position() / get_viewport_rect().size)
