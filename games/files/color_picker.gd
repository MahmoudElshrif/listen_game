extends MiniGame


var voices = ["yellow","green","blue"]

var values = [0.1996,0.34374,0.65625]
var answer := 0

func _ready() -> void:
	answer = randi_range(0,2)
	TTSPlayer.play(voices[answer])
	super._ready()

func _physics_process(delta: float) -> void:
	if(abs(%ColorPicker.color.h - values[answer]) <= 0.145):
		correct.emit()
