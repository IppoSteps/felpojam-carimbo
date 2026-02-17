extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_botao_iniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/cena_1.tscn")


func _on_botao_config_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/config.tscn")


func _on_botao_sair_pressed() -> void:
	get_tree().quit()


func _on_botao_creditos_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/creditos.tscn")
