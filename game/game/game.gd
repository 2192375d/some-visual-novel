extends Control

class_name Game

var runtime_db: RuntimeDB

func with_data(new_runtime_db: RuntimeDB) -> void:
	runtime_db = new_runtime_db

func _ready() -> void:
	print("game is running, with story ", runtime_db.story)
