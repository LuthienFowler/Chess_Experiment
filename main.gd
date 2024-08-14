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

## Default functions ###############################################################################

func _ready():
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
	
	print("position of b8: " + str(tile_pos_x[1]) + ", " + str(tile_pos_y[1]))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# Get all the tiles in the board and their positions
# Put them all into an array (and maybe offset them a bit if needed)
# If we select a tile while a piece is selected, move that tile, and unselect the piece 
