extends Node2D

enum piece {KING, QUEEN, ROOK, BISHOP, KNIGHT, PAWN}
enum color {BLACK, WHITE}

## Variables #######################################################################################



@export var piece_type = piece.PAWN
@export var piece_color = color.BLACK

@onready var color_rect = $ColorRect
@onready var label = $Label

var moves_taken = 0

var next_legal_moves_let = []
var next_legal_moves_num = []

var next_legal_move_num
var next_legal_move_let

var location
var location_let_array_pos
var location_num_array_pos

## Default functions ###############################################################################

func _ready():
	if piece_color == color.BLACK:
		color_rect.color = Color("000214")
		label.set("theme_override_colors/font_color", Color("b6bed1"))
	else:
		color_rect.color = Color("b6bed1")
		label.set("theme_override_colors/font_color", Color("000214"))
	
	match piece_type:
		piece.KING:
			label.text = "King"
		piece.QUEEN:
			label.text = "Queen"
		piece.ROOK:
			label.text = "Rook"
		piece.BISHOP:
			label.text = "Bishop"
		piece.KNIGHT:
			label.text = "Knight"
		piece.PAWN:
			label.text = "Pawn"

func _process(_delta):
	pass


## Functions #######################################################################################

func run_pawn():
	if (moves_taken == 0):
		if piece_color == color.BLACK:
			next_legal_move_num = Global.num_pos[location_num_array_pos - 1]
			next_legal_moves_num.push_back(next_legal_move_num)
			
			next_legal_move_num = Global.num_pos[location_num_array_pos - 2]
			next_legal_moves_num.push_back(next_legal_move_num)
			
		elif piece_color == color.WHITE:
			next_legal_move_num = Global.num_pos[location_num_array_pos + 1]
			next_legal_moves_num.push_back(next_legal_move_num)
			
			next_legal_move_num = Global.num_pos[location_num_array_pos + 2]
			next_legal_moves_num.push_back(next_legal_move_num)
	
	for i in next_legal_moves_num.size(): # For debugging purposes
		print(next_legal_moves_num[i])
	

## Signal functions ################################################################################

func _on_area_2d_area_entered(area):
	location = area.get_name()

	match location.left(1):
		'a':
			location_let_array_pos = 0
		'b':
			location_let_array_pos = 1
		'c':
			location_let_array_pos = 2
		'd':
			location_let_array_pos = 3
		'e':
			location_let_array_pos = 4
		'f':
			location_let_array_pos = 5
		'g':
			location_let_array_pos = 6
		'h':
			location_let_array_pos = 7
	
	match int(location.left(2)):
		1:
			location_num_array_pos = 0
		2:
			location_num_array_pos = 1
		3:
			location_num_array_pos = 2
		4:
			location_num_array_pos = 3
		5:
			location_num_array_pos = 4
		6:
			location_num_array_pos = 5
		7:
			location_num_array_pos = 6
		8:
			location_num_array_pos = 7
		

func _on_button_pressed():
	if piece_type == piece.PAWN:
		run_pawn()

# next course of action -> making it so we can have multiple legal moves. Unfortunately I'll be using a lot of 
# arrays for this.. 
