extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var enabled = true
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_HealthPickup_body_entered(body):
	if body.name == "Submarine" && enabled:
		body.gain_max_health(1)
		$SFX.play()
		visible = false
		enabled = false
		$SFX.connect("finished",self,"queue_free")
		
