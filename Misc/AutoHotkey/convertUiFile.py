from PyQt4 import uic
import os
cwd = os.getcwd()
# folderToConvert = r'Z:\InProd\Ozzy\artists\Aaron\Scripts\Misc\Python\OzzyMover'
uic.compileUiDir(cwd,recurse=False)