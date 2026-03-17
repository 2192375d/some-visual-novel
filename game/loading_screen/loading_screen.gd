# takes input story_enum, loads the data for that enum and pass it to game

extends Control

class_name LoadingScreen

var story_enum: StoryEnum.Enum = StoryEnum.Enum.NONE

# expects the story_enum to load
func with_data(new_story_enum: StoryEnum.Enum) -> LoadingScreen:
	story_enum = new_story_enum
	return self

func _ready() -> void:
	assert(story_enum in StoryEnum.Enum.values() && story_enum != StoryEnum.Enum.NONE)
	
	var story: Story = load(StoryDB.get_story_id(story_enum))
	var runtimeDB: RuntimeDB = RuntimeDB.new(story)
	SceneManager.switch_scene(SceneEnum.Enum.GAME, [runtimeDB])
	
