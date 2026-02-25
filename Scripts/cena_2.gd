extends Node2D

@export var dialogo: Control
@export var carimbo: Control

@export var mano: TextureButton


func _on_texture_button_pressed() -> void:
	var personagem = "mano"
	
	mano.visible = false
	await dialogo.muda_display("res://Dialogos/teste.json", personagem)
	await carimbo.define_carimbo(personagem)
	mano.visible = true
