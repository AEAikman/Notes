from PyQt4 import uic
import os
cwd = os.getcwd()

uic.compileUiDir(cwd,recurse=False)