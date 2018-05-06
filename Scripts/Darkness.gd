extends CanvasModulate

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var camera = get_node("/root/scene/Submarine/Camera2D")
var level = 1

func _ready():
	self.visible = true

func _process(delta):
	level = min(64/ camera.global_position.y, 1)
	color.r = level
	color.g = level
	color.b = level
	
	#print(camera.global_position.y)
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
