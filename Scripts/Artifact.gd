extends Area2D
export var unlocks = "Ping"
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var active = true

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Artifact_body_entered(body):
	if body.name == "Submarine" && active:
		active = false
		$SFX.play()
		$Sprite.frame = 1
		body.unlock(unlocks)
		$Light2D.enabled = false
