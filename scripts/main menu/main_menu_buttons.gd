extends Panel

@export var new_save_subchapter_enum: Enums.SubchapterEnum
@export_group("FIXED")
@export var loading_screen_scene: PackedScene
@export var load_menu_scene: PackedScene

@onready var load_menu: CanvasLayer = load_menu_scene.instantiate()

func _on_new_game_pressed() -> void:
	Cache.set_subchapter_enum_to_load(new_save_subchapter_enum)
	SceneFlow.run_loading_screen_scene()

func _on_load_save_pressed() -> void:
	get_parent().add_child(load_menu)

func _on_quit_pressed() -> void:
	get_tree().quit()
