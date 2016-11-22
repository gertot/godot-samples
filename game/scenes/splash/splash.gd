extends Node2D

var timer = 0

func _ready():
	set_process(true)
	
func _process(delta):
	timer = timer + delta
	if (timer >= 2):
		get_node("/root/global").setScene("res://scenes/menu/menu.tscn")
