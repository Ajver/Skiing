extends Camera2D

export(float) var shake_power
export(float) var shake_time
var isShake = false
var curPos
var elapsedtime = 0

onready var player = get_parent()

func _ready():
    randomize()
    curPos = offset

func _physics_process(delta):
	if isShake:
		shake(delta) 
	else:
		var half_screen_width = get_viewport_rect().size.x * 0.5
		position.x = half_screen_width - player.position.x
	
func start_shake():
	isShake = true
	
func shake(delta):
	if elapsedtime<shake_time:
		var newOffset = Vector2(randf()-0.5, randf()-0.5) * shake_power
		offset = newOffset
		#offset_h = newOffset.x
		#offset_v = newOffset.y
		elapsedtime += delta
	else:
		isShake = false
		elapsedtime = 0
		offset = curPos     