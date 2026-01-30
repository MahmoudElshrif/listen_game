extends Node2D


var lines = {
	"red" : "res://assets/tts/red.mp3",
	"yellow" : "res://assets/tts/yellow.mp3",
	"green" : "res://assets/tts/green.mp3",
	"blue" : "res://assets/tts/blue.mp3",
}

func _ready() -> void:
	for i in lines:
		var stream = AudioStreamMP3.load_from_file(lines[i])
		lines[i] = stream
	
func play(voice : String):
	$tts.stream = lines[voice]
	$tts.play()
	
