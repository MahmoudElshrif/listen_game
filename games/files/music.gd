extends MiniGame


var inds = [0,0,0,0,1,2,2]
var files : Array = [
	"res://assets/sounds/piano.mp3",
	"res://assets/sounds/drum.mp3",
	"res://assets/sounds/banjo.mp3"
]
var answer : int = 0

func _pressed(id : int):
	if(id == answer):
		correct.emit()
	else:
		wrong.emit()

func _ready() -> void:
	super._ready()
	answer = inds.pick_random()
	var stream = load(files[answer])
	$music.stream = stream
	$music.play() 
