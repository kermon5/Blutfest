extends Node2D

var damage = 100.0

onready var anim:AnimationPlayer = $Node2D/AnimationPlayer
onready var area:Area2D = $Node2D/Area2D
onready var sound:AudioStreamPlayer2D = $Node2D/ExplosionSound


func _ready() -> void:
	anim.play("explosion")
	if sound.stream != null:
		sound.play()


# warning-ignore:unused_argument
func _process(delta: float) -> void:
	for body in area.get_overlapping_bodies():
			if body.is_in_group("ENEMIES"):
				apply_effect(body)

func apply_effect(body) -> void:
	if body.has_method("handle_hit"):
		body.handle_hit(damage, Globals.DamageType.EXPLOSION)


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if (anim_name=="explosion"):
		queue_free()
