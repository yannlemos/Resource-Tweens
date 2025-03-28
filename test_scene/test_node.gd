extends CanvasItem

@export var fade_in: TModulate
@export var fade_out: TModulate
@export var move_to_the_right: TPosition2D
@export var move_to_origin: TPosition2D

var _fade_tween: Tween = null
var _movement_tween: Tween = null

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		if _fade_tween: _fade_tween.kill()
		_fade_tween = fade_in.play(self)
	
	if Input.is_action_just_pressed("ui_down"):
		if _fade_tween: _fade_tween.kill()
		_fade_tween = fade_out.play(self)
	
	if Input.is_action_just_pressed("ui_right"):
		if _movement_tween: _movement_tween.kill()
		_movement_tween = move_to_the_right.play(self)
	
	if Input.is_action_just_pressed("ui_left"):
		if _movement_tween: _movement_tween.kill()
		_movement_tween = move_to_origin.play(self)
	
	if Input.is_action_just_pressed("ui_cancel"):
		if _movement_tween:
			_movement_tween.stop()
			_movement_tween.custom_step(99)
			_movement_tween.kill()
			_movement_tween = null
		if _fade_tween:
			_fade_tween.stop()
			_fade_tween.custom_step(99)
			_fade_tween.kill()
			_fade_tween = null
