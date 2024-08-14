extends Node2D

enum piece {KING, QUEEN, ROOK, BISHOP, KNIGHT, PAWN}
enum color {BLACK, WHITE}

## Variables #######################################################################################

signal waiting_for_next_move

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

var this_piece_selected = false # If this specific piece is selected

var times_clicked = 0 # So we can determine if we need to select/unselect a piece

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
	
	# Making sure the this_piece_selected is false if the piece isn't selected
	if Global.pieces_selected_let == [] and Global.pieces_selected_num == []:
		this_piece_selected = false
	elif Global.pieces_selected_let[0] != location_let_array_pos or Global.pieces_selected_num[0] != location_num_array_pos:
		this_piece_selected = false

## Functions #######################################################################################

func run_knight():
	pass

func run_pawn():
	# Getting the legal moves for the pawn
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
	else:
		pass
	
	#for i in next_legal_moves_num.size(): # For debugging purposes
		#print(next_legal_moves_num[i])
	
	next_legal_moves_num.clear() # Fix this soon
	

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
		
	# Getting the next legal moves for the respective piece type : Change to a match statement at some point pls
	if piece_type == piece.PAWN:
		run_pawn()

	# Getting the coordinates in an array and selecting the piece in both the local and global vars
	if Global.pieces_selected_let == [] and Global.pieces_selected_num == []:
			
		# Putting the coordinates of the piece selected onto an array
		Global.pieces_selected_let.push_back(location_let_array_pos)
		Global.pieces_selected_num.push_back(location_num_array_pos)
		
		# Selecting the pieces in both the global and local vars
		Global.is_piece_selected = true
		this_piece_selected = true
			
	elif Global.pieces_selected_let[0] != location_let_array_pos or Global.pieces_selected_num[0] != location_num_array_pos:
			
		# Putting the coordinates of the piece selected onto an array
		Global.pieces_selected_let.push_back(location_let_array_pos)
		Global.pieces_selected_num.push_back(location_num_array_pos)
			
		# Deleting the last coordinate off of the array so only the current coordinates are there
		if Global.pieces_selected_let.size() > 1 and Global.pieces_selected_num.size() > 1:
			Global.pieces_selected_let.remove_at(0)
			Global.pieces_selected_num.remove_at(0)
		
		# Selecting the pieces in both the global and local vars
		Global.is_piece_selected = true
		this_piece_selected = true
			
	elif Global.pieces_selected_let[0] == location_let_array_pos and Global.pieces_selected_num[0] == location_num_array_pos:
		
		# Selecting the pieces in both the global and local vars
		Global.is_piece_selected = false 
		this_piece_selected = false
		
		# Clearing both arrays cause we don't need it anymore
		Global.pieces_selected_let.clear()
		Global.pieces_selected_num.clear()
