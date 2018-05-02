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

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _physics_process(delta):
	if position.y < 80 && velocity.y < 0:
		velocity.y *= .5
	input.x = 0
	input.y = 0
	
	friction = velocity.normalized() * FRICTION * delta
	
	friction.x = min(abs(friction.x), abs(velocity.x))
	friction.y = min(abs(friction.y), abs(velocity.y))
	
	friction.x *= sign(velocity.x)
	friction.y *= sign(velocity.y)
	
	velocity -= friction
	
	if Input.is_action_pressed("ui_left"):
		input.x -= 1
	
	if Input.is_action_pressed("ui_right"):
		input.x += 1
	
	if Input.is_action_pressed("ui_down"):
		input.y += 1
	
	if Input.is_action_pressed("ui_up") && position.y > 80:
		input.y -= 1
	

	input = input.normalized() * (ACCEL * delta)
	velocity += input
	if velocity.length() > MAX_SPEED:
		velocity = velocity.normalized() * MAX_SPEED
	move_and_collide(velocity * delta)
	
	if velocity.length() > 0:
		$Particles2D.emitting = true
	else:
		$Particles2D.emitting = false
	
	
	if Input.is_action_just_pressed("ui_accept"):
		lit = !lit
	
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
