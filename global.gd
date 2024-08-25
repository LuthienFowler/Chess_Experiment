extends Node

# This is an autoloaded script

enum piece {KING, QUEEN, ROOK, BISHOP, KNIGHT, PAWN}
enum color {BLACK, WHITE}

## Variables #######################################################################################

var is_legal = false # If the move is legal or not

var letter_pos = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'null']
var num_pos = [1, 2, 3, 4, 5, 6, 7, 8, 0]

var is_piece_selected = false # If any pieces at all are selected
var current_piece_selected_let # Where in the array the location is
var current_piece_selected_num # This too

var pieces_selected_let = [] # These are array coordinates too just so you don't get confused
var pieces_selected_num = []

var next_legal_moves_let = [] # These are NOT array coordinates
var next_legal_moves_num = []

## Default functions ###############################################################################

func _ready():
	pass

func _process(_delta):
	pass

## Functions #######################################################################################
func select_piece():
	if is_piece_selected:
		pass

# Things achieved so far:
# - Made the board and chess pieces
# - Made it so selection happens

# Next actions: 
# - Make it so we can actually move pieces around 
# - Fix the legal move prediction
# - Getting the legal moves of a more complicated piece (Rn I'm gonna focus on the knight)
