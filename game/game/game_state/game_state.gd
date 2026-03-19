# the database for all information cached in runtime during game
# for now it only includes the story

extends RefCounted

class_name GameState

var story: Story
var game_story_index: GameStoryIndex

signal story_complete(next_story_enum: StoryEnum.Enum)

func _init(new_story: Story) -> void:
	story = new_story
	game_story_index = GameStoryIndex.new()

func get_story() -> Story:
	return story

func get_current_block() -> Block:
	var index1: int = game_story_index.get_index1()
	var index2: int = game_story_index.get_index2()
	
	return get_story().get_block(index1, index2)

func get_story_index() -> GameStoryIndex:
	return game_story_index

func set_story_index(index1: int, index2: int) -> void:
	get_story_index().set_index1(index1)
	get_story_index().set_index2(index2)

func complete_story(index: int) -> void:
	var story_enum: StoryEnum.Enum = story.get_next_story(index)
	story_complete.emit(story_enum)
