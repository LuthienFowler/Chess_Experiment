extends ColorRect

## Variables #######################################################################################

@export var dark = false
@export var location = " "

## Default functions ###############################################################################

func _ready():
	color_tile()

func _process(_delta):
	pass

## Functions #######################################################################################

func color_tile():
	if dark:
		color = Color("380e02")
	else:
		color = Color("eda64a")


func _on_button_pressed():
	print(location + " has been pressed!")
