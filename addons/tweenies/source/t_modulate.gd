@tool
class_name TModulate
extends Tweeny

@export var use_specific_starting_value: bool:
	set(value):
		if value == use_specific_starting_value: return
		use_specific_starting_value = value
		notify_property_list_changed()
var starting_value: Color = Color.WHITE
@export var final_value: Color

var _tween: Tween

func animate(target_object: CanvasItem) -> Tween:
	if _tween:
		_tween.kill()
	var tween: Tween = target_object.create_tween()
	if use_specific_starting_value:
		target_object.modulate = starting_value
	tween.tween_interval(delay)
	tween.set_ease(ease).set_trans(transition).set_loops(loops)
	tween.tween_property(target_object, "modulate", final_value, duration)
	_tween = tween
	return _tween

func _get_property_list():
	if Engine.is_editor_hint():
		var ret =[]
		if use_specific_starting_value:
			# This is how you add a normal variable, like String (TYPE_STRING), int (TYPE_INT)...etc
			ret.append({
			"name": &"starting_value",
			"type": TYPE_COLOR,
			"usage": PROPERTY_USAGE_DEFAULT,
			})
		return ret
