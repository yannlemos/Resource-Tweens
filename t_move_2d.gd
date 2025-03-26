@tool
class_name TMove2D
extends Tweeny

@export var relative_to_current_position: bool
@export var position: Vector2
@export var global: bool

func play(target_object: CanvasItem) -> Tween:
	var tween: Tween = target_object.create_tween()
	tween.set_ease(ease).set_trans(transition)
	
	var target_position: Vector2
	if relative_to_current_position:
		if global:
			target_position = target_object.global_position + position
		else:
			target_position = target_object.position + position
		
	if global:
		tween.tween_property(target_object, "global_position", target_position, duration)
	else:
		tween.tween_property(target_object, "position", target_position, duration)
		
	return tween
