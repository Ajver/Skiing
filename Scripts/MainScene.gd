extends Node2D

func game_over():
	$Player.on_game_over()
	$ReloadTimer.start()
	#AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -80)

func game_won():
	$Player.on_game_won()
	$HUD/WonGame.visible = true

func _on_ReloadTimer_timeout():
	$HUD/GameOverWindow.visible = true
