# Resource Tweens
Create, edit and use Godot's Tweens as Resources. Plugin for Godot 4.4.

![image](https://github.com/user-attachments/assets/6a7e989c-4df7-424c-ad16-bb2de3022359)

> [!CAUTION]
> This plugin is in early-access and not at all production-ready. Use at your own risk.

## What
ResourceTweens wraps Godot's Tweens initialization code in a Resource type. This allows you to create, edit and use Tweens by declaring them as export variables, reutilize recurrent animations and avoid animation boilerplate in your code.
All you have to do is declare one of the ResourceTween types (e.g. each type of Tween needs a unique class to handle it, like position, scale, etc) and then call `play()` passing the tweened node as a parameter, which will then return a Tween.
It's advisable to store this Tween to manipulate its lifetime. But that's pretty much it.

## Example
```
extends CanvasItem

@export var fade_in: TModulate
@export var fade_out: TModulate
@export var move_to_the_right: TPosition2D
@export var move_to_origin: TPosition2D

var _fade_tween: Tween = null
var _movement_tween: Tween = null

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
		_force_finish_tween(_movement_tween)
		_force_finish_tween(_fade_tween)

func _force_finish_tween(tween: Tween):
	if not tween: return
	tween.stop()
	tween.custom_step(99)
	tween.kill()
	tween = null
```
![image](https://github.com/user-attachments/assets/2ef92f72-3880-49b9-bae4-1f57b0a6502e)


## Why
### Minimize boilerplate code
I love using tweens, and use them a lot. However, they tend to need a lot of boilerplate code which ends up polluting your code and, if not handled in a very organized way, end up producing bugs.

### Allow editing in the inspector
Tweens end up buried in deeply nested code, which is the opposite of artist or game designer friendly. By enabling editing through the inspector, ResourceTweens make it much easier for teams to edit animations freely without needing to go to a programmer.

### Avoid code duplication
Since the initialization code is wrapped in a separate class, this minimizes the need for a lot of duplicated calls of `set_ease()`, `tween_property()` and the likes. Less code, less maintenance.

### Still allow complex Tweens
You can still use Tweens artisanally and initialize them by hand, but for small animations or recurrent ones, like a fade-in, you can use a saved ResourceTween instead.

## How To Contribute
Everything is really rudimentary right now, but if you'd like to contribute, you can create new ResourceTween types by following the `TModulate` and `TPosition2D` examples in the repo. The downside of wrapping tweens in Resources is that you need specific classes for specific properties that you'll tween, so there's some upfront work to be done. However, there's a lot of potential to create really powerful and customizable classes that allows complex tweens to be simplified and editable in the inspector. So that's a good first step.

You can follow this template:
```
# Specify the class_name following the current convention
# e.g. TScale3D or TRotation2D
extends ResourceTween

# You should specify the types here and use @export 
# unless you're going to do editor shenanigans, 
# like conditionally hiding variables and stuff like that
var start_value
var target_value

func _get_tweened_property() -> NodePath:
	# Set the property here as you would in a tween, 
	# e.g. "modulate", or "position"
	return ""

func _get_start_value() -> Variant:
	return start_value

func _get_target_value() -> Variant:
	return target_value
```

## Credits

Developed by [Yann Lemos](https://github.com/yannlemos).
Released under the MIT license.
Special thanks to my friends at Studio Bravarda.

Godot Logo (C) Andrea Calabró, distributed under the terms of the Creative Commons Attribution 4.0 International License (CC-BY-4.0 International) <https://creativecommons.org/licenses/by/4.0/>
