# responsible for everything tied to block execution
# call start_story to start the story
# when story is completed, story_complete signal will emit with parameter of the next story's enum

extends RefCounted

class_name GameState

var story_state: StoryState
var story: Story
var story_asset: StoryAsset
signal story_complete(next_story_enum: StoryEnum.Enum)

func _init(new_story: Story, initial_story_state: StoryState, new_story_asset: StoryAsset) -> void:
	story = new_story
	story_state = initial_story_state
	story_state.story_complete.connect(func (next_story_index: int) -> void:
		assert(next_story_index < story.next_stories.size())
		var next_story_enum: StoryEnum.Enum = story.get_next_story_enum(next_story_index)
		story_complete.emit(next_story_enum)
	)
	story_asset = new_story_asset

func load_assets() -> void:
	story_asset = StoryAsset.new()
	for i in range(story.get_num_story_line()):
		for j in range(story.get_story_line_size(i)):
			var block: Block = story.get_block(i, j)
			block.add_needed_resource(story_asset)

func start_story(interactive_component: InteractiveComponent, history_box: HistoryBox) -> void:
	assert(story_asset)
	execute_current_block(interactive_component, history_box)

func execute_current_block(interactive_component: InteractiveComponent, history_box: HistoryBox) -> void:
	var block: Block = story.get_block(story_state.get_index1(), story_state.get_index2())
	block.execute(interactive_component, history_box, story_asset, story_state)
	await block.block_complete
	execute_current_block(interactive_component, history_box)
