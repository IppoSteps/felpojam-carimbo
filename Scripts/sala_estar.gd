extends Node2D

@export var mapa: Control

func _unhandled_input(event: InputEvent) -> void:
	#var botoes = get_tree().get_nodes_in_group("botoes")
	
	if Input.is_action_just_pressed("abre_mapa"):
		#for b in botoes:
			#b.visible = false
		mapa.visible = true
	if Input.is_action_just_pressed("esc"):
		#for b in botoes:
			#b.visible = true
		mapa.visible = false
