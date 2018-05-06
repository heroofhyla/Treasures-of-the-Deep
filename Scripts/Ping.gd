extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$SFX.connect("finished",self,"queue_free")
	$SFX.play()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Ping_body_entered(body):
	#print("Collision - ping")
	#print(body.name)
	if body.is_in_group("Door"):
		body.open()
