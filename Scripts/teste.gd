extends Node2D

@export var dialogo: Control
@export var carimbo: Control
@export var mapa: Control

@export var mordomo: TextureButton

var mapa_aberto = false

func _unhandled_input(event: InputEvent) -> void:
	var botoes = get_tree().get_nodes_in_group("botoes")
	
	if Input.is_action_just_pressed("abre_mapa") and not mapa_aberto:
		mapa_aberto = true
		for b in botoes:
			b.visible = false
		mapa.visible = true
	if Input.is_action_just_pressed("esc") and mapa_aberto:
		mapa_aberto = false
		for b in botoes:
			b.visible = true
		mapa.visible = false

func _on_mordomo_pressed() -> void:
	var botoes = get_tree().get_nodes_in_group("botoes")
	var personagem = "mordomo"
	
	for b in botoes:
		b.disabled = true
		b.visible = false
	await dialogo.muda_display("res://Dialogos/teste.json", personagem)
	await carimbo.define_carimbo(personagem)
	for b in botoes:
		b.visible = true
		b.disabled = false

func _on_vovo_pressed() -> void:
	var botoes = get_tree().get_nodes_in_group("botoes")
	var personagem = "vovo"
	
	for b in botoes:
		b.disabled = true
		b.visible = false
	await dialogo.muda_display("res://Dialogos/teste.json", personagem)
	await carimbo.define_carimbo(personagem)
	for b in botoes:
		b.visible = true
		b.disabled = false
