extends MiniGame

var dirs = ["left","right","left","right","left","right","red","blue","left","right","left","right","left","right","left","right","left","right","left","right","left","right"]
var answer := 0

func _pressed(id : int):
	if((answer % 2) == id):
		correct.emit()
	else:
		wrong.emit()

func _ready() -> void:
	super._ready()
	if(Global.gamestate.score > 50):
		$leftarrow.rotation_degrees = 30
	answer = randi_range(0,dirs.size() - 1)
	TTSPlayer.play(dirs[answer])


func _physics_process(delta: float) -> void:
	if(Global.gamestate.score > 50):
		$leftarrow.rotation_degrees += 20
		$rightarrow.rotation_degrees += 20

		
