extends KinematicBody2D

export(float) var max_move_speed
export(float) var move_acceleration
export(float) var forward_acceleration
export(float) var max_forward_speed
export(float) var down_speed

var velocity = Vector2(0, 0)

onready var HUD_node = get_parent().get_node("HUD")
onready var height_label = HUD_node.get_node("Height")
onready var reached_label = HUD_node.get_node("Reached")
onready var coins_label = HUD_node.get_node("Coins")

const K2_HEIGHT 	= 8611
var height : float  = K2_HEIGHT
var reached : float = 0
var num_coins : int = 0

func on_game_over():
	stop_player()
	
func on_coin():
	num_coins += 1
	
func _physics_process(delta):
	move_player(delta)
	set_height(delta)
	check_win()
	update_reached()
	update_HUD()
	
func check_win():
	if height <= 0:
		height = 0
		stop_player()	
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
		if velocity.y < -max_forward_speed:
			velocity.y = -max_forward_speed
	else:
		velocity.y -= 2
	
#warning-ignore:return_value_discarded
	move_and_slide(velocity)
	hit_walls()
	
func hit_walls():
	var screen_size = get_viewport_rect().size
	position.x = clamp(position.x, 32, screen_size.x-32)
		
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
	
func update_reached():
	reached = K2_HEIGHT - height
	
func update_HUD():
	height_label.text = "Wysokosc:  " + str(round(height)) + " metrow"
	reached_label.text = "Przejechane:  " + str(round(reached)) + " metrow"
	coins_label.text = "Monety:  " + str(num_coins)
	