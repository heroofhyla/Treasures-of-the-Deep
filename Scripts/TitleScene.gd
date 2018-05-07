extends Node2D

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Scenes/GameScene.tscn")
	
	if Input.is_action_just_pressed("credits"):
		show_credits()

func show_credits():
	$big_window.visible = !$big_window.visible
	pass
