extends Area2D

export var unlocks = "Ping"
var active = true

func _ready():
	pass

func _on_Artifact_body_entered(body):
	if body.name == "Submarine" && active:
		active = false
		$SFX.play()
		$Sprite.frame = 1
		body.unlock(unlocks)
		$Light2D.enabled = false
