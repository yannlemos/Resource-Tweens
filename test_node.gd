extends CanvasItem

@export var move_right: TMove2D
@export var fade_in_animation: TModulate
@export var fade_out_animation: TModulate
@export var red_out: TModulate
@export var curve: Curve

var _fade_in_tween: Tween
var _fade_out_tween: Tween

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		red_out.animate(self)
	
	if Input.is_action_just_pressed("ui_cancel"):
		fade_out()

func fade_in():
	if _fade_in_tween:
		_fade_in_tween.kill()
	_fade_in_tween = fade_in_animation.animate(self)

func fade_out():
	if _fade_out_tween:
		_fade_out_tween.kill()
	_fade_out_tween = fade_out_animation.animate(self)
