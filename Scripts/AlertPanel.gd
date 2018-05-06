extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func show_max_health_notice():
	print("Showing max health notice")
	visible = true
	get_tree().paused = true

func _process(delta):
	if visible:
		if Input.is_action_just_pressed("ui_accept"):
			visible = false
			get_tree().paused = false
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
