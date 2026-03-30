# Responsible for changing the current scene to the target scene based on input
# SceneEnum, and arguments passed in the args array.
# Also responsible for storing all the scenes, which are loaded on boot

extends Node

var scene_dictionary: Dictionary[SceneEnum.Enum, PackedScene] = {
	SceneEnum.Enum.MAIN_MENU: load(&"uid://qc2yi6n1djk7"),
	SceneEnum.Enum.LOADING_SCREEN: load(&"uid://c81pmb1ewqpax"),
	SceneEnum.Enum.GAME: load(&"uid://dc3cao46b0ye0"),
}

#var loading_screen_scene: PackedScene = load(scene_dictionary.get(SceneEnum.Enum.LOADING_SCREEN))

# TO BE REMOVED
# scene_enum is the enum for the target scene
# args is the array containing inputs for the `with_data` method of the target 
# scene. The function expects it to match with the target scene's with_data's
# arguments
func switch_scene(scene_enum: SceneEnum.Enum, args: Array = []) -> void:
	assert(scene_enum in SceneEnum.Enum.values())
	
	var target_scene: PackedScene = scene_dictionary.get(scene_enum)
	
	assert(target_scene.can_instantiate())
	var target_node: Node = target_scene.instantiate()
	
	if !args.is_empty():
		assert(target_node.has_method(&"with_data"))
		target_node = target_node.callv(&"with_data", args)
	
	get_tree().change_scene_to_node(target_node)

#func switch_scene_to_game(story_enum: StoryEnum.Enum) -> void:
	#assert(story_enum in StoryEnum.Enum.values())
	#
	#var loading_screen: LoadingScreen = loading_screen_scene.instantiate()
	
	#pass
