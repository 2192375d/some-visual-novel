# responsible for the user interaction of the dialogue box. To be more precise:
# - displaying information on the screen
# - detecting user clicking on it

extends MarginContainer

class_name DialogueBox

@export var speaker_label: Label
@export var content_label: Label

@export var text_display_timer: Timer
@export var audio_stream_player: AudioStreamPlayer

var content_index: int
var content: String

signal box_click

func _ready() -> void:
	pass


func set_dialogue_speaker(speaker_name: String) -> void:
	speaker_label.text = speaker_name

func set_dialogue_content(new_content: String) -> void:
	content = new_content
	content_index = 0
	text_display_timer.start()

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if content_index < content.length():
				content_index = content.length() - 1
				display_current_content()
			else:
				box_click.emit()

func _on_timer_timeout() -> void:
	if content_index >= content.length():
		return
	display_current_content()
	content_index += 1
	
	text_display_timer.start()

func display_current_content() -> void:
	assert(content_index < content.length())
	
	content_label.text = content.substr(0, content_index)
	if !audio_stream_player.playing && content_index % 2 == 0 && content[content_index] != " ":
		audio_stream_player.pitch_scale = randf_range(0.96, 1.04)
		audio_stream_player.volume_db = randf_range(-22.0, -18.0)
		audio_stream_player.volume_db -= content_index / 10.0
		audio_stream_player.play()
