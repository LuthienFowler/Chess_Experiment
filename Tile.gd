extends ColorRect

## Variables #######################################################################################

@export var dark = false
@onready var location = get_name()
var area

## Default functions ###############################################################################

func _ready():
	color_tile()
	$Area2D.name = location

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
