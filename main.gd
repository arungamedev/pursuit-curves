extends Node2D

@onready var mouse = $Mouse
@onready var cat = $Cat
@onready var catcurve = $CatCurve
@onready var mousecurve = $MouseCurve

var u = 400.0
var v = 400.0

var moving = true

var hl = 300

var distance = 324-hl

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse.position = Vector2(576,324-hl)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moving:
		mouse.position += transform.rotated(mouse.rotation).x * u * delta
		cat.look_at(mouse.position)
		cat.position += transform.rotated(cat.rotation).x * v * delta
		mousecurve.add_point(mouse.global_position)
		catcurve.add_point(cat.global_position)
		
		distance = sqrt((mouse.position.x-cat.position.x)**2+(mouse.position.y-cat.position.y)**2)
		
		if distance < 1:
			moving = false
		
		if mouse.position.x >= 576 + hl and mouse.rotation_degrees == 0:
			mouse.position.x = 576 + hl
			mouse.rotation_degrees = 90
			print(distance)
		if mouse.position.y >= 324 + hl and mouse.rotation_degrees == 90:
			mouse.position.y = 324 + hl
			mouse.rotation_degrees = 180
			print(distance)
		if mouse.position.x <= 576 - hl and mouse.rotation_degrees == 180:
			mouse.position.x = 576 - hl
			mouse.rotation_degrees = 270
			print(distance)
		if mouse.position.y <= 324 - hl and mouse.rotation_degrees == 270:
			mouse.position.y = 324 - hl
			mouse.rotation_degrees = 0
			print(distance)
