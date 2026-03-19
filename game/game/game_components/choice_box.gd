# responsible for the user interaction of the choice box

extends VBoxContainer

class_name ChoiceBox

@export var buttons: Array[Button]

signal choice_click(choice_index: int)

func _ready() -> void:
	for i in range(buttons.size()):
		buttons[i].hide()
		buttons[i].pressed.connect(
		func(): 
			choice_click.emit(i)
			for j in range(buttons.size()):
				buttons[j].hide()
		)

func display_choice_box(choice_messages: Array[String]) -> void:
	assert(choice_messages.size() <= buttons.size())
	for i in range(choice_messages.size()):
		buttons[i].text = choice_messages[i]
		buttons[i].show()
