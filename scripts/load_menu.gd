extends CanvasLayer

@export_group("FIXED")
@export var back_to_main_menu_button: Button
@export var blur_rectangle: ColorRect

func _ready() -> void:
	if !Cache.game_playing:
		back_to_main_menu_button.disabled = true
	
	blur_rectangle.show()

func _on_go_back_pressed() -> void:
	queue_free()
