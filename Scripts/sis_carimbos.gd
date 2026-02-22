extends Control

signal click(event)

@export var caderno: TextureRect
@export var carimbo_1: TextureRect
@export var carimbo_2: TextureRect

var carimbos_json = "res://Sistema/carimbos_personagens.json"

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		click.emit(event)

func extrai_json(file_path):
	var json = FileAccess.open(file_path, FileAccess.READ)
	var conteudo = json.get_as_text()
	var resultado = JSON.parse_string(conteudo)
	return resultado

func define_carimbo(personagem):
	var json = extrai_json(carimbos_json)
	var carimbo = json[personagem]
	var carimbo_path = carimbo["path"]
	var slots = get_tree().get_nodes_in_group("carimbo_slots")
	
	caderno.visible = true
	for slot in slots:
		if slot.texture == null:
			slot.texture = load(carimbo_path)
			await get_tree().create_timer(0.5).timeout
			slot.visible = true
	await get_tree().create_timer(1).timeout
	await click
	caderno.visible = false
