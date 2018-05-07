extends Area2D

var enabled = true

func _ready():
	pass

func _on_HealthPickup_body_entered(body):
	if body.name == "Submarine" && enabled:
		body.gain_health(1)
		enabled = false
		visible = false
		$SFX.play()
		$SFX.connect("finished",self,"queue_free")
