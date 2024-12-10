extends QuiverCharacterVisual


# This is a Visual meant to be used with an AnimatedSprite2D node
# The animations should be named "0" "1" "2"... each animation coresponding to a rotation of the character
# The animation "0" should be the enemy facing right
# The next animations represents the character rotated in clockwise order

enum RotationMode {NONE, AIMING, MOVING}

# Will the character rotate on aiming or moving ?
@export var rotation_mode : RotationMode = RotationMode.AIMING

# How many different angles do you want your character to rotate
# You will need to have a walking animation for each angle
@export var rotation_clamping := 4

@onready var legs: AnimatedSprite2D = $Legs
@onready var body: AnimatedSprite2D = $Body

#@onready var weapon = $DistanceWeapon


func update_visual(action: QuiverCharacterAction):
	if action.moving_direction.length() > 0:
		legs.visible = true
		legs.play("default")
	else:
		legs.visible = false
		legs.play("stop")
	
