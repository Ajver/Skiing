extends Node

var Rock = load("res://Scenes/Rock.tscn")
var Bush = load("res://Scenes/Bush.tscn")

onready var player = get_parent().get_node("Player")

func _on_NextObstacleTimer_timeout():
	$NextObstacleTimer.wait_time += 1
	
	var obs_type = randi() % 2
	var obstacle = null
	
	if obs_type == 0:
		obstacle = Bush.instance()
	else:
		obstacle = Bush.instance()
		
	obstacle.position.y = player.position.y - randi() % 500
	obstacle.set_random_x_position()
	add_child(obstacle)
	