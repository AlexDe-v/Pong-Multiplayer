extends Node2D

var peer = ENetMultiplayerPeer.new()

const PORT = 2999
var clicked = false

@onready var adress_entry = $"Multiplayer UI/Adress_entry"

func _on_fullscreen_button_up():
	pass


func _physics_process(delta):
	if not multiplayer.is_server() and clicked:
		get_tree().reload_current_scene()

func _on_host_button_up():
	print("Hosting")
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	$"Multiplayer UI".hide()

func _on_join_button_up():
	var selected_port = PORT
	var selected_adress = adress_entry.text
	
	if ":" in adress_entry.text:
		selected_adress = adress_entry.text.split(":")[0]
		selected_port = int(adress_entry.text.split(":")[1])
	print("Joining")
	peer.create_client(selected_adress, selected_port)
	$"Multiplayer UI".hide()
	clicked = true
