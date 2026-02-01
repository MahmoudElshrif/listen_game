extends Sprite2D

signal pressed(id : int)

@export var id : int = -1

func _input(event: InputEvent) -> void:
	var rect := get_global_transform() * get_rect()
	if(event.is_action_pressed("mouse") and rect.has_point(get_global_mouse_position())):
		pressed.emit(id)
		flash()

func flash():
	var oldmod = modulate
	modulate = Color.WHITE
	var tween = create_tween().tween_property(self,"modulate",oldmod,0.1)
