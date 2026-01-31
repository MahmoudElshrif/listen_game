class_name MiniGame
extends Node2D

signal correct
signal wrong

@export var elements : Node2D

func _pressed(id : int):
	pass

func timeout():
	wrong.emit()

func _ready() -> void:
	for i in range(elements.get_child_count()):
		elements.get_children()[i].pressed.connect(_pressed)
		if(elements.get_children()[i].id == -1):
			elements.get_children()[i].id = i
