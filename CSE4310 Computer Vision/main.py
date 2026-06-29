#Command line
import numpy as np
import skimage.io as io
import skimage.color as color
from skimage import transform
import matplotlib.pyplot as plt
import sys

if __name__ == '__main__':
	print(f"Arguments count: { len(sys.argv) }")
	for i, arg in enumerate( sys.argv ):
		print(f"Argument {i: > 6}: {arg}")