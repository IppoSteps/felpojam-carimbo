extends Node2D

@export var dialogo: Control

func _ready():
	var personagem = "sistema"
	await dialogo.muda_display("res://Dialogos/quarto.json", personagem)
	get_tree().change_scene_to_file("res://Cenas/comodos/jantar_final.tscn")
