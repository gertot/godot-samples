extends Node

#The active scene
var activeScene = null

func _ready():
   #get the active screen
   activeScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() - 1)

func setPreloadedScene(scene):
	activeScene.queue_free()
	#create a new instance of the scene
	activeScene = scene.instance()
	# add thee scene to root
	get_tree().get_root().add_child(activeScene)

# function to switch the scene
func setScene(scene):
   #clean up the active scene
   activeScene.queue_free()
   #load the new scene
   var s = ResourceLoader.load(scene)
   #create a new instance of the scene
   activeScene = s.instance()
   # add thee scene to root
   get_tree().get_root().add_child(activeScene)