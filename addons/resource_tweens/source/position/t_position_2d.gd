@tool
class_name TPosition2D
extends ResourceTween

var start_value: Vector2 = Vector2.ZERO
var target_value: Vector2 = Vector2.ZERO
var relative_positioning: bool = false

func _get_tweened_property() -> NodePath:
	return "position"

func _get_start_value() -> Variant:
	return start_value

func _get_target_value() -> Variant:
	if relative_positioning: return target_value + _target_object.position
	return target_value

func _get_property_list():
	if Engine.is_editor_hint():
		var ret =[]
		if mode == Mode.FIXED:
			ret.append({
			"name": &"start_value",
			"type": TYPE_VECTOR2,
			"usage": PROPERTY_USAGE_DEFAULT,
			})
		else:
			ret.append({
			"name": &"relative_positioning",
			"type": TYPE_BOOL,
			"usage": PROPERTY_USAGE_DEFAULT,
			})
		ret.append({
		"name": &"target_value",
		"type": TYPE_VECTOR2,
		"usage": PROPERTY_USAGE_DEFAULT,
		})
		return ret
