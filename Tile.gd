extends ColorRect

## Variables #######################################################################################

@export var dark = false

## Default functions ###############################################################################

func _ready():
	color_tile()

func _process(delta):
	pass

## Functions #######################################################################################

func color_tile():
	if dark:
		color = Color("380e02")
		print("The tile has been colored a dark color")
	else:
		color = Color("eda64a")
		print("The tile has been colored a light color")
