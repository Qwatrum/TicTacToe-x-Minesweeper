extends StaticBody2D
@onready var game := get_parent()

var letter
var done = false

func create(l, id):
	letter = l
	$"Letter".text = str(l)
	$"Letter".hide()


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and not done:
		$"Cover".hide()
		$"Letter".show()
		game.revealed(letter)

func reveal():
	$"Cover".hide()
	$"Letter".show()
	done = true
