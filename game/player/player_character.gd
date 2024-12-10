extends QuiverCharacter

@export var gui_path: NodePath



var can_pick_weapon := false
var last_picking_weapon = null

func hit(damage:=1, from:=Vector2.ZERO):
	super.hit(damage, from)
	
	Global.emit_signal("update_hp",character_stats.current_life)
	$Visual/AnimationPlayer.play("Blink")


func _process(delta):
	if Input.is_action_just_pressed("pick_weapon"):
		if can_pick_weapon:
			print("pick")
			if last_picking_weapon.weapon_type == 1:
				$Visual/Body.frame = 1
			else:
				$Visual/Body.frame = 0
			$WeaponHolder.pick_weapon(last_picking_weapon)
			
			can_pick_weapon = false
			last_picking_weapon = null

	#print( $WeaponHolder.get_child_count())


	

func _on_weapon_detection_area_entered(area: Area2D) -> void:
	print("weapon_entered")
	last_picking_weapon = area
	can_pick_weapon = true
	pass # Replace with function body.


func _on_weapon_detection_area_exited(area: Area2D) -> void:
	print("weapon_exited")
	if last_picking_weapon == area:
		can_pick_weapon = false
	pass # Replace with function body.
