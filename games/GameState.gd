class_name GameState
extends Resource


var gamestash : Array[GameInfo]


func add(game : GameInfo):
	if(not gamestash.has(game)):
		gamestash.append(game)
