extends Control

signal click(event)

@export var nome: Label
@export var texto_caixa = Label
@export var caixa_dialogo = Panel
@export var imagem_portrait = TextureRect

var portrait_json = "res://Sistema/dialogo_portraits.json"

func extrai_json(file_path):
	var json = FileAccess.open(file_path, FileAccess.READ)
	var conteudo = json.get_as_text()
	var resultado = JSON.parse_string(conteudo)
	return resultado

func muda_texto(campo, texto):
	campo.text = texto

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		click.emit(event)


func muda_display(botao, json, personagem):
	var dialogos = extrai_json(json)
	var dialogo_personagem = dialogos[personagem]
	var portrait = extrai_json(portrait_json)
	
	imagem_portrait.texture = load(portrait[personagem])
	botao.visible = false
	caixa_dialogo.visible = true
	
	for d in dialogo_personagem:
		muda_texto(nome,dialogo_personagem[d]["personagem"])
		muda_texto(texto_caixa,dialogo_personagem[d]["texto"])
		await get_tree().create_timer(0.1).timeout
		await click
	botao.visible = true
	caixa_dialogo.visible = false
	
