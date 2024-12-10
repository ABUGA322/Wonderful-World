extends Node2D

func pick_weapon(area) -> void:
	drop_weapon()
	
	area.character = get_parent()
	var copy = area.duplicate()
	
	#get_tree().current_scene.add_child(area)
	area.delete()
	
	print("----------------",area.visible)
	self.add_child(copy)
	
	
	
	copy.state_used = true
	
	var weapon = copy
	weapon.position = Vector2(0,0)
	weapon.pick()
	weapon.reload_ammo_count()

	#area.queue_free()
	return

func drop_weapon():
	if self.get_child_count() > 0:
		var child = get_child(0)
		self.remove_child(child)
		child.queue_free()
	pass

#func _physics_process(delta: float) -> void:
	#print(get_parent(), get_child_count())

func _on_character_shoot() -> void:
	if self.get_child_count() > 0:
		var weapon = get_child(0)
		weapon.shoot()
		weapon.reload_ammo_count()
	pass # Replace with function body.
