extends MiniGame


var seq = []
var cur = 0
var selected = 0
var saying = false
var voices = ["red","green","blue","yellow"]

func _pressed(id : int):
	if(saying):
		return
	if(seq[selected] == id):
		selected += 1
		print("yes")
		if(selected > cur):
			selected = 0
			cur += 1
			if(cur == 3):
				correct.emit()
			else:
				say()
	else:
		wrong.emit()

func say():
	saying = true
	$elements.modulate = Color(0.4,0.4,0.4)
	for i in range(cur + 1):
		print(voices[seq[i]])
		TTSPlayer.play(voices[seq[i]])
		await get_tree().create_timer(0.3).timeout
	
	$elements.modulate = Color(1,1,1)
	saying = false

func _ready() -> void:
	super._ready()
	for i in range(3):
		seq.append(randi_range(0,3))
	for i in range(4):
		$elements.get_children()[i].modulate = Global.colors[voices[i]]
	say()
