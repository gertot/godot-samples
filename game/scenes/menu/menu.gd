extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_button1_pressed():
	print("Button 1 pressed")
	get_node("/root/global").setScene("levelmap")


func _on_button2_pressed():
	print("Button 2 pressed")
