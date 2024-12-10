extends QuiverCharacter



func hit(damage:=1, from:=Vector2.ZERO):
	super.hit(damage, from)
	
	$Visual/AnimationPlayer.play("Blink")

func die():
	await $WeaponHolder.drop_weapon()
	Global.enemy_killed()
	queue_free()
