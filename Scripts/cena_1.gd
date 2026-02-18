extends Node2D

@export var dialogo: Control
@export var pinguim: TextureButton
@export var golfinho: TextureButton

func _on_pinguim_pressed() -> void:
	dialogo.muda_display(pinguim, "res://Dialogos/teste.json", "pinguim")



func _on_golfinho_pressed() -> void:
	dialogo.muda_display(golfinho, "res://Dialogos/teste.json", "golfinho")
