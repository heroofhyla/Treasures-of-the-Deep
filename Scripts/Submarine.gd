extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var velocity = Vector2()
var input = Vector2()
var friction = Vector2()
export var MAX_SPEED = 200
export var ACCEL = 100
export var FRICTION = 50
var lit = false
var last_pos = Vector2()
var facing = 1
var health = 3
var max_health = 3

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func die():
	$Sprite.vframes = 1
	$AnimationPlayer.play("Explosion")
	$AnimationPlayer.connect("animation_finished",self,"game_over")

func gain_health(amt):
	print("Got a health pickup")
	health += amt
	health = min(health, max_health)
	var anim = $AnimationPlayer.assigned_animation
	print("Current anim: " + str(anim))
	$AnimationPlayer.queue("Flash")
	$AnimationPlayer.queue(anim)
	get_tree().call_group("HUD", "update_sub", self)
	

func gain_max_health(amt):
	print("Got a max health pickup")
	max_health += amt
	health = max_health
	get_tree().call_group("HUD", "update_sub", self)
	get_tree().call_group("HUD", "show_max_health_notice")


func game_over(anim):
	get_tree().change_scene("res://Scenes/GameOverScene.tscn")

func damage(amt):
	health -= amt
	get_tree().call_group("HUD", "update_sub", self)
	if health <= 0:
		die()

func _physics_process(delta):
	
	if position.y < 80 && velocity.y < 0:
		velocity.y *= .5
	input.x = 0
	input.y = 0
	
	last_pos.x = position.x
	last_pos.y = position.y
	
	friction = velocity.normalized() * FRICTION * delta
	
	friction.x = min(abs(friction.x), abs(velocity.x))
	friction.y = min(abs(friction.y), abs(velocity.y))
	
	friction.x *= sign(velocity.x)
	friction.y *= sign(velocity.y)
	
	velocity -= friction
	
	if Input.is_action_pressed("move_left"):
		input.x -= 1
	
	if Input.is_action_pressed("move_right"):
		input.x += 1
	
	if Input.is_action_pressed("move_down"):
		input.y += 1
	
	if Input.is_action_pressed("move_up") && position.y > 80:
		input.y -= 1
	
	if abs(input.x) == 1 && facing != input.x:
			facing = input.x
			$Sprite.scale.x = facing
			$Particles2D.position.x *= -1
			$Flashlight.scale.x *= -1
		
	input = input.normalized() * (ACCEL * delta)
	velocity += input
	if velocity.length() > MAX_SPEED:
		velocity = velocity.normalized() * MAX_SPEED
	move_and_slide(velocity)
	
	velocity.x = (position.x - last_pos.x)/(delta)
	velocity.y = (position.y - last_pos.y)/(delta)
	
	if velocity.length() > 0:
		$Particles2D.emitting = true
	else:
		$Particles2D.emitting = false
	
	
	if Input.is_action_just_pressed("toggle_light"):
		$Flashlight.enabled = !($Flashlight.enabled)
		lit = !lit
		if lit:
			$AnimationPlayer.queue("Lit")
		else:
			$AnimationPlayer.queue("Unlit")
	
	
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
