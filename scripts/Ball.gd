extends RigidBody


export var start_speed : float = 5
var _players : Array


func _ready():
	_players = get_tree().get_nodes_in_group('player')
	randomize()
	reset()


func _on_body_entered(body):
	if body in _players:
		linear_velocity *= 1.2


func reset():
	# reset position to 0,0
	mode = MODE_KINEMATIC
	global_transform.origin = Vector3.ZERO
	mode = MODE_RIGID

	# randomize start speed
	var speed = Vector2(1, randf()).normalized() * start_speed
	linear_velocity.x = speed.x
	linear_velocity.y = speed.y
	if randf() > 0.5: # randomly go left
		linear_velocity.x *= -1
	if randf() > 0.5: # randomly point down
		linear_velocity.y *= -1
