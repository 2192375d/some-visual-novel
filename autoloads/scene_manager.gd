# responsible for changing the current scene to the target scene based on input
# SceneEnum, and arguments passed in the args array
# The scenes are loaded on boot

extends Node

var scene_dictionary: Dictionary[SceneEnum.Enum, PackedScene] = {
	SceneEnum.Enum.LOADING_SCREEN: load("uid://c81pmb1ewqpax"),
	SceneEnum.Enum.GAME: load("uid://dc3cao46b0ye0")
}

func switch_scene(scene_enum: SceneEnum.Enum, args: Array = []) -> void:
	assert(scene_enum in SceneEnum.Enum.values())
	
	var target_scene: PackedScene = scene_dictionary.get(scene_enum)
	
	assert(target_scene.can_instantiate())
	var target_node: Node = target_scene.instantiate()
	
	if !args.is_empty():
		assert(target_node.has_method(&"with_data"))
		target_node = target_node.callv(&"with_data", args)
	
	get_tree().change_scene_to_node(target_node)
