ASSIGNMENT I
Jeremiah Richard
ID: 1001475742

libraries used:
import sys
from PIL import Image
import numpy as np
import skimage.io as io
import skimage.color as color
from skimage import transform
import matplotlib.pyplot as plt
import cv2
import random

Version: Python 3.10.5
Compile Instructions:
HUE[0:360]
SAT[0:360]
VAL[0:360]
- color_space_test: python color_space_test.py puppy.png <HUE> <SAT> <VAL>

- img_transform.py: python img_transforms.py
* NOTE: included inside of the program are comments to comment out to use
each function and test for grading *

- create_img_pyramid.py: python create_img_pyramid.py
* NOTE: This file will show the pyramid image, but lacks
the functionality to save files as they degress into smaller
image*