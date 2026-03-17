extends VBoxContainer

@export var startup_story_enum: StoryEnum.Enum

# responsible for handling the action after a specific button is pressed

func _on_start_pressed() -> void:
	SceneManager.switch_scene(SceneEnum.Enum.LOADING_SCREEN, [startup_story_enum])

func _on_load_save_pressed() -> void:
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	get_tree().quit()
