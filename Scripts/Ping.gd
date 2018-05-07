extends Area2D

var code_b = false

func _ready():
	$SFX.connect("finished",self,"queue_free")
	$SFX.play()

func _on_Ping_body_entered(body):
	if body.is_in_group("Door") && body.access_level == "a":
		body.open()
	
	if body.is_in_group("Door") && body.access_level == "b" && code_b:
		body.open()
