extends Area2D

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_GameEnd_body_entered(body):
	if body.name == "Submarine":
		get_tree().call_group("HUD", "game_end")
		queue_free()
