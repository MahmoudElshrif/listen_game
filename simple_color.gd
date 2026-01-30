extends MiniGame

var answer : int = 0

var ids = [0,1,2,3]

var colors := [
	Color.RED,
	Color.GREEN,
	Color.BLUE,
	Color.YELLOW
]

var voices = [
	"res://assets/tts/red.mp3",
	"res://assets/tts/green.mp3",
	"res://assets/tts/blue.mp3",
	"res://assets/tts/yellow.mp3"
]

func _pressed(id : int):
	if(ids[id] == answer):
		correct.emit()
	else:
		wrong.emit()

func _ready() -> void:
	super._ready()
	ids.shuffle()
	answer = randi_range(0,3)
	var stream : AudioStreamMP3 = AudioStreamMP3.load_from_file(voices[answer])
	$tts.stream = stream
	$tts.play()
	for i in range(elements.get_child_count()):
		elements.get_children()[i].modulate = colors[ids[i]]
		
