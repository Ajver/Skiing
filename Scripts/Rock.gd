extends Area2D

func _ready():
	set_random_x_position()
	position.y -= (randi() % 2000)

func _on_Rock_body_entered(body):
	if body.name == "Player":
		get_parent().get_parent().game_over()


func _on_Rock_area_entered(area):
	if area.name == "BottomOfSceen":
		position.y -= 1000
		set_random_x_position()

func set_random_x_position():
	position.x = randi() % 920
	