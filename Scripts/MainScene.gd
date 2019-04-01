extends Node2D

func game_over():
	$Player.on_game_over()
	$HUD/GameOverWindow.visible = true

func game_won():
	$Player.on_game_won()
	$HUD/WonGame.visible = true