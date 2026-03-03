extends Node2D

@export var dialogo: Control
@export var carimbo: Control
@export var mapa: Control
@export var musica: AudioStreamPlayer2D

@export var professor: TextureButton

func _ready():
	carimbo.aplica_estado()

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

func trocar_musica(path):
	musica.stop()
	musica.stream = load(path)
	musica.play()

func _on_professor_pressed() -> void:
	var botoes = get_tree().get_nodes_in_group("botoes")
	var personagem = "professor"
	
	for b in botoes:
		b.disabled = true
		b.visible = false
	
	if not Inventario.pode_conversar(personagem):
		await dialogo.muda_display("res://Dialogos/ocupados.json", personagem)
		for b in botoes:
			b.visible = true
			b.disabled = false
		return
	
	trocar_musica("res://Songs/professor.mp3")
	await dialogo.muda_display("res://Dialogos/escritorio.json", personagem)
	await carimbo.define_carimbo(personagem)
	Inventario.concluir_conversa(personagem)
	
	for b in botoes:
		b.visible = true
		b.disabled = false
	trocar_musica("res://Songs/musica cenario.mp3")

func _on_carimbador_pressed() -> void:
	var botoes = get_tree().get_nodes_in_group("botoes")
	var personagem = "carimbador"
	
	for b in botoes:
		b.disabled = true
		b.visible = false
	
	if not Inventario.pode_conversar(personagem):
		await dialogo.muda_display("res://Dialogos/ocupados.json", personagem)
		for b in botoes:
			b.visible = true
			b.disabled = false
		return
		
	trocar_musica("res://Songs/serial stamper.mp3")
	await dialogo.muda_display("res://Dialogos/escritorio.json", personagem)
	await carimbo.define_carimbo(personagem)
	Inventario.concluir_conversa(personagem)
	
	for b in botoes:
		b.visible = true
		b.disabled = false
	trocar_musica("res://Songs/musica cenario.mp3")
