extends Sprite

func _ready():
	pass

func show_max_health_notice():
	$TextContainer/Text.text = "Hull upgrade acquired"
	visible = true
	get_tree().paused = true

func show_learn_frequency_notice(letter):
	$TextContainer/Text.text = "Learned authorization frequency " + letter + "\nPress SPACE to ping"
	visible = true
	get_tree().paused = true

func show_learn_light_notice():
	$TextContainer/Text.text = "Floodlight acquired\nPress SHIFT to activate"
	visible = true
	get_tree().paused = true

func game_end():
	$TextContainer/Text.text = "You have reached the end."
	visible = true
	get_tree().paused = true

func _process(delta):
	if visible:
		if Input.is_action_just_pressed("ui_accept"):
			visible = false
			get_tree().paused = false
