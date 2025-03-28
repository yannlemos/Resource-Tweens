@tool
class_name ResourceTween
extends Resource

signal finished

enum Mode {
	## The animation will always start from a value of [member start_value].
	FIXED,
	## The animation will start based on the current value of the target object.
	FLEXIBLE
}

## Determines how the animation starts.
@export var mode: Mode:
	set(value):
		if value == mode: return
		mode = value
		notify_property_list_changed()

@export_group("Tween")
@export var duration: float = 0.5
@export var ease: Tween.EaseType = Tween.EaseType.EASE_IN_OUT
@export var transition: Tween.TransitionType = Tween.TransitionType.TRANS_SINE
@export var loops: int = 0
@export var delay: float = 0

var _target_object: Node

func play(target_object: Node) -> Tween:
	if not _target_object: _target_object = target_object
	if mode == Mode.FIXED: target_object.set(StringName(_get_tweened_property()), _get_start_value())
	var tween = _target_object.create_tween()
	tween.tween_interval(delay)
	tween.set_ease(ease).set_trans(transition).set_loops(loops)
	tween.tween_property(_target_object, _get_tweened_property(), _get_target_value(), duration)
	tween.finished.connect(finished.emit)
	return tween

func _get_tweened_property() -> NodePath:
	return ""

func _get_start_value() -> Variant:
	return null

func _get_target_value() -> Variant:
	return null
