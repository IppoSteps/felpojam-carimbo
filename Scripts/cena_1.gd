extends Node2D

signal click(event)

@onready var caixa_texto = $CaixaDialogo
@onready var nome = $CaixaDialogo/VBoxContainer/NomePersonagem
@onready var texto_caixa = $CaixaDialogo/VBoxContainer/Texto
@onready var pinguim = $Pinguim


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


func muda_display(botao, caixa, json):
	var dialogos = extrai_dialogos(json)
	
	botao.visible = false
	caixa.visible = true
	
	for d in dialogos:
		muda_texto(nome,dialogos[d]["personagem"])
		muda_texto(texto_caixa,dialogos[d]["texto"])
		await get_tree().create_timer(0.1).timeout
		await click
	pinguim.visible = true
	caixa.visible = false


func _on_pinguim_pressed() -> void:
	muda_display(pinguim, caixa_texto, "res://Dialogos/teste.json")
