extends Control

var el = preload("res://scenes/element.tscn")
var gen = preload("res://scenes/tictactoe_fieldgen.tscn")

var allowed_letter = ""
var field = []
var field_symbols = [1,2,3,4,5,6,7,8,9,0]
var hiddens = []


func _ready():
	$"play".hide()
	generate_field()
	create_field()

func create_field():
	var x = 425
	var y = 176
	var index = 0
	for i in range(3):
		for j in range(3):
			var inste = el.instantiate()
			inste.create(field_symbols[index], index)
			add_child(inste)
			inste.position = Vector2(x,y)
			field.append(inste)
			index+=1
			x+=155
		y+= 155
		x=425
	
	
func generate_field():
	var inste = gen.instantiate()
	add_child(inste)
	field_symbols = inste.gen_field()
	hiddens = field_symbols
	


func revealed(l):
	
	if allowed_letter == "":
		if l != "":
			allowed_letter = l
			$"Stats".text = "Allowed : "+l
			hiddens.erase(l)
	else:
		if allowed_letter == l or l == "":
			
			hiddens.erase(l)

			if hiddens.count(allowed_letter) == 0 and hiddens.count("") == 0:
				
				$"Title".hide()
				$"msg".text = "You won"
				$"msg".show()
				for e in field:
					e.reveal()
				$"play".show()
			
		else:
			
			$"Title".hide()
			$"msg".text = "Game Over"
			$"msg".show()
			for e in field:
				e.reveal()
			$"play".show()
			


func _on_play_button_down():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
