extends Node

# in every timeout time to next obstacle will be increased by time_step 
export(float) var timer_step

onready var types = [
	load("res://Scenes/Rock.tscn"),
	load("res://Scenes/Bush.tscn")
]

onready var player = get_parent().get_node("Player")

func _on_NextObstacleTimer_timeout():
	$NextObstacleTimer.wait_time += timer_step
	
	var obs_type = randi() % types.size()
	var obstacle = types[obs_type].instance()
	add_child(obstacle)
		
	obstacle.position.y = player.position.y - randi() % 500
	obstacle.set_random_x_position()
	