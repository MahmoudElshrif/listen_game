extends WinHandler

@export var answer : int = 0

func is_correct(id : int) -> bool:
	return id == answer
