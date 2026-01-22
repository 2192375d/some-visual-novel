extends Node

const GAME_SCENE: PackedScene = preload("res://scenes/game.tscn")
const LOADING_SCREEN_SCENE: PackedScene = preload("res://scenes/loading_screen.tscn")
const MAIN_MENU: PackedScene = preload("res://scenes/main menu.tscn")

func run_game_scene() -> void:
	Cache.game_playing = true
	get_tree().change_scene_to_packed(GAME_SCENE)

func run_loading_screen_scene() -> void:
	Cache.game_playing = false
	get_tree().change_scene_to_packed(LOADING_SCREEN_SCENE)

func run_main_menu_scene() -> void:
	Cache.game_playing = false
	get_tree().change_scene_to_packed(MAIN_MENU)
