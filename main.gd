extends Node2D

## Variables #######################################################################################

var tile_pos_x = []
var tile_pos_y = []

## Default functions ###############################################################################

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# Get all the tiles in the board and their positions
# Put them all into an array (and maybe offset them a bit if needed)
# If we select a tile while a piece is selected, move that tile, and unselect the piece 
