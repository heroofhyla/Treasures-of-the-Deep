extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var flinching = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Area2D_area_entered(area):
	if area.name == "LightArea" && !flinching:
		$AnimationPlayer.queue("Flinch")
		flinching = true




func _on_VisibilityNotifier2D_screen_exited():
	$AnimationPlayer.queue("Idle")
	flinching = false
	
