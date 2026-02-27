extends Node2D

@export var dialogo: Control

func _ready() -> void:
	var personagem = "???"
	var personagem_2 = "mordomo"
	
	await dialogo.muda_display("res://Dialogos/inicio.json", personagem)
	await dialogo.muda_display("res://Dialogos/inicio.json", personagem_2)
	get_tree().change_scene_to_file("res://Cenas/comodos/sala_estar.tscn")
