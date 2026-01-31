extends Node2D

var fullsize : float
var cursize : float
var t :float = 0

func _ready() -> void:
	fullsize = $bar.size.x


func set_timer(amount : float):
	cursize = lerp(-30.,fullsize, amount)
	$Timerprogress.material.set_shader_parameter("progress",cursize / fullsize)
	$bar.size.x = lerp($bar.size.x, cursize,0.7)
	$bar.modulate = lerp(Color.RED,Color.WHITE,cursize / fullsize)


func _physics_process(delta: float) -> void:
	t += delta * (3 if (cursize / fullsize) > 0.4 else 60)
	#$Clock.rotation_degrees = sin(t) * 20
