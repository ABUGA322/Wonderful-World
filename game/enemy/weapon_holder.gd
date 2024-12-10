extends Node2D

var weapon

func _ready() -> void:
	weapon = get_child(0)
	weapon.magazine.auto_refill = true

func drop_weapon():
	weapon.magazine.auto_refill = false
	weapon.state_used = false
	weapon.animation_node.play("ground")
	
	#var weap = weapon.duplicate()
	
	remove_child(weapon)
	get_tree().current_scene.add_child(weapon)
	#weapon.animation_node.play("ground")

	weapon.global_position = self.global_position
	#weapon.visible = false
	
	print("deleting")
	#weapon.queue_free()
	return
	pass

func _on_character_shoot() -> void:
	weapon.shoot()
	pass # Replace with function body.
