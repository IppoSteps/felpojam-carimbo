extends Control

@export var dialogo: Control

@onready var caderno: TextureRect = $Caderno

var caderno_base: Texture2D

var hover_texturas := {}

func _ready() -> void:
	caderno_base = caderno.texture
	hover_texturas = {
		"SalaJantar": preload("res://Imagens/caderno/Caderno_selecionado_sala de jantar.png"),
		"SalaEstar": preload("res://Imagens/caderno/Caderno_selecionado_sala de estar.png"),
		"Escritorio": preload("res://Imagens/caderno/Caderno_selecionado_escritorio.png"),
		"Quarto": preload("res://Imagens/caderno/Caderno_selecionado_quarto.png"),
	}
	
	for b in get_tree().get_nodes_in_group("botoes_mapa"):
		if b is BaseButton:
			b.mouse_entered.connect(_on_botao_hover.bind(b))
			b.mouse_exited.connect(_on_botao_unhover)

func _on_botao_hover(botao):
	var tex: Texture2D = hover_texturas.get(botao.name, null)
	if tex:
		caderno.texture = tex

func _on_botao_unhover():
	caderno.texture = caderno_base

func _on_sala_jantar_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/comodos/sala_jantar.tscn")

func _on_sala_estar_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/comodos/sala_estar.tscn")

func _on_escritorio_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/comodos/escritorio.tscn")

func _on_quarto_pressed() -> void:
	if not Inventario.tem_item("chave_do_quarto", 1):
		if dialogo != null:
			await dialogo.muda_display("res://Dialogos/ocupados.json", "quarto")
		return
	get_tree().change_scene_to_file("res://Cenas/comodos/quarto.tscn")
