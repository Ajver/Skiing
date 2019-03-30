extends KinematicBody2D

export(float) var max_speed
export(float) var speed_acceleration
export(float) var forward_acceleration

var velocity = Vector2(0, 0)

func _physics_process(delta):
	move_player()
		
func move_player():
	if Input.is_action_pressed("ui_left"):
		on_move_left()
	elif Input.is_action_pressed("ui_right"):
		on_move_right()
	else:
		slow_down()
	
	if velocity.y < -400:
		velocity.y -= forward_acceleration * 0.01
	else:
		velocity.y -= 2
		
	move_and_slide(velocity)
		
func on_move_left():
	velocity.x -= speed_acceleration
	velocity.x = max(velocity.x, -max_speed)
	pass
	
func on_move_right():
	velocity.x += speed_acceleration
	velocity.x = min(velocity.x, +max_speed)
	pass
	
func slow_down():
	velocity.x *= 0.9
	
	
	
	