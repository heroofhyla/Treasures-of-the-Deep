extends KinematicBody2D

var flinching = false

func _ready():
	pass

func _on_Area2D_area_entered(area):
	if area.name == "LightArea" && !flinching:
		$AnimationPlayer.queue("Flinch")
		flinching = true

func _on_VisibilityNotifier2D_screen_exited():
	$AnimationPlayer.queue("Idle")
	flinching = false
