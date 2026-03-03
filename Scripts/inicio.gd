extends Node2D

@export var dialogo: Control
@export var carimbo: Control
@export var fundo: TextureRect

signal click(event)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		click.emit(event)

func _ready() -> void:
	var personagem = "???"
	var personagem_2 = "mordomo"
	
	await dialogo.muda_display("res://Dialogos/inicio.json", personagem)
	fundo.visible = true
	await get_tree().create_timer(0.5).timeout
	await click
	await dialogo.muda_display("res://Dialogos/inicio.json", personagem_2)
	await carimbo.define_carimbo(personagem_2)
	get_tree().change_scene_to_file("res://Cenas/comodos/sala_estar.tscn")
