extends Node

## Variables #######################################################################################

var is_legal = false # If the move is legal or not

var letter_pos = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'null']
var num_pos = [1, 2, 3, 4, 5, 6, 7, 8, 0]

var is_piece_selected = false
var current_piece_selected_let # Where in the array the location is
var current_piece_selected_num # This too

var pieces_selected_let = []
var pieces_selected_num = []

## Default functions ###############################################################################

func _ready():
	pass

func _process(_delta):
	pass

## Functions #######################################################################################
func select_piece():
	if is_piece_selected:
		pass

# Current goals:
# - Making it so a piece unselects when the player selects another piece.
# - Getting the legal moves of a more complicated piece (Rn I'm gonna focus on the knight)
# - Making the pieces move to a spot on the board
