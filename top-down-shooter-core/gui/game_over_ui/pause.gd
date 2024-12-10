extends Control


func _ready() -> void:
	Global.pause.connect(show_pause)

func _on_continue_pressed() -> void:
	show_pause()
	pass # Replace with function body.



func _on_menu_pressed() -> void:
	print("menu")
	go_to_menu()
	pass # Replace with function body.


func show_pause():
	if !self.visible:
		visible = true
		get_tree().paused = true
	else:
		visible = false
		get_tree().paused = false


func go_to_menu():
	get_tree().paused = false
	print("menu")
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	pass # Replace with function body.
