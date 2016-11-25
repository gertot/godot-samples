extends Node2D

var timer = 0
var menuSceneLoader = null
var levelSceneLoader = null
var progressbar = null
var stagecount = 0
var minTimeToShow = 3
var menuSceneStored = false
var levelSceneStored = false

func _ready():
	set_process(true)
	progressbar = get_node("progress")
	progressbar.set_value(0)
	menuSceneLoader = ResourceLoader.load_interactive("res://scenes/menu/menu.tscn")
	levelSceneLoader = ResourceLoader.load_interactive("res://scenes/levelmap/levelmap.tscn")
	stagecount += menuSceneLoader.get_stage_count()
	stagecount += levelSceneLoader.get_stage_count()
	
func _process(delta):
	timer += delta
	if (timer >= minTimeToShow):
		timer = minTimeToShow
	var stages = 0
	if (menuSceneLoader.poll() == 18):
		stages += menuSceneLoader.get_stage_count()
		if (not menuSceneStored):
			get_node("/root/global").setMenuScene(menuSceneLoader.get_resource())
		menuSceneStored = true
	else:
		stages += menuSceneLoader.get_stage()
	
	if (levelSceneLoader.poll() == 18):
		stages += levelSceneLoader.get_stage_count()
		if (not levelSceneStored):
			get_node("/root/global").setLevelScene(levelSceneLoader.get_resource())
		levelSceneStored = true
	else:
		stages += levelSceneLoader.get_stage()
	
	var percent = (float(stages) + timer) / (stagecount + minTimeToShow) * 100
	progressbar.set_value(percent)
	
	if (percent == 100):
		get_node("/root/global").setScene("menu")
	
