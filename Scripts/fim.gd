extends Node2D

func _on_botao_iniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/Menu Inicial.tscn")
