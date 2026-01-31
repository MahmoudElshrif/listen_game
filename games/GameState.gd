class_name GameState
extends Resource

@export var games : Array[GameInfo]
var gamesplayed : int = 0
var gamestash : Array[GameInfo]
var score : int = 0

func add(game : GameInfo):
	gamestash.append(game)

func cyclegame(ind : int):
	var game = gamestash.pop_at(ind)
	print(gamestash.size())
	gamestash.push_back(game)
	print(gamestash.size())
