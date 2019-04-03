extends Area2D

func _ready():
	set_random_x_position()

func _process(delta):
	if is_below_screen():
		set_random_position()

func _on_Coin_body_entered(body):
	if body.name == "Player":
		body.on_coin()
		set_random_position()
		
func set_random_position():
	position.y -= 700 + randi() % 500
	set_random_x_position()
	
func set_random_x_position():
	var screen_size = get_viewport_rect().size
	position.x = rand_range(0, screen_size.x)
	
func is_below_screen():
	var player = get_parent().get_node("Player")
	return position.y > player.position.y + 300
	