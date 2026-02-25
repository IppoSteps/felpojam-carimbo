extends Node2D

@export var dialogo: Control
@export var carimbo: Control

@export var mordomo: TextureButton


func _on_mordomo_pressed() -> void:
	var personagem = "mordomo"
	var botoes = get_tree().get_nodes_in_group("botoes")
	
	for b in botoes:
		b.disabled = true
		b.visible = false
	await dialogo.muda_display("res://Dialogos/teste.json", personagem)
	await carimbo.define_carimbo(personagem)
	for b in botoes:
		b.visible = true
		b.disabled = false



func _on_vovo_pressed() -> void:
	var personagem = "vovo"
	var botoes = get_tree().get_nodes_in_group("botoes")
	
	for b in botoes:
		b.disabled = true
		b.visible = false
	await dialogo.muda_display("res://Dialogos/teste.json", personagem)
	await carimbo.define_carimbo(personagem)
	for b in botoes:
		b.visible = true
		b.disabled = false
