extends Perk

func add_effect():
	if player.has_method("level_up"):
		player.explosion_on_level_up = true
