extends Area2D

onready var player = get_parent().get_node("Player")

var ready_for_player = true
	
func _ready():
	randomize()
	set_random_x_position()

func _process(delta):
	if is_below_screen():
		$Sprite.visible = true
		$PickupSound.playing = false
		ready_for_player = true
		set_random_position()
			
func _on_Coin_body_entered(body):
	if not ready_for_player:
		return
		
	$PickedParticles.emitting = true
	$PickupSound.playing = true
	$Sprite.visible = false
	ready_for_player = false
	body.on_coin()
		
func set_random_position():
	position.y = player.position.y - 600 - (randi() % 300)
	set_random_x_position()
	
func set_random_x_position():
	var screen_size = get_viewport_rect().size
	position.x = rand_range(0, screen_size.x)
	
func is_below_screen():
	return position.y > player.position.y + 300
	