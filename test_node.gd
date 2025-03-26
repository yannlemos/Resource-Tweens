extends CanvasItem

@export var change_to_red: TModulate
@export var blue_to_green: TModulate

@export var move_to_zero_from_middle: TMove2D
@export var move_a_bit_to_the_right: TMove2D

var modulate_tween: Tween
var position_tween: Tween

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		position_tween = move_to_zero_from_middle.play(position_tween, self)
		modulate_tween = change_to_red.play(modulate_tween, self)
	
	if Input.is_action_just_pressed("ui_cancel"):
		position_tween = move_to_zero_from_middle.finish(position_tween)
		modulate_tween = change_to_red.finish(modulate_tween)
		#modulate_tween = blue_to_green.play(modulate_tween, self)
		#position_tween = move_a_bit_to_the_right.play(position_tween, self)
