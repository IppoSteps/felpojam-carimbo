extends Control

signal click(event)

@export var nome: Label
@export var texto_caixa = Label
@export var caixa_dialogo = Panel

func extrai_dialogos(file_path):
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
	var dialogos = extrai_dialogos(json)
	var dialogo_personagem = dialogos[personagem]
	
	botao.visible = false
	caixa_dialogo.visible = true
	
	for d in dialogo_personagem:
		muda_texto(nome,dialogo_personagem[d]["personagem"])
		muda_texto(texto_caixa,dialogo_personagem[d]["texto"])
		await get_tree().create_timer(0.1).timeout
		await click
	botao.visible = true
	caixa_dialogo.visible = false
