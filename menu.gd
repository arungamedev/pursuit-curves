extends Node2D


func _on_square_pressed() -> void:
	get_tree().change_scene_to_file("res://square.tscn")


func _on_circle_pressed() -> void:
	get_tree().change_scene_to_file("res://circular.tscn")
