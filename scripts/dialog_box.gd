extends MarginContainer

@export var starting_index: int


@onready var index: int = starting_index
@onready var dialogue_content: Label = $VBoxContainer/dialogue/content

var story: Array[String] = [
	"I'm a bee, meow meow meow meow meow",
	"Two bees are nice",
	"two bees or not two bees, that is a question.",
	"I ate a hunburger esterday",
	"today is yesterday",
	"cats are cute",
	"bees are also cute"
]

func _ready() -> void:
	dialogue_content.text = story[starting_index]

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("confirm"):
		index += 1
		
		dialogue_content.text = story[index]
