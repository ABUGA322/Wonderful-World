extends Node2D

# This covers the shooting weapons
@export var weapon_type = 0

@export var shoot_delay := 0.2 # Time between two bullets being shot

@export var bullet_scene : PackedScene

# The weapon magazine (don't forget to check local_to_scene if you want to instantiate the weapon multiple times)
@export var magazine : QuiverMagazine

@export var holder_character : NodePath

var shoot_direction = null

var _shoot_time := 0.0
var _reload_time := 0.0

@onready var bullet_spawn_point := $BulletSpawnPoint
var character

@export var state_used = false
var animation_node

func pick():
	if magazine != null:
		magazine.reload() # TEMP 
	if !state_used:
		animation_node.play("ground")
	else:
		animation_node.play("default")

func delete():
	print(get_parent())
	if is_inside_tree():
		self.queue_free()
		#self.visible = false
		self.monitorable = false
		print("deleted")



func _on_weapon_exited_tree():
	print("Weapon has been removed from the tree!")

func _ready():
	connect("tree_exited", _on_weapon_exited_tree)
	if state_used:
		character = get_node(holder_character)
	animation_node = $AnimatedSprite2D
	if magazine != null:
		magazine.reload() # TEMP 
	if !state_used:
		animation_node.play("ground")
	else:
		animation_node.play("default")

func _process(delta):
	#print(global_position, get_parent())
	if state_used:
		_shoot_time += delta


func shoot():
	if _shoot_time < shoot_delay:
		return	
	_shoot_time = 0.0
	$AudioStreamPlayer2D.play()
	
	if magazine != null:
		if magazine.current_ammo <= 0:
			return
		magazine.shoot()
	
	# Instance a bullet
	var bullet : QuiverBullet = bullet_scene.instantiate()
#	bullet.top_level = true # Independent movement from weapon/player
	
	
	if magazine != null and magazine.auto_refill:
		bullet.bullet_destroyed.connect(self.bullet_destroyed)
	
	character.add_sibling(bullet)
	bullet.global_transform = bullet_spawn_point.global_transform
	bullet.init(shoot_direction)
	
func bullet_destroyed():
	magazine.current_ammo += 1

func reload_ammo_count():
	Global.emit_signal("ammo", magazine.current_ammo)
