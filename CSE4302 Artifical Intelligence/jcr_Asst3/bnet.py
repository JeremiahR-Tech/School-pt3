# Name: Jeremiah Richard
# ID: 1001475742
# Language Python 3.10.5
# This code is structured with error checking & file formating at the beginning.
# Then the code goes into Task 1 making CPDs from the avaliable data.
# Lastly task 2 is done using imports from pgmpy
# To install pgmpy do "pip install pgmpy"
# Compiled this way "python bnet.py training_data Bt Gt Ct Ft"(variables are up to user)

import sys
from pgmpy.factors.discrete import TabularCPD
from pgmpy.models import BayesianNetwork
from pgmpy.inference import VariableElimination

if __name__ == '__main__':

	argu_len = len(sys.argv)

	# Enter ERROR-CHECK (ARGUMENT) or PROGRAM
	if (argu_len < 6) or (argu_len > 6):
		print("[ERROR] FORMAT: python bnet.py <training_data> <Bt/Bf> <Gt/Gf> <Ct/Cf> <Ft/Ff>")
	else:
		
		# Intializing variables
		training_file = 0 # Will be used to open file destination of training (string)
		training_data = 0 # All data from training file after opening
		jpds = [] # This is all the training data broken down into sets per line
		max_data = 0 # Maximum ammount of sets to find inital probabilities
		B_pro = 0
		G_pro = 0
		C_pro = 0
		F_pro = 0
		B_count = 0
		G_count = 0
		C_count = 0
		F_count = 0
		GgiB_count = 0
		FgiG_count = 0
		FgiGC_count = 0
		CG_count = 0
		CF_count = 0
		t_max = 0
		f_max = 0
		B_bool = 0
		G_bool = 0
		C_bool = 0
		F_bool = 0
		
		for i, arg in enumerate( sys.argv ):
			# print(f"[DEBUG] Argument {i: > 2}: {arg}")

			# Setting variables using user arguments
			if i == 0:
				pass
			elif i == 1:
				training_file = arg
			elif i == 2:
				B_bool = arg
			elif i == 3:
				G_bool = arg
			elif i == 4:
				C_bool = arg
			elif i == 5:
				F_bool = arg

		
		# Opening up new lines & collecting data
		with open( training_file ) as f:
			training_data = f.read()

		# Storing training data
		lines = training_data.splitlines()

		for line in lines:
		    if line == 'EOF':
		        break
		    booleans=line.split()
		    jpd_set = []
		    for boolean in booleans:
		    	jpd_set.append( int(boolean) )
		    jpds.append( jpd_set )

		# Debug printing file
		# jpd_set[0] = B
		# jpd_set[1] = G
		# jpd_set[2] = C
		# jpd_set[3] = F
		# print("[DEBUG] ----------- File sets ----------")
		for index, jpd_set in enumerate(jpds):
		#	print(f"{index}: {jpd_set}")
			B = jpd_set[0]
			G = jpd_set[1]
			C = jpd_set[2]
			F = jpd_set[3]
			max_data += 1
			if B: #B
				B_count += 1
				if G:
					GgiB_count += 1
			if G: #G
				G_count += 1
				if F:
					FgiG_count += 1
				#	print(f"[DEBUG] Added at FgiG @ {index}")
					if C:
						FgiGC_count += 1
				#		print(f"[DEBUG] Added at FgiGC @ {index}")
			if C: #C
				C_count += 1
				if G:
					CG_count += 1
				if F:
					CF_count += 1
			if F: #F
				F_count += 1

		"""
		print(f"[DEBUG] B_count = {B_count}")
		print(f"[DEBUG] G_count = {G_count}")
		print(f"[DEBUG] C_count = {C_count}")
		print(f"[DEBUG] F_count = {F_count}")
		print(f"[DEBUG] GgiB_count = {GgiB_count}")
		print(f"[DEBUG] FgiGC_count = {FgiGC_count}")
		print(f"[DEBUG] FgiG_count = {FgiG_count}")
		print(f"[DEBUG] CG_count = {CG_count}")
		print(f"[DEBUG] CF_count = {CF_count}")
		print(f"[DEBUG] max_data = {max_data}")
		"""


		# Time to find the probability for all
		B_pro = B_count/max_data
		G_pro = G_count/max_data
		C_pro = C_count/max_data
		F_pro = F_count/max_data 
		t_max = B_count + G_count + C_count + F_count
		f_max = (max_data *4) - t_max 
		var_total = t_max + f_max # Max amount of true/false opportunities
		t_pro = t_max/var_total # Probability of true for any variable
		f_pro = f_max/var_total # Probability of false for any variable

		# Probability Conditionals
		# Probability of G given B OR P(G|B)
		# P(G|B) = P(G n B)/P(B)
		# P(G|B)
		GgiB_pro = GgiB_count/B_count
		FgiGC_pro = FgiGC_count/(G_count+C_count)
		FgiG_pro = (FgiG_count+CG_count)/(G_count)

		"""
		print(f"[DEBUG] GgiB_pro = {GgiB_pro:0,.2f}")
		print(f"[DEBUG] FgiGC_pro = {FgiGC_pro:0,.2f}")
		print(f"[DEBUG] FgiG_pro = {FgiG_pro:0,.2f}")
		"""

		# Printing Nodes
		# Print B
		print("Node B:")
		print("-------")
		print (f"\tP(B) = {B_pro:0,.2f}")

		# Print G
		difference = max(G_count,B_count) - GgiB_count
		# print(f"[DEBUG] difference = {difference}")
		print("Node G:")
		print("-------")
		print("\t{:<8} {:<8}".format('B','P(G|B)'))
		print("\t------------------------------")
		print("\t{:<8} {:<8,.2f}".format('T', GgiB_pro))
		print("\t{:<8} {:<8,.2f}".format('F', ( difference/(max_data-B_count ) ) ))

		# Print C
		print("Node C:")
		print("-------")
		print (f"\tP(C) = {C_pro:0,.2f}")

		# Print F
		print("Node F")
		print("-------")
		print("\t{:<8} {:<8} {:8<}".format('G', 'C','P(F|G,C)'))
		print("\t------------------------------")
		print("\t{:<8} {:<8} {:8<,.2f}".format('T', 'T', FgiGC_pro))
		print("\t{:<8} {:<8} {:8<,.2f}".format('T', 'F', FgiG_pro))
		print("\t{:<8} {:<8} {:8<,.2f}".format('F', 'T', CF_count/C_count))
		print("\t{:<8} {:<8} {:8<,.2f}".format('F', 'F', ( (G_count+C_count)/((F_count-CF_count)+(G_count- FgiG_count)) ) ))

		# Converting arguments into calculation
		if B_bool == 'Bt':
			B_bool = 1
		else:
			B_bool = 0
		if G_bool == 'Gt':
			G_bool = 1
		else:
			G_bool = 0
		if C_bool == 'Ct':
			C_bool = 1
		else:
			C_bool = 0
		if F_bool == 'Ft':
			F_bool = 1
		else:
			F_bool = 0

		
		asst_model = BayesianNetwork([('B','G'),('G','F'),('C','F')])
		B_cpd = TabularCPD(
					variable = 'B',
					variable_card = 2,
					values = [ [ B_pro],[(1-B_pro)] ])
		C_cpd = TabularCPD(
					variable = 'C',
					variable_card = 2,
					values = [ [ C_pro],[(1-C_pro)] ])
		G_cpd = TabularCPD(
					variable = 'G',
					variable_card = 2,
					values = [[ GgiB_pro,( difference/(max_data-B_count ) )],
					[1- GgiB_pro,1-( difference/(max_data-B_count ) )]],
					evidence = ['B'],
					evidence_card = [2])
		F_cpd = TabularCPD(
					variable = 'F',
					variable_card = 2,
					values = [[FgiGC_pro, FgiG_pro, CF_count/C_count,( (G_count+C_count)/((F_count-CF_count)+(G_count- FgiG_count)) )],
					[( 1-FgiGC_pro ),( 1-FgiG_pro ),( 1-(CF_count/C_count) ),(1-( (G_count+C_count)/((F_count-CF_count)+(G_count- FgiG_count)) ))]],
					evidence = ['G','C'],
					evidence_card = [2,2])
		asst_model.add_cpds( B_cpd, C_cpd, G_cpd, F_cpd )

		F_infer = VariableElimination(asst_model)
		asst_prob = F_infer.query(
					variables=['F'],
					evidence={'B':1,'C':1,'G':0})

		print()
		print(f"With values from the assignment: B = {B_bool}, G = {G_bool}, C = {C_bool}, F = {F_bool}...")
		print(f"probability is")
		print(f"{asst_prob}")

		user_prob = F_infer.query(
					variables=['F'],
					evidence={'B':B_bool,'C':C_bool,'G':G_bool})
		print()
		print(f"With values from the user: B = {B_bool}, G = {G_bool}, C = {C_bool}, F = {F_bool}...")
		print(f"probability is")
		print(f"{user_prob}")