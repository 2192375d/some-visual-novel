extends Node

const GAME_SCENE: PackedScene = preload("res://scenes/game.tscn")
const LOADING_SCREEN_SCENE: PackedScene = preload("res://scenes/loading_screen.tscn")

func run_game_scene() -> void:
	Cache.game_playing = true
	get_tree().change_scene_to_packed(GAME_SCENE)

func run_loading_screen_scene() -> void:
	Cache.game_playing = false
	get_tree().change_scene_to_packed(LOADING_SCREEN_SCENE)
