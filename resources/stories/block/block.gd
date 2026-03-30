@abstract class_name Block

extends Resource

signal block_complete

@abstract func execute(interactive_component: InteractiveComponent, history_box: HistoryBox, story_asset: StoryAsset, story_state: StoryState) -> void
#@abstract func execute(game: Game) -> void

func add_needed_resource(_story_asset: StoryAsset) -> void:
	pass
