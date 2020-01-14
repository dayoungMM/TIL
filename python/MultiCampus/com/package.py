# package.py (주피터 노트북)
from ggoreb.python.reader import *
import ggoreb.python.writer.file as file
import ggoreb.python.writer.print as printer
import ggoreb.python.writer.screen as screen

barcode.read(1234)
qrcode.read(5678)
print('='*20)
file.write()
printer.write()
screen.write()