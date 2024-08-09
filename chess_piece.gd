extends Node2D

enum piece {KING, QUEEN, ROOK, BISHOP, KNIGHT, PAWN}
enum color {BLACK, WHITE}

## Variables #######################################################################################

@export var piece_type = piece.PAWN
@export var piece_color = color.BLACK

@onready var color_rect = $ColorRect
@onready var label = $Label

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
