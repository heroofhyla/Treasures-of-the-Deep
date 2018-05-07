extends StaticBody2D

var armed = true

func _ready():
	pass

func erase_self(anim):
	queue_free()

func _on_Area2D_body_entered(body):
	if body.name == "Submarine" && armed:
		armed = false
		$Area2D/CollisionShape2D.disabled = true
		$CollisionShape2D.disabled = true
		body.damage(1)
		var dir_to = (body.position - position).normalized()
		body.velocity = 100 * dir_to
		$Light2D.visible = true
		$AnimationPlayer.play("Explosion")
		$SFX.play()
		$SFX.connect("finished",self,"queue_free")
