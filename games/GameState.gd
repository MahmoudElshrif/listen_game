class_name GameState
extends Resource

@export var games : Array[GameInfo]
var gamesplayed : int = 0
var gamestash : Array[GameInfo]
var score : int = 0

func add(game : GameInfo):
	if(not gamestash.has(game)):
		gamestash.append(game)

func cyclegame(ind : int):
	var game = gamestash.pop_at(ind)
	gamestash.push_back(game)
