import sys

class Player:

	def __init__(self, name, redH, blueH, points):
		self.name = name
		self.redH = redH
		self.blueH = blueH
		self.points = points

def minimax(redM,blueM,isMax)
		return 1

def check_comArgu(index, argv):
	arg = "ERROR"
	if index == 1: # Red Marble
		if argv.isdigit(): # This is a red, check if it's a number
			arg = int(argv)
		else:
			print("[ERROR] The red marble isn't a number!")
			sys.exit("FORMAT: python red_blue_nim.py RED-NUMBER(int) BLUE-NUMBER(int) FIRST-PLAYER(str)")
	elif index == 2: # Blue Marble
		if argv.isdigit():
			arg = int(argv)
		else:
			print("[ERROR] The blue marble isn't a number!")
			sys.exit("FORMAT: python red_blue_nim.py RED-NUMBER(int) BLUE-NUMBER(int) FIRST-PLAYER(str)")
	elif index == 3: # First player
		if argv == "computer":
			arg = "computer"
		elif argv == "human":
			arg = "human"
		else:
			print("[ERROR] Wrong input for first player! ('computer' or 'human') ")
			sys.exit("FORMAT: python red_blue_nim.py RED-NUMBER(int) BLUE-NUMBER(int) FIRST-PLAYER(str)")
	else:
		print("[ERROR] Wrong input")
		sys.exit("FORMAT: python red_blue_nim.py RED-NUMBER(int) BLUE-NUMBER(int) FIRST-PLAYER(str)")

	return arg

if __name__ == '__main__':
#	print(f"[DEBUG] Arguments count: { len(sys.argv) }")
	argu_len = len(sys.argv)
	redM = 0
	blueM = 0
	fPlayer = 0
	for i, arg in enumerate( sys.argv ):
#		print(f"[DEBUG] Argument {i: > 2}: {arg}")
		if i == 0:
			continue
		if (argu_len > 4) or (argu_len < 3):
			print("[ERROR] Invalid argument length.")
			sys.exit("FORMAT: python red_blue_nim.py RED-NUMBER(int) BLUE-NUMBER(int) FIRST-PLAYER(str)")
		if i == 1:
			redM = check_comArgu(i,arg)
		elif i == 2:
			blueM = check_comArgu(i,arg)
		elif i == 3:
			fPlayer = check_comArgu(i,arg)

	print("Lets Play!!")
	computer = Player("computer",0,0,0)
	human = Player("human",0,0,0)

	"""
	print(f"[DEBUG] redM: {type(redM)}")
	print(f"[DEBUG] blueM: {type(blueM)}")
	print(f"[DEBUG] fPlayer: {type(fPlayer)}")
	"""
	bestScore = -20
	move = "none"
	while(fPlayer != "quit"):
		if fPlayer == "human":
			# Time to play the game!
			print("Your turn!")
			print("Pick a pile: r for red & b for blue")
			pile = input()
			if pile == 'r': #RED
				redM -= 1
				human.redH += 1
				"""
				print(f"[DEBUG] Player Red: {human.redH}")
				print(f"[DEBUG] Red Pile: {redM}")
				"""
			elif pile == 'b': #BLUE
				blueM -= 1
				human.blueH += 1
				"""
				print(f"[DEBUG] Player Blue: {human.blueH}")
				print(f"[DEBUG] blue Pile: {blueM}")
				"""
			else:
				print("[ERROR] Wrong input. Try again.")
				continue

			if (redM == 0) or (blueM == 0): #end
				fPlayer = "quit"
				human.points = (human.redH*2) + (human.blueH*3)
			else:
				print("Turn over! Computer turn...")
				fPlayer = "computer" #switch
		else: #computer	
			# Time to play the game!
			# TODO: Implement MinMax with Alpha Beta Prunning
			if(redM > 0) && (blueM > 0):
				scoreR = minimax(redM)
				scoreB = minimax(blueM)
				if (scoreR > scoreB):
					bestScore = scoreR;
					move = "red"
				elif (scoreB > scoreR):
					bestScore = scoreB;
					move = "blue"

			if (redM == 0) or (blueM == 0): #end
				fPlayer = "quit"
				computer.points = (computer.redH*2) + (computer.blueH*3)
			else:
				fPlayer = "human" #switch