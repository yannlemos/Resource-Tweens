class_name TScale2D
extends Tweeny

@export var value: Vector2

func play(
	target_object: CanvasItem, 
	target_value: Vector2 = value, 
	duration: float = duration, 
	ease: Tween.EaseType = ease, 
	transition: Tween.TransitionType = transition
	) -> Tween:
	
	var tween: Tween = target_object.create_tween()
	tween.set_ease(ease).set_trans(transition)
	tween.tween_property(target_object, "scale", target_value, duration)
	return tween
