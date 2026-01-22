extends Control

@export_group("FIXED")
@export var game_scene: PackedScene


func _ready() -> void:
	print("loading!")
	Cache.set_subchapter(Utils.get_subchapter(Cache.get_subchapter_enum_to_load()))
	print("loading complete! subchapter: ", Cache.get_subchapter().title)
	SceneFlow.run_game_scene()
