"""
Name: Jeremiah Richard
ID: 1001475742
Course: CSE4310 (Computer Vision)
Instructor: Alex Dillhoff
Program: asst3.py

"""

import sys
import random
import argparse
import numpy
numpy.float = numpy.float64
numpy.int = numpy.int_
from skimage.registration import optical_flow_tvl1, optical_flow_ilk
from skimage.transform import warp

from PySide2 import QtCore, QtWidgets, QtGui
from skvideo.io import vread

# Classes below
class KalmanFilters:
    def __init__(self, X, Y, alpha, step):
        self.alpha = None   # Used to 
        self.X = None
        self.Y = None
        self.step = 5

    def predict(self, X_hat_t_1, P_t_1, F_t, B_t, U_t, Q_t):
        X_hat_t=F_t.dot(X_hat_t_1)+(B_t.dot(U_t).reshape(B_t.shape[0],-1) )
        P_t=np.diag(np.diag(F_t.dot(P_t_1).dot(F_t.transpose())))+Q_t
        return X_hat_t,P_t

    def update(self, X_hat_t, P_t, Z_t, R_t, H_t):
        K_prime=P_t.dot(H_t.transpose()).dot( np.linalg.inv ( H_t.dot(P_t).dot(H_t.transpose()) +R_t ) )  
        print("K:\n",K_prime)
        
        X_t=X_hat_t+K_prime.dot(Z_t-H_t.dot(X_hat_t))
        P_t=P_t-K_prime.dot(H_t).dot(P_t)
    
    return X_t,P_t

class MotionDetector:
    # The first three frames of a video will be apart of the intialization
    def __init__(self, ):
        self.alpha = None          # Frame hysteresis for determining active or inactive objects.
        self.moThreshold = None    # - The motion threshold for filtering out noise.
        self.trkThreshhold = None  # - A distance threshold to determine if an object candidate belongs to an object currently being tracked.
        self.skip = None           # - The number of frames to skip between detections. The tracker will still work well even if it is not updated every frame.
        self.trkLimit = None       # - The maximum number of objects to track.

class QtDemo(QtWidgets.QWidget):
    def __init__(self, frames):
        super().__init__()

        self.frames = frames

        self.current_frame = 0

        self.button = QtWidgets.QPushButton("Next Frame")

        # Configure image label
        self.img_label = QtWidgets.QLabel(alignment=QtCore.Qt.AlignCenter)
        h, w, c = self.frames[0].shape
        if c == 1:
            img = QtGui.QImage(self.frames[0], w, h, QtGui.QImage.Format_Grayscale8)
        else:
            img = QtGui.QImage(self.frames[0], w, h, QtGui.QImage.Format_RGB888)
        self.img_label.setPixmap(QtGui.QPixmap.fromImage(img))

        # Configure slider
        self.frame_slider = QtWidgets.QSlider(QtCore.Qt.Orientation.Horizontal)
        self.frame_slider.setTickInterval(1)
        self.frame_slider.setMinimum(0)
        self.frame_slider.setMaximum(self.frames.shape[0]-1)

        self.layout = QtWidgets.QVBoxLayout(self)
        self.layout.addWidget(self.img_label)
        self.layout.addWidget(self.button)
        self.layout.addWidget(self.frame_slider)

        # Connect functions
        self.button.clicked.connect(self.on_click)
        self.frame_slider.sliderMoved.connect(self.on_move)

    @QtCore.Slot()
    def on_click(self):
        if self.current_frame == self.frames.shape[0]-1:
            return
        h, w, c = self.frames[self.current_frame].shape
        if c == 1:
            img = QtGui.QImage(self.frames[self.current_frame], w, h, QtGui.QImage.Format_Grayscale8)
        else:
            img = QtGui.QImage(self.frames[self.current_frame], w, h, QtGui.QImage.Format_RGB888)
        self.img_label.setPixmap(QtGui.QPixmap.fromImage(img))
        self.current_frame += 1

    @QtCore.Slot()
    def on_move(self, pos):
        self.current_frame = pos
        h, w, c = self.frames[self.current_frame].shape
        if c == 1:
            img = QtGui.QImage(self.frames[self.current_frame], w, h, QtGui.QImage.Format_Grayscale8)
        else:
            img = QtGui.QImage(self.frames[self.current_frame], w, h, QtGui.QImage.Format_RGB888)
        self.img_label.setPixmap(QtGui.QPixmap.fromImage(img))


if __name__ == "__main__":

    parser = argparse.ArgumentParser(description="Demo for loading video with Qt5.")
    parser.add_argument("video_path", metavar='PATH_TO_VIDEO', type=str)
    parser.add_argument("--num_frames", metavar='n', type=int, default=-1)
    parser.add_argument("--grey", metavar='True/False', type=str, default=False)
    args = parser.parse_args()

    num_frames = args.num_frames

    if num_frames > 0:
        frames = vread(args.video_path, num_frames=num_frames, as_grey=args.grey)
    else:
        frames = vread(args.video_path, as_grey=args.grey)

    app = QtWidgets.QApplication([])

    widget = QtDemo(frames)
    widget.resize(800, 600)
    widget.show()

    sys.exit(app.exec_())