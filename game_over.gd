extends Control




func _on_button_pressed() -> void:
	Global.score=0
	get_tree().change_scene_to_file("res://Game.tscn")
