extends Node

signal lose
signal win
signal pause
signal ammo(count)
signal update_hp(hp)

var enemy_count = 2

func reset():
	enemy_count = 2

func enemy_killed():
	enemy_count-=1
	if enemy_count <= 0:
		reset()
		emit_signal("win")
