extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.ammo.connect(ammo)
	Global.update_hp.connect(update_hp)
	pass 
	
func ammo(count) -> void:
	$MarginContainer/Label.text = str(count)
	pass

func update_hp(hp):
	$MarginContainer/ProgressBar.value = hp
