extends Control

# Emited if the player wants to restart the game
signal restart

func _ready():
	Global.lose.connect(show_game_over)


func show_game_over():
	visible = true
	get_tree().paused = true
	
	
func hide_game_over():
	pass
	#visible = false
	#restart.emit()
	#get_tree().paused = false

func go_to_menu():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func restart_level():
	Global.reset()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_restart_pressed() -> void:
	restart_level()
	pass # Replace with function body.


func _on_menu_pressed() -> void:
	go_to_menu()
	pass # Replace with function body.
