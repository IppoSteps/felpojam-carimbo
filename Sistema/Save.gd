extends Node

var carimbos_path = "res://Sistema/carimbos_personagens.json"
var carimbos = {}

func _ready():
	carimbos = extrai_json(carimbos_path)

func extrai_json(file_path):
	var json = FileAccess.open(file_path, FileAccess.READ)
	var conteudo = json.get_as_text()
	var resultado = JSON.parse_string(conteudo)
	return resultado

func set_slot(personagem, slot_name):
	if carimbos.has(personagem):
		carimbos[personagem]["slot"] = slot_name

func get_carimbo(personagem):
	return carimbos.get(personagem, {})
