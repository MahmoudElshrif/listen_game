class_name TrickyText
extends RandomColor


var text = ["Red","Green","Blue","Yellow"]

func _ready() -> void:
	super._ready()
	text.shuffle()
	for i in range(4):
		$elements.get_children()[i].text = text[i]
		
