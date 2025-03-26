@tool
class_name Tweeny
extends Resource

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

func play(tween: Tween, target_object: Node) -> Tween:
	if not _target_object: _target_object = target_object
	if tween: tween.kill()
	if mode == Mode.FIXED: _reset_to_start_value()
	tween = _target_object.create_tween()
	tween.tween_interval(delay)
	tween.set_ease(ease).set_trans(transition).set_loops(loops)
	tween.tween_property(_target_object, _get_tweened_property(), _get_target_value(), duration)
	return tween

func finish(tween: Tween):
	if not tween: return
	tween.stop()
	tween.custom_step(99)

func _get_tweened_property() -> NodePath:
	return ""

func _reset_to_start_value():
	pass

func _get_target_value() -> Variant:
	return null
