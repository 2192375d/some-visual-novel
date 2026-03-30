# Responsible for changing the current scene to the target scene based on input
# SceneEnum, and arguments passed in the args array.
# Also responsible for storing all the scenes, which are loaded on boot

extends Node

var scene_dictionary: Dictionary[SceneEnum.Enum, StringName] = {
	SceneEnum.Enum.MAIN_MENU: &"uid://qc2yi6n1djk7",
	SceneEnum.Enum.LOADING_SCREEN: &"uid://c81pmb1ewqpax",
	SceneEnum.Enum.GAME_LOADING_SCREEN: &"uid://f5j35ib7b70b",
	SceneEnum.Enum.GAME: &"uid://dc3cao46b0ye0",
}

var loading_screen_scene: PackedScene = load(scene_dictionary.get(SceneEnum.Enum.LOADING_SCREEN))
var game_loading_screen_scene: PackedScene = load(scene_dictionary.get(SceneEnum.Enum.GAME_LOADING_SCREEN))

func switch_scene_to_game(story_enum: StoryEnum.Enum) -> void:
	assert(story_enum in StoryEnum.Enum.values())
	
	print("switching to game scene with enum: ", StoryEnum.Enum.find_key(story_enum))
	
	var game_loading_screen: GameLoadingScreen = game_loading_screen_scene.instantiate()
	get_tree().change_scene_to_node(game_loading_screen)
	game_loading_screen.start_loading(story_enum)
	var game: Game = await game_loading_screen.loading_complete
	get_tree().change_scene_to_node(game)

# use switch_scene_to_game for game specifically, the rests can use this
func switch_scene(scene_enum: SceneEnum.Enum) -> void:
	assert(scene_enum in SceneEnum.Enum)
	assert(scene_enum != SceneEnum.Enum.GAME)
	assert(scene_enum != SceneEnum.Enum.LOADING_SCREEN)
	assert(scene_enum != SceneEnum.Enum.GAME_LOADING_SCREEN)
	
	var loading_screen: LoadingScreen = loading_screen_scene.instantiate()
	get_tree().change_scene_to_node(loading_screen)
	loading_screen.start_loading(scene_enum)
	var target_node: Node = await loading_screen.loading_complete
	get_tree().change_scene_to_node(target_node)
