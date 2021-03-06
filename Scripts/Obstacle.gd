extends Area2D

onready var world_node = get_parent().get_parent()
onready var player = world_node.get_node("Player")
	
func _ready():
	randomize()
	set_random_position()
	
func _process(delta):
	if is_below_screen():
		set_random_position()

func _on_Obstacle_body_entered(body):
	if body.name == "Player":
		world_node.game_over()

func is_below_screen():
	return position.y > player.position.y + 300
	
func set_random_position():
	position.y = player.position.y - 600 - (randi() % 300)
	set_random_x_position()
	
func set_random_x_position():
	var screen_size = get_viewport_rect().size
	position.x = rand_range(0, screen_size.x)
	
func set_position(npos : Vector2):
	position = npos