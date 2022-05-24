extends Node


signal reset_ball


export (Array, NodePath) var score_labels
export var points_to_win : int
var _score_labels : Array
var _scores : Array


func _ready():
	for path in score_labels:
		_score_labels.append(get_node(path))
	reset()


func reset():
	_scores = [0, 0]
	for label in _score_labels:
		label.text = '0'
	emit_signal('reset_ball')


func score(player : int):
	_scores[player - 1] += 1
	_score_labels[player - 1].text = str(_scores[player - 1])
	if _scores[player - 1] >= points_to_win:
		$ResetTimer.start()
	else:
		emit_signal('reset_ball')
