extends KinematicBody2D

export(float) var max_move_speed
export(float) var move_acceleration
export(float) var forward_acceleration
export(float) var down_speed

var velocity = Vector2(0, 0)

onready var HUD_node = get_parent().get_node("HUD")
onready var height_label = HUD_node.get_node("Height")

const K2_HEIGHT = 8611
var height = K2_HEIGHT

func on_game_over():
	stop_player()
	
func on_game_won():
	stop_player()	
	height = 0
	update_height_label()
	
func _physics_process(delta):
	move_player(delta)
	set_height(delta)
	check_win()
	
func check_win():
	if height <= 0:
		get_parent().game_won()
		
func stop_player():
	velocity = Vector2(0, 0)
	set_physics_process(false)
	
func move_player(delta):
	if Input.is_action_pressed("ui_left"):
		on_move_left()
	elif Input.is_action_pressed("ui_right"):
		on_move_right()
	else:
		slow_down()
	
	if velocity.y < -400:
		velocity.y -= forward_acceleration * delta
	else:
		velocity.y -= 2
	
	move_and_slide(velocity)
	hit_walls()
	
func hit_walls():
	if position.x < 32:
		position.x = 32
	elif position.x > 920-32:
		position.x = 920-32
		
func on_move_left():
	velocity.x -= move_acceleration
	velocity.x = max(velocity.x, -max_move_speed)
	pass
	
func on_move_right():
	velocity.x += move_acceleration
	velocity.x = min(velocity.x, +max_move_speed)
	pass
	
func slow_down():
	velocity.x *= 0.9
	
func set_height(delta):
	height -= down_speed * delta * abs(velocity.y * 0.005)
	update_height_label()
	
func update_height_label():
	height_label.text = "Wysokosc:  " + str(round(height)) + " metrow"
	