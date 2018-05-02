extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var camera = get_node("/root/scene/Submarine/Camera2D")
onready var submarine = get_node("/root/scene/Submarine")
var lit = false
var facing = 1
func _ready():
	self.visible = true

func _process(delta):
	if lit != submarine.lit:
		lit = submarine.lit
		if lit:
			self.texture = load("res://Sprites/lit-darkness.png")
		else:
			self.texture = load("res://Sprites/darkness.png")
	
	modulate.a = 1 - 255.0/ camera.global_position.y
	
	if facing != submarine.facing:
		facing = submarine.facing
		scale.x = facing
	
	#print(camera.global_position.y)
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
