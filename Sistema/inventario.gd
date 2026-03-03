extends Node

var itens = {}
var conversas_concluidas = {}
var requisitos = {
	"maquinista" : "",
	"pirata" : "moeda_de_ouro",
	"ermoes" : "queijo_de_plastico",
	"pombo" : "cartao_corporativo",
	"professor" : "cafe",
	"carimbador" : "carimbo"
}
var recompensas = {
	"maquinista" : "moeda_de_ouro",
	"pirata" : "queijo_de_plastico",
	"ermoes" : "cartao_corporativo",
	"pombo" : "cafe",
	"professor" : "carimbo",
	"carimbador" : "chave_do_quarto"
}

func tem_item(nome_item, quantidade = 1):
	if not itens.has(nome_item):
		return false
	return int(itens[nome_item]) >= quantidade

func adicionar_item(nome_item, quantidade = 1):
	if nome_item == "":
		return
	if not itens.has(nome_item):
		itens[nome_item] = 0
	itens[nome_item] = int(itens[nome_item]) + quantidade

func remover_item(nome_item, quantidade = 1):
	if not tem_item(nome_item, quantidade):
		return false
	itens[nome_item] = int(itens[nome_item]) - quantidade
	if int(itens[nome_item]) <= 0:
		itens.erase(nome_item)
	return true

func conversa_ja_concluida(personagem):
	return conversas_concluidas.has(personagem) and bool(conversas_concluidas[personagem]) == true

func item_requisito(personagem):
	if requisitos.has(personagem):
		return String(requisitos[personagem])
	return ""

func item_recompensa(personagem):
	if recompensas.has(personagem):
		return String(recompensas[personagem])
	return ""

func pode_conversar(personagem):
	if conversa_ja_concluida(personagem):
		return true
	var req = item_requisito(personagem)
	if req == "":
		return true
	return tem_item(req, 1)

func concluir_conversa(personagem):
	if conversa_ja_concluida(personagem):
		return
	
	var req = item_requisito(personagem)
	if req != "":
		remover_item(req, 1)
	
	var rec = item_recompensa(personagem)
	if rec != "":
		adicionar_item(rec, 1)
	
	conversas_concluidas[personagem] = true

func listar_itens():
	var saida := []
	for k in itens.keys():
		saida.append({"item": k, "quantidade": int(itens[k])})
	return saida
