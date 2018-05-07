extends KinematicBody2D

var open = false
export var access_level = "a"

func _ready():
	pass

func open():
	if !open:
		$AnimationPlayer.queue("Open")
		$CollisionShape2D.disabled = true
		open = true
