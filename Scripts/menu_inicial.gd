extends Control

func _on_botao_iniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/inicio.tscn")

func _on_botao_creditos_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/creditos.tscn")

func _on_botao_sair_pressed() -> void:
	get_tree().quit()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/comodos/jantar_final.tscn")
