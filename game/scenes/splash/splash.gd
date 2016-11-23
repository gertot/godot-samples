extends Node2D

var timer = 0
var interactiveResourceLoader = null
var progressbar = null
var stagecount = 0
var minTimeToShow = 3

func _ready():
	set_process(true)
	progressbar = get_node("progress")
	progressbar.set_value(0)
	interactiveResourceLoader = ResourceLoader.load_interactive("res://scenes/menu/menu.tscn")
	stagecount = interactiveResourceLoader.get_stage_count()
	
func _process(delta):
	timer += delta
	if (timer >= minTimeToShow):
		timer = minTimeToShow
		
	var status = interactiveResourceLoader.poll()
	var stage = interactiveResourceLoader.get_stage()
	if (status == 18):
		stage = stagecount
	
	var percent = (float(stage) + timer) / (stagecount + minTimeToShow) * 100
	progressbar.set_value(percent)
	
	if (percent == 100):
		get_node("/root/global").setPreloadedScene(interactiveResourceLoader.get_resource())
	
