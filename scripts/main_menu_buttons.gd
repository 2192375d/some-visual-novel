extends Panel

@export var game_scene: PackedScene

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)
