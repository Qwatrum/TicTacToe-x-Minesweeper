extends Node2D


var fields = [[0,1,0,2,1,0,2,2,1]] # here come fields | 0 -> empty | 1 -> X | 2 -> O


func gen_field():
	var f = fields.pick_random()
	var f_2 = []
	for i in 9:
		if f[i] == 0:
			f_2.append("")
		elif f[i] == 1:
			f_2.append("X")
		elif f[i] == 2:
			f_2.append("O")
	
	return f_2
