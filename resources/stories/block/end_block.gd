extends Block

class_name EndBlock

@export var target_index: int = 0

# M: nothing
# M: modify history box by adding message "story complete!"
# W: nothing
# M: nothing
# E: emits the story complete signal
# does not need story asset
func execute(_interactive_component: InteractiveComponent, history_box: HistoryBox, _story_asset: StoryAsset, story_state: StoryState) -> void:
	history_box.add_history_message("story complete!")
	story_state.story_complete.emit(target_index)

func add_needed_resource(_story_asset: StoryAsset) -> void:
	pass
