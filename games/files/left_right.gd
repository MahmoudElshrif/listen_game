extends MiniGame

var dirs = ["left","right","left","right","left","right","left","right","red","blue"]
var answer := 0

func _pressed(id : int):
	if((answer % 2) == id):
		correct.emit()
	else:
		wrong.emit()

func _ready() -> void:
	super._ready()
	answer = randi_range(0,dirs.size() - 1)
	TTSPlayer.play(dirs[answer])
