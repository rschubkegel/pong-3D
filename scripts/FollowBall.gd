extends Camera


export var max_zoom : float = 15
export var ball : NodePath
onready var _ball : Node = get_node(ball)
onready var _initial_zoom : float = translation.z
onready var _initial_ball_speed : float = _ball.linear_velocity.length()


func _physics_process(delta):
	# move sideways
	translation.x = lerp(translation.x, _ball.translation.x, delta)
	
	# zoom out as ball speed increases
	var target_z = min(_initial_zoom + _ball.linear_velocity.length() - _initial_ball_speed, max_zoom)
	translation.z = lerp(translation.z, target_z, delta)
	
	# rotate
	var a = Quat(transform.basis)
	var b = Quat(transform.looking_at(_ball.transform.origin, Vector3.UP).basis)
	transform.basis = Basis(a.slerp(b, min(delta * 10, 1)))
