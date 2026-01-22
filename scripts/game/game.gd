extends Control

@export_group("FIXED")
@export var load_menu_scene: PackedScene

func _on_game_runner_subchapter_complete() -> void:
	var connections: Array[Connection] = Cache.get_subchapter().connections
	if connections.size() == 0:
		printerr("connection is empty")
	if connections.size() == 1:
		Cache.set_subchapter_enum_to_load(Cache.get_subchapter().connections[0].target_subchapter_enum)
		SceneFlow.run_loading_screen_scene()
	else:
		printerr("multiple connection functionality not implementated yet")

func _on_save_load_pressed() -> void:
	var load_menu: CanvasLayer = load_menu_scene.instantiate()
	add_child(load_menu)
