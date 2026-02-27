extends Control

func _on_sala_jantar_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/comodos/sala_jantar.tscn")

func _on_sala_estar_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/comodos/sala_estar.tscn")

func _on_escritorio_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/comodos/escritorio.tscn")

func _on_quarto_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/comodos/quarto.tscn")
