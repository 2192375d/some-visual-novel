# the database for all information cached in runtime during game
# for now it only includes the story

extends Node

class_name RuntimeDB

var story: Story

func _init(new_story: Story) -> void:
	story = new_story
