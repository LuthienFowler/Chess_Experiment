extends Node2D

var black_pieces_dict = {
	"Bqueen" = $Pieces/Black/Queen, 
	"Bking" = $Pieces/Black/King,
	"Bbishop1" = $Pieces/Black/Bishop1, 
	"Bbishop2" = $Pieces/Black/Bishop2,
	"Bknight1" = $Pieces/Black/Knight1,
	"Bknight2" = $Pieces/Black/Knight2,
	"Brook1" = $Pieces/Black/Rook1,
	"Brook2" = $Pieces/Black/Rook2,
	"Bpawn1" = $Pieces/Black/Pawn1,
	"Bpawn2" = $Pieces/Black/Pawn2,
	"Bpawn3" = $Pieces/Black/Pawn3,
	"Bpawn4" = $Pieces/Black/Pawn4,
	"Bpawn5" = $Pieces/Black/Pawn5,
	"Bpawn6" = $Pieces/Black/Pawn6,
	"Bpawn7" = $Pieces/Black/Pawn7,
	"Bpawn8" = $Pieces/Black/Pawn8
}

var white_pieces_dict = {
	"Wqueen" = $Pieces/White/Queen, 
	"Wking" = $Pieces/White/King,
	"Wbishop1" = $Pieces/White/Bishop1, 
	"Wbishop2" = $Pieces/White/Bishop2,
	"Wknight1" = $Pieces/White/Knight1,
	"Wknight2" = $Pieces/White/Knight2,
	"Wrook1" = $Pieces/White/Rook1,
	"Wrook2" = $Pieces/White/Rook2,
	"Wpawn1" = $Pieces/White/Pawn1,
	"Wpawn2" = $Pieces/White/Pawn2,
	"Wpawn3" = $Pieces/White/Pawn3,
	"Wpawn4" = $Pieces/White/Pawn4,
	"Wpawn5" = $Pieces/White/Pawn5,
	"Wpawn6" = $Pieces/White/Pawn6,
	"Wpawn7" = $Pieces/White/Pawn7,
	"Wpawn8" = $Pieces/White/Pawn8
}
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
var piece_selected

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

func _process(_delta):
	move_piece()

## Functions #######################################################################################

func move_piece():
	
	actual_row = 7
	column = 7
	row = 1
	
	# Getting the specific piece selected
	if Global.is_piece_selected:
		piece_selected = str(Global.letter_pos[Global.pieces_selected_let[0]]) + str(Global.num_pos[Global.pieces_selected_num[0]])
		
		# Getting the path of the piece selected
		for i in rows:
			current_row = row_path + str(row) # Rows are the NUMBERS 
			for j in rows:
				current_tile = get_node(current_row + "/" + str(Global.letter_pos[column]) + str(Global.num_pos[actual_row]))
				
				if current_tile.name == piece_selected:
					break
					
				column -= 1
			if current_tile.name == piece_selected:
				break
			
			row += 1
			actual_row -= 1
			column = 7
		
		# Debug
		print("Current piece selected: " + current_tile.name)
		
	elif !Global.is_piece_selected:
		
		current_tile = null
		
		# Debug
		print("Piece not selected")
		print(current_tile)
# Get all the tiles in the board and their positions
# Put them all into an array (and maybe offset them a bit if needed)
# If we select a tile while a piece is selected, move that tile, and unselect the piece 
