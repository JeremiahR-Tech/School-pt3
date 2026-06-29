import sys
from PyQt5 import QtWidgets

app = QtWidgets.QApplication(sys.argv)

screen = app.primaryScreen()
print('Screen: %s' % screen.name())
size = screen.size()
width = size.width()/100
height = size.height()/100
print('Size: %f x %f' % (width, height))
rect = screen.availableGeometry()
print('Available: %d x %d' % (rect.width(), rect.height()))