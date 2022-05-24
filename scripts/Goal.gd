extends Area


signal PlayerScored


func _on_body_entered(body: Node):
	if body.name == 'Ball':
		emit_signal('PlayerScored')
