extends Control

func change_time(new_time):
	var minute: String = str(new_time.minute)
	if len(minute) < 2:
		minute = "0" + minute
	$Time.text = str(new_time.hour) + ":" + minute + "am" if new_time.am else "pm"

func _unhandled_input(event):
	if event.is_action_pressed("commands"):
		$Commands.text = ""
		($Commands as LineEdit).show()
		($Commands as LineEdit).grab_focus()

func _on_commands_text_submitted(command):
	$Commands.hide()
	var no_slash: String = command
	if no_slash.begins_with("/"):
		no_slash = no_slash.substr(1)
	var parsed: Array = no_slash.split(" ")
	if parsed[0] == "charstate":
		match parsed[1]:
			"noclip":
				States.character_state = States.CharacterStates.NOCLIP
			"fly":
				States.character_state = States.CharacterStates.FLY
			"normal":
				States.character_state = States.CharacterStates.NORMAL

func _on_commands_focus_exited():
	$Commands.hide()
