extends Node2D

signal selected(level)
export(int) var level

var currstars = 0

func _ready():
	get_node("star0").hide()
	get_node("star1").hide()
	get_node("star2").hide()
	get_node("star3").hide()
	hide()
	
func setStars(stars):
	currstars = stars
	get_node("star0").hide()
	get_node("star1").hide()
	get_node("star2").hide()
	get_node("star3").hide()
	if (currstars == 0):
		get_node("star0").show()
	elif (currstars == 1):
		get_node("star1").show()
	elif (currstars == 2):
		get_node("star2").show()
	elif (currstars == 3):
		get_node("star3").show()

func _on_anchor_pressed():
	emit_signal("selected", level)
