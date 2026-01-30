extends MiniGame


var ids = [0,1,2]
var colors = ["#FF0000","#00FF00","#0000FF"]
var voices = ["red","green","blue"]
var answer :int = 0

func _pressed(id : int):
	if(id == ids[answer]):
		correct.emit()
	else:
		wrong.emit()

func _ready() -> void:
	super._ready()
	ids.shuffle()
	for i in range(3):
		$elements.get_children()[i].text = colors[ids[i]]
		$elements.get_children()[i].id = ids[i]
	answer = randi_range(0,2)
	TTSPlayer.play(voices[ids[answer]])
