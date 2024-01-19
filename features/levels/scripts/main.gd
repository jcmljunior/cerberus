extends Node2D

var configure_redux = Redux.get_instance(GetIt.get_instance())

func _ready():
	print(configure_redux)
