extends Node

#The active scene
var activeScene = null
var menuScene = null
var levelScene = null

func _ready():
	#get the active screen
	print("init global")
	activeScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() - 1)

func setMenuScene(scene):
	print("setMenuScene")
	menuScene = scene

func setLevelScene(scene):
	print("setLevelScene")
	levelScene = scene

# function to switch the scene
func setScene(scenename):
	if (activeScene.get_name() == "splash"):
		#clean up the active scene
		activeScene.queue_free()
	else:
		get_tree().get_root().remove_child(activeScene)
	
	var newScene = null
	if (scenename == "menu"):
		newScene = menuScene
	elif (scenename == "levelmap"):
		newScene = levelScene
	else:
		newScene = ResourceLoader.load("res://scenes/" + scenename + "menu/" + scenename + ".tscn")
	#create a new instance of the scene
	activeScene = newScene.instance()
	# add thee scene to root
	get_tree().get_root().add_child(activeScene)