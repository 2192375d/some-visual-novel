# an instance of story, containing an array of array of Block, and an array
# containing the enums for the following stories

extends Resource

class_name Story

@export var story_lines: Array[StoryLine] = []
@export var next_stories: Array[StoryEnum.Enum] = [StoryEnum.Enum.NONE]

func get_block(index1: int, index2: int) -> Block:
	assert(index1 < story_lines.size() && index2 < story_lines[index1].blocks.size())
	return story_lines[index1].blocks[index2]

func get_num_story_line() -> int:
	return story_lines.size()

func get_story_line_size(index1: int) -> int:
	return story_lines[index1].get_size()

func get_next_story_enum(index: int) -> StoryEnum.Enum:
	assert(index < next_stories.size())
	return next_stories[index]
