extends Control

func _on_RetryBtn_pressed():
	get_tree().reload_current_scene()

func _on_QuitBtn_pressed():
	get_tree().quit()
