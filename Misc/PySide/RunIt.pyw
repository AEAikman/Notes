import sys
from PySide.QtGui import *
from PySide.QtCore import *
from Basic import Ui_Form

class MainWindow(QMainWindow, Ui_Form):
   def __init__(self):
       super(MainWindow, self).__init__()
       self.setupUi(self)
       self.assignWidgets()
       # Keep window on top
       self.setWindowFlags(self.windowFlags() ^ Qt.WindowStaysOnTopHint)
       self.show()
   
   def assignWidgets(self):
       self.pushButton.clicked.connect(self.goPushed)
   
   def goPushed(self):
       self.lineEdit.setText("Go, Go, Go!")

if __name__ == '__main__':
  try:
    app = QtGui.QApplication.instance()
  except:
    app = QApplication(sys.argv)
  mainWin = MainWindow()
  ret = app.exec_()
  sys.exit( ret )