@tool
class_name TModulate
extends Tweeny

var start_value: Color = Color.WHITE
var target_value: Color = Color.WHITE

func _get_tweened_property() -> NodePath:
	return "modulate"

func _get_target_value() -> Variant:
	return target_value

func _reset_to_start_value():
	_target_object.modulate = start_value

func _get_property_list():
	if Engine.is_editor_hint():
		var ret =[]
		if mode == Mode.FIXED:
			ret.append({
			"name": &"start_value",
			"type": TYPE_COLOR,
			"usage": PROPERTY_USAGE_DEFAULT,
			})
		ret.append({
		"name": &"target_value",
		"type": TYPE_COLOR,
		"usage": PROPERTY_USAGE_DEFAULT,
		})
		return ret
