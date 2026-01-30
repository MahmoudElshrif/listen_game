class_name GameState
extends Resource

var gamesplayed : int = 0
var gamestash : Array[GameInfo]
var score : int = 0

func add(game : GameInfo):
	if(not gamestash.has(game)):
		gamestash.append(game)
