extends Control

signal click(event)

@export var nome: Label
@export var texto_caixa = Label
@export var caixa_dialogo = Panel
@export var imagem_portrait = TextureRect
@export var fundo = TextureRect
@export var player: AudioStreamPlayer2D

var portrait_json = "res://Sistema/dialogo_portraits.json"

func _ready():
	visible = false
	mouse_filter = Control.MOUSE_FILTER_IGNORE

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

func tocar_som(path):
	player.stream = load(path)
	player.play()

func muda_display(json, personagem):
	var dialogos = extrai_json(json)
	var dialogo_personagem = dialogos[personagem]
	
	visible = true
	mouse_filter = Control.MOUSE_FILTER_STOP
	imagem_portrait.visible = true
	caixa_dialogo.visible = true
	
	for d in dialogo_personagem:
		if dialogo_personagem[d]["som"] != "nenhum":
			tocar_som(dialogo_personagem[d]["som"])
		muda_texto(nome,dialogo_personagem[d]["personagem"])
		muda_texto(texto_caixa,dialogo_personagem[d]["texto"])
		fundo.texture = load(dialogo_personagem[d]["fundo"])
		imagem_portrait.texture = load(dialogo_personagem[d]["sprite"])
		await get_tree().create_timer(0.3).timeout
		await click
	
	caixa_dialogo.visible = false
	imagem_portrait.visible = false
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	visible = false
