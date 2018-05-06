extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var open = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func open():
	if !open:
		$AnimationPlayer.queue("Open")
		$CollisionShape2D.disabled = true
		open = true


func _on_Area2D_area_entered(area):
	print(area.name)
