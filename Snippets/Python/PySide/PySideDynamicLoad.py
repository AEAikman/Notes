'''

Shelf Button:
# import sys
# sys.path.append('SCRIPTSPATH')
import SCRIPTNAME as SCRIPTALIAS
reload(SCRIPTALIAS)
SCRIPTALIAS.main()

Marking Menu Script
python( "import SCRIPTNAME as SCRIPTALIAS; reload(SCRIPTALIAS); SCRIPTALIAS.main();" )
'''


import pymel.core as pm


from maya import OpenMayaUI
from pymel.all import *
from PySide import QtCore, QtGui, QtUiTools
import shiboken, os, sys

# Because PyMel doesn't have cmds.file(q=True, modified=True) yet
import maya.cmds as cmds

UI_File = os.path.dirname(os.path.realpath(__file__))+"\\UIFILENAME.ui"

def getMayaWindow():
    ptr = OpenMayaUI.MQtUtil.mainWindow()
    if ptr is not None:
        return shiboken.wrapInstance(long(ptr), QtGui.QWidget)

def loadUIWidget(filepath, parent=getMayaWindow()):
    uifile = QtCore.QFile(filepath)
    uifile.open(QtCore.QFile.ReadOnly)
    ui = QtUiTools.QUiLoader().load(uifile, parent)
    uifile.close()
    return ui

class SKEexporterUI():

    def __init__(self):
        # mainUI = SCRIPT_LOC + "/templateUI/demoOne.ui"
        MayaMain = shiboken.wrapInstance(long(OpenMayaUI.MQtUtil.mainWindow()), QtGui.QWidget)

        # main window load / settings
        self.MainWindowUI = loadUIWidget(UI_File, MayaMain)
        self.chrName = pm.sceneName().split('/')[-1].split('.')[0]
        self.MainWindowUI.exportPathLine.setText(self.startDir)
        self.MainWindowUI.show()
        self.connectGUI()


    def connectGUI(self):
        self.guiSettings = [self.MainWindowUI.autoSelectChk.isChecked()]
        # self.MainWindowUI.runBtn.clicked.connect(lambda: self.testMe('arg'))
        self.MainWindowUI.runBtn.clicked.connect(lambda: self.doExport())
        self.MainWindowUI.browseBtn.clicked.connect(lambda: self.dirBrowse())


    def dirBrowse(self):
        ''' Browses for a directory
        '''
        chosenDir = pm.fileDialog2(dir=self.startDir, fm=3, ds=1, cap='SK Parent Destination')[0]
        chosenDir = chosenDir.replace('\\', '/')
        self.MainWindowUI.exportPathLine.setText(chosenDir)


    def doExport(self):
        return # broken purposefully




def main():
    WinName = 'SKExporterUI'

    if pm.window(WinName, exists=True):
        pm.deleteUI(WinName)

    SKEexporterUI()


