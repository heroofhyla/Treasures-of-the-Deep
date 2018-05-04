extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func erase_self(arg):
	print(arg)
	queue_free()

func _on_Area2D_body_entered(body):
	if body.name == "Submarine":
		var dir_to = (body.position - position).normalized()
		body.velocity = 100 * dir_to
		print("BOOM!" + str(dir_to))
		$AnimationPlayer.play("Explosion")
		$AnimationPlayer.connect("animation_finished",self,"erase_self")
		#queue_free()
