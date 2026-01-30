extends Node2D

var fullsize : float
var cursize : float


func _ready() -> void:
	fullsize = $bar.size.x


func set_timer(amount : float):
	cursize = lerp(0.,fullsize, amount)
	$bar.size.x = lerp($bar.size.x, cursize,0.7)
	$bar.modulate = lerp(Color.RED,Color.WHITE,cursize / fullsize)
