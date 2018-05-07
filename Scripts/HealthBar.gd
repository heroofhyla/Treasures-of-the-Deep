extends Control

var max_health = 3
var health = 3
var BAR_HEIGHT = 4
var CHUNK_WIDTH = 8
var TOP_OFFSET = 10
var LEFT_OFFSET = 10
var OUTLINE_COLOR = Color("#444444")
var BAR_COLOR = Color("#880000")
var HULL_TEXT = load("res://Sprites/hull.png")

func _ready():
	pass

func update_sub(sub):
	max_health = sub.max_health
	health = sub.health
	update()

func _draw():
	draw_texture(HULL_TEXT, Vector2(LEFT_OFFSET-1, TOP_OFFSET - 7))
	draw_rect(Rect2(LEFT_OFFSET - 1, TOP_OFFSET - 1,(CHUNK_WIDTH + 1) * max_health + 1,BAR_HEIGHT + 2), OUTLINE_COLOR,true)
	for i in range(0, health):
		draw_rect(Rect2(LEFT_OFFSET + i*(CHUNK_WIDTH+1), TOP_OFFSET, CHUNK_WIDTH, BAR_HEIGHT),BAR_COLOR, true)
