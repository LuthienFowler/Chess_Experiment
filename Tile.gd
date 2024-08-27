extends ColorRect

## Variables #######################################################################################

@export var dark = false
@onready var location = str(get_name())
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
	
	print(str(Global.next_legal_moves_let))
	
	#for i in Global.next_legal_moves_let.size():
		#if str(location.left(1)) == str(Global.next_legal_moves_let[i]):
			#let_is_legal = true
			#break
		#else:
			#i += 1
		#return let_is_legal

func tile(): # Identifying function
	pass
## Signal functions ################################################################################

func _on_button_pressed():
	if Global.is_piece_selected:
		determine_legal_move()
		SignalBus.move_piece.emit(location)
		print(str(Global.is_legal) + " " + location)
		print(let_is_legal)
		# Send a signal to main to deal with the movement of the piece 
