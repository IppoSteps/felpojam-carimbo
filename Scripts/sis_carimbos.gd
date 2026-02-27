extends Control

signal click(event)

@export var caderno: TextureRect

var carimbos_path := "res://Sistema/carimbos_personagens.json"
var carimbos_json := {}

func _ready():
	carimbos_json = extrai_json(carimbos_path)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		click.emit(event)

func extrai_json(file_path):
	var json = FileAccess.open(file_path, FileAccess.READ)
	var conteudo = json.get_as_text()
	var resultado = JSON.parse_string(conteudo)
	return resultado

func texto_do_slot(slot):
	var prefix = slot.name.trim_prefix("Carimbo")
	return get_node("Caderno/Texto" + prefix)

func define_carimbo(personagem):
	var carimbo = Save.get_carimbo(personagem)
	var carimbo_path = carimbo["path"]
	var slots = get_tree().get_nodes_in_group("carimbo_slots")
	
	caderno.visible = true

	if carimbo["slot"] == "nenhum":
		for slot in slots:
			if slot.texture == null:
				slot.texture = load(carimbo_path)
				await get_tree().create_timer(0.5).timeout
				slot.visible = true

				Save.set_slot(personagem, slot.name)

				var texto = carimbo.get("texto", "")
				var texto_slot = texto_do_slot(slot)
				if texto != "":
					texto_slot.text = texto
					texto_slot.visible = true
				break
	else:
		pass
	await get_tree().create_timer(1).timeout
	await click
	caderno.visible = false


func aplica_estado():
	for personagem in Save.carimbos.keys():
		var carimbo = Save.carimbos[personagem]
		var slot_name = carimbo.get("slot", "nenhum")
		if slot_name != "nenhum":
			var slot = get_node("Caderno/" + slot_name)
			slot.texture = load(carimbo["path"])
			slot.visible = true

			var texto = carimbo.get("texto", "")
			var texto_slot = texto_do_slot(slot)
			if texto != "":
				texto_slot.text = texto
				texto_slot.visible = true
