extends Node2D

@export var dialogo: Control
@export var control_pai: Control
@export var escolha: AudioStreamPlayer2D
@export var musica: AudioStreamPlayer2D


func _ready() -> void:
	var botoes = get_tree().get_nodes_in_group("botoes")
	for b in botoes:
		b.visible = false
	await dialogo.muda_display("res://Dialogos/jantar_final.json", "sistema_1")
	for b in botoes:
		b.visible = true
	

func trocar_musica(path):
	musica.stop()
	musica.stream = load(path)
	musica.play()

func _on_ermoes_pressed() -> void:
	var botoes = get_tree().get_nodes_in_group("botoes")
	var personagem = "ermoes"
	for b in botoes:
		b.visible = false
	await dialogo.muda_display("res://Dialogos/jantar_final.json", personagem)
	for b in botoes:
		b.visible = true


func _on_maquinista_pressed() -> void:
	var botoes = get_tree().get_nodes_in_group("botoes")
	var personagem = "maquinista"
	for b in botoes:
		b.visible = false
	await dialogo.muda_display("res://Dialogos/jantar_final.json", personagem)
	for b in botoes:
		b.visible = true


func _on_professor_pressed() -> void:
	var botoes = get_tree().get_nodes_in_group("botoes")
	var personagem = "professor"
	for b in botoes:
		b.visible = false
	await dialogo.muda_display("res://Dialogos/jantar_final.json", personagem)
	for b in botoes:
		b.visible = true


func _on_pombo_pressed() -> void:
	var botoes = get_tree().get_nodes_in_group("botoes")
	var personagem = "pombo"
	for b in botoes:
		b.visible = false
	await dialogo.muda_display("res://Dialogos/jantar_final.json", personagem)
	for b in botoes:
		b.visible = true


func _on_pirata_pressed() -> void:
	var botoes = get_tree().get_nodes_in_group("botoes")
	var personagem = "pirata"
	for b in botoes:
		b.visible = false
	await dialogo.muda_display("res://Dialogos/jantar_final.json", personagem)
	for b in botoes:
		b.visible = true

func _on_carimbador_pressed() -> void:
	var botoes = get_tree().get_nodes_in_group("botoes")
	var personagem = "carimbador"
	for b in botoes:
		b.visible = false
	await dialogo.muda_display("res://Dialogos/jantar_final.json", personagem)
	for b in botoes:
		b.visible = true

func _on_mordomo_pressed() -> void:
	var botoes = get_tree().get_nodes_in_group("botoes")
	var personagem = "mordomo"
	for b in botoes:
		b.visible = false
	escolha.play()
	await dialogo.muda_display("res://Dialogos/jantar_final.json", personagem)
	trocar_musica("res://Songs/musica cenario.mp3")
	await dialogo.muda_display("res://Dialogos/jantar_final.json", "vovo")
	for b in botoes:
		b.visible = true
	
	get_tree().change_scene_to_file("res://Cenas/fim.tscn")
	
	
