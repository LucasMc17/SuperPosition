extends Node2D
class_name Option

signal Transitioned

var unit : Unit 

func Enter():
	default()

func Exit():
	pass

func Select():
	pass

func default():
	EventBus.clear_highlights.emit()
