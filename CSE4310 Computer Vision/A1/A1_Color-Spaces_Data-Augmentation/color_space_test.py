# Jeremiah Richard
# ID: 1001475742
# Assignment I - color_space_test.py
"""
This program have functions for change RGB to HSV & HSV to RGB.
It also allow the user to make these motifications.
"""

import sys
from PIL import Image
import numpy as np
import skimage.io as io
import skimage.color as color
from skimage import transform
import matplotlib.pyplot as plt
import cv2

def RGBtoHSV(img):
    """
    print("---- BEFORE NORMALIZING ----")
    print(img)
    img[:][:] = img[:][:] / 255.0
    """
    
    # DEBUG
    """
    print("---- After NORMALIZING ----")
    print(img)
    """

    for i in range(len(img)):
        for j in range( len(img[i]) ):
            
            (r,g,b) = img[i][j]
            max_col = max(r,g,b)
            min_col = min(r,g,b)
            c = max_col - min_col
            
            if max_col == min_col:
                hue = 0
            elif max_col == r:
                hue = 60 * (((g-b)/c) % 6) 
            elif max_col == g:
                hue = 60 * (((b-r)/c) + 2.0)
            elif max_col == b:
                hue = 60 * (((r-g)/c) + 4.0)
            
            if max_col == 0:
                sat = 0
            else:
                sat = c/max_col
                
            val = max_col
            hue = hue/360.0
            
            img[i][j] = (hue,sat,val)
            
    # Creating array back into image
    """
    # FOR DEBUGGING
    print("---- After Calculations ----")
    print(img)

    img_save = img * 255
    img_save = img_save.astype(np.uint8)
    io.imsave("puppy2.png",img_save)
    print("----After Compression---")
    print(img_save)
    """
    return img

def HSVtoRGB(img):
    for i in range(len(img)):
        for j in range( len(img[i]) ):
            (hue,sat,val) = img[i][j]
            c = val * sat
            h_p = hue/60
            x = c * (1 - (abs( (h_p % 2) - 1)))
            
            if ((h_p >= 0) and (h_p < 1)):
                (r,g,b) = (c,x,0)
            elif ((h_p >= 1) and (h_p < 2)):
                (r,g,b) = (x,c,0)
            elif ((h_p >= 2) and (h_p < 3)):
                (r,g,b) = (0,c,x)
            elif ((h_p >= 3) and (h_p < 4)):
                (r,g,b) = (0,x,c)
            elif ((h_p >= 4) and (h_p < 5)):
                (r,g,b) = (x,0,c)
            elif ((h_p >= 5) and (h_p < 6)):
                (r,g,b) = (c,0,x)
            
            m = val - c
            (r,g,b) = ( r+m, g+m, b+m )
            img[i][j] = (r,g,b)
            
    return img

def is_float(string):
    try:
        float(string)
        return True
    except ValueError:
        return False

if __name__ == '__main__':
    if len(sys.argv) != 5:
        print("[ERROR] Incorrect arguments. Format: FILENAME HUE SAT VAL")
        quit()
    
    # --- DEBUG ----
    """
    print(f"[DEBUG] Arguments count: { len(sys.argv) }")
    for i, arg in enumerate( sys.argv ):
        print(f"[DEBUG] Argument {i}: {arg}")
    """ 

    # checking condtions for each argument
    hue_cond = sys.argv[2].isdigit()
    sat_cond = is_float(sys.argv[3])
    val_cond = is_float(sys.argv[4])

    if ( (not(hue_cond)) or (not(sat_cond)) or (not(val_cond)) ):
        print("[ERROR] Hue range: [0,360], Sat/Val range: [0,1]")
        quit()
    else:
        image_name = sys.argv[1]
        hueM = int(sys.argv[2])
        satM = float(sys.argv[3])
        valM = float(sys.argv[4]) 

    hue_cond = ( (hueM < 0) or (hueM > 360) )
    sat_cond = ( (satM < 0) or (satM > 1) )
    val_cond = ( (valM < 0) or (valM > 1) )
    if ( (hue_cond) or (sat_cond) or (val_cond) ): #Hue, Sat, Val
        print("[ERROR] Hue range: [0,360], Sat/Val range: [0,1]")
        print(f"Hue: {hue_cond}")
        print(f"Sat: {sat_cond}")
        print(f"Val: {val_cond}")
        quit()

    # Loading user image
    img = io.imread(image_name)

    # Convert to RGB from RGBA (if applicable)
    if img.ndim == 3 and img.shape[2] == 4:
        img = color.rgba2rgb(img)

    img_hsv = RGBtoHSV(img)
    img_hsv[:,:,0] += hueM
    img_hsv[:,:,1] += satM
    img_hsv[:,:,2] += valM

    plt.imshow(HSVtoRGB(img_hsv))
    plt.show()

