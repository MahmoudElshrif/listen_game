class_name SimpleColor
extends MiniGame

var answer : int = 0

var ids = [0,1,2,3]

var colors := [
	"red",
	"green",
	"blue",
	"yellow"
]

var voices = [
	"red",
	"green",
	"blue",
	"yellow"
]

func _pressed(id : int):
	if(ids[id] == ids[answer]):
		correct.emit()
	else:
		wrong.emit()

func _ready() -> void:
	super._ready()
	answer = randi_range(0,3)
	TTSPlayer.play(voices[ids[answer]])

func _physics_process(delta: float) -> void:
	for i in range(elements.get_child_count()):
		elements.get_children()[i].modulate = Global.colors[colors[ids[i]]]
		
