extends Control



func _on_menu_pressed() -> void:
	go_to_menu()
	pass # Replace with function body.



func _ready():
	Global.win.connect(show_game_win)


func show_game_win():
	visible = true
	get_tree().paused = true
	

func go_to_menu():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
