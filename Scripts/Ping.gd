extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var code_b = false

func _ready():
	print("ping with code b? " + str(code_b))
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
		print(body.access_level)
	if body.is_in_group("Door") && body.access_level == "a":
		body.open()
	
	if body.is_in_group("Door") && body.access_level == "b" && code_b:
		body.open()