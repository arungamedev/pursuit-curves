extends Node2D

@onready var mouse = $Mouse
@onready var cat = $Cat
@onready var catcurve = $CatCurve
@onready var mousecurve = $MouseCurve
@onready var ubar = $ubar
@onready var vbar = $vbar
@onready var ulabel = $ulabel
@onready var vlabel = $vlabel
@onready var radiilabel = $radiilabel

var u = 1.0/3.0
var v = 1.0/3.0

var a = 300.0

var t = 0.0

var moving = true

var distance = 324-a
var distorigin = a

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ulabel.text = "u = " + str(int(ubar.value))
	vlabel.text = "v = " + str(int(vbar.value))
	
	t += delta
	if moving:
		var new_pos = Vector2(a * sin(t*u) + 576.0,-a * cos(t*u) + 324.0)
		mouse.look_at(new_pos)
		mouse.position = new_pos
		cat.look_at(mouse.position)
		cat.position += transform.rotated(cat.rotation).x * a * v * delta
		mousecurve.add_point(mouse.global_position)
		catcurve.add_point(cat.global_position)
		
		distance = sqrt((mouse.position.x-cat.position.x)**2+(mouse.position.y-cat.position.y)**2)
		
		distorigin = sqrt((cat.position.x-576)**2+(cat.position.y-324)**2)
		radiilabel.text = "radii ratio: " + str(distorigin/300.0)
		
		if distance < 1:
			moving = false

func _on_restart_pressed() -> void:
	moving = true
	t = 0
	mouse.position = Vector2(576,24)
	cat.position = Vector2(576,324)
	mouse.rotation_degrees = 0
	cat.rotation_degrees = 180
	mousecurve.clear_points()
	catcurve.clear_points()
	u = ubar.value/15.0
	v = vbar.value/15.0
