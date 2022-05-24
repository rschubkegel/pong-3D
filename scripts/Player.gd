extends KinematicBody


export var player : int
export var speed : int = 5


func _physics_process(delta):
	if Input.is_action_pressed('p%d_up' % player):
		move_and_collide(Vector3.UP * speed * delta)
	if Input.is_action_pressed('p%d_down' % player):
		move_and_collide(Vector3.DOWN * speed * delta)
