extends Node2D

@export var dialogo: Control
@export var carimbo: Control

@export var pinguim: TextureButton
@export var golfinho: TextureButton

func _on_pinguim_pressed() -> void:
	var personagem = "pinguim"
	var botoes = get_tree().get_nodes_in_group("cena_1 botoes")
	
	pinguim.visible = false
	for b in botoes:
		b.disabled = true
	await dialogo.muda_display("res://Dialogos/teste.json", personagem)
	golfinho.visible = false
	await carimbo.define_carimbo(personagem)
	for b in botoes:
		b.disabled = false
	pinguim.visible = true
	golfinho.visible = true

func _on_golfinho_pressed() -> void:
	var personagem = "golfinho"
	var botoes = get_tree().get_nodes_in_group("cena_1 botoes")
	
	golfinho.visible = false
	for b in botoes:
		b.disabled = true
	await dialogo.muda_display("res://Dialogos/teste.json", personagem)
	await carimbo.define_carimbo(personagem)
	for b in botoes:
		b.disabled = false
	golfinho.visible = true
