extends Node2D

var camera = null
var terrain = null
var viewport_width = 0
var viewport_height = 0

func _ready():
	set_process(true)
	var viewport = get_node("/root")
	camera = get_node("camera")
	#get the viewport size
	viewport_width = viewport.get_rect().size.x
	viewport_height = viewport.get_rect().size.y
	#get the size of the tilemap terrain
	var tilemaputils = get_node("/root/tilemaputils")
	terrain = tilemaputils.calculate_tilemap_size(get_node("terrain"))
	camera.set_offset(Vector2(viewport_width / 2, viewport_height / 2))
	get_node("levels/level1").show()
	_bind_level_selected()
	
func _bind_level_selected():
	for level in get_node("levels").get_children():
		level.connect("selected", self, "_level_selected")
		
func _level_selected(level):
	print("level selected: ", level)

func _process(delta):
	if (Input.is_key_pressed(KEY_RIGHT)):
		move(Vector2(5, 0))
	if (Input.is_key_pressed(KEY_LEFT)):
		move(Vector2(-5, 0))
	if (Input.is_key_pressed(KEY_UP)):
		move(Vector2(0, -5))
	if (Input.is_key_pressed(KEY_DOWN)):
		move(Vector2(0, 5));
		
func move(delta):
	var camerapos = camera.get_camera_pos()
	camerapos += delta
	if (not camerapos.x < terrain.x
		and not camerapos.x > terrain.width - viewport_width):
		camera.move_local_x(delta.x)
		
	if (not camerapos.y < terrain.y
		and not camerapos.y > terrain.height - viewport_height):
		camera.move_local_y(delta.y)