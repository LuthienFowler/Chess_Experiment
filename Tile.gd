extends ColorRect

## Variables #######################################################################################

@export var dark = false
@onready var location = get_name()
var area
var let_is_legal

## Default functions ###############################################################################

func _ready():
	color_tile()
	$Area2D.name = location

func _process(_delta):
	pass

## Functions #######################################################################################

func color_tile():
	if dark:
		color = Color("380e02")
	else:
		color = Color("eda64a")

func determine_legal_move():
	let_is_legal = false
	
	for i in Global.next_legal_moves_let.size():
		if str(location.left(1)) == str(Global.next_legal_moves_let[i]):
			let_is_legal = true
			break
		else:
			i += 1
		
	for i in Global.next_legal_moves_num.size():
		if str(location.left(2)) == str(Global.next_legal_moves_num[i]) and let_is_legal:
			Global.is_legal = true
			break
		else:
			i += 1
		
	



func _on_button_pressed():
	if Global.is_piece_selected:
		determine_legal_move()
		SignalBus.move_piece.emit(location)
		print(str(Global.is_legal) + " " + location)
		# Send a signal to main to deal with the movement of the piece 
