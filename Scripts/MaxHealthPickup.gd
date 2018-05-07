extends Area2D

var enabled = true

func _ready():
	pass

func _on_HealthPickup_body_entered(body):
	if body.name == "Submarine" && enabled:
		body.gain_max_health(1)
		$SFX.play()
		visible = false
		enabled = false
		$SFX.connect("finished",self,"queue_free")
