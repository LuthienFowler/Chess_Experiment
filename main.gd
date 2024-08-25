extends Node2D


## Variables #######################################################################################

var tile_pos_x = []
var tile_pos_y = []

var row = 1
var actual_row = 7
var column = 7
const rows = 8
const row_path = "Board/Row"
var current_row
var current_tile
var piece_selected_location

## Default functions ###############################################################################

func _ready():
	
	# Getting the pos of every tile in an array
	for i in rows:
		current_row = row_path + str(row) # Rows are the NUMBERS 
		for j in rows:
			current_tile = get_node(current_row + "/" + str(Global.letter_pos[column]) + str(Global.num_pos[actual_row]))
			tile_pos_x.push_back(current_tile.position.x)
			tile_pos_y.push_back(current_tile.position.y)
			column -= 1
		row += 1
		actual_row -= 1
		column = 7
	
	# Connecting signals
	SignalBus.move_piece.connect(_on_move_piece)

func _process(_delta):
	move_piece()
	# pass

## Functions #######################################################################################

func move_piece():
	
	actual_row = 7
	column = 7
	row = 1
	
	# Getting the specific piece selected
	if Global.is_piece_selected:
		piece_selected_location = str(Global.letter_pos[Global.pieces_selected_let[0]]) + str(Global.num_pos[Global.pieces_selected_num[0]])
		get_piece_path()
		
	elif !Global.is_piece_selected:
		current_tile = null


func get_piece_path(): # Getting the path of the piece selected
		for i in rows:
			current_row = row_path + str(row) # Rows are the NUMBERS 
			for j in rows:
				current_tile = get_node(current_row + "/" + str(Global.letter_pos[column]) + str(Global.num_pos[actual_row]))
				
				if current_tile.name == piece_selected_location:
					break
				column -= 1
			if current_tile.name == piece_selected_location:
				break
			
			row += 1
			actual_row -= 1
			column = 7
		

func _on_move_piece(_next_location):
	if Global.is_legal:
		print("You would go there in a complete game")
	else:
		print("You cannot go there")
# Get all the tiles in the board and their positions
# Put them all into an array (and maybe offset them a bit if needed)
# If we select a tile while a piece is selected, move that tile, and unselect the piece 
