extends Item

export (int) var points = 100

func pick_up(_player:Player):
	_player.add_points(points)
	queue_free()
