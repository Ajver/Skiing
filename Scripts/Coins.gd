extends Label

signal next_coin

export(float) var bounce_duration = 1.0
export(float) var bounce_force = 1.0

var is_bouncing = false
var timer : float = 0
onready var default_scale = rect_scale 

func on_next_coin():
	is_bouncing = true
	timer = 0
	
func _process(delta):
	if is_bouncing:
		timer += delta
		var s = default_scale.x * (1.0 + sin((timer / bounce_duration) * PI) * bounce_force)
		rect_scale = Vector2(s, s)
		if timer >= bounce_duration:
			is_bouncing = false
			rect_scale = default_scale
	