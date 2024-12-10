extends QuiverCharacterBehavior

@onready var player_detector = $PlayerDetector

const AVOID_DISTANCE = 200
# returns the player input movement direction



func _physics_process(delta):
	#print(player_detector.player_is_in_range())
	if player_detector.player_is_in_range():
		var player_pos = player_detector.get_player_position()
		action.aiming_direction = global_position.direction_to(player_pos)
		action.shoot = true
		var direction_to_target = (player_pos - global_position).normalized()
		var distance_to_target = global_position.distance_to(player_pos)
		if distance_to_target > AVOID_DISTANCE:
			action.moving_direction = direction_to_target
		else:
			var avoid_direction = Vector2(-direction_to_target.y, direction_to_target.x)
			action.moving_direction = avoid_direction
