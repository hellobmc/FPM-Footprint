;FPM skill by BMC version=0.08 bimeichun@163.com
;Tree:LC/SMD
;Desc:SMB(DO-214AA)
;Vendor:BMC
;Count:1
Courtyard=0.3
pL=2.285*2 pW=1.905*2 pH=2.2
sprintf(pName "LC-SMB_DO-214AA")
_PrepareNewSym(pName)

PN=_PadSMFillet(2.159 2.743)

_CreatePin(PN -2.21:0 "2")
_CreatePin(PN 2.21:0 "1")

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
	_Rectangle(0.8*2 1.7*2 0:0)
	_Line(list(-0.4:1.7 -0.4:-1.7))
	_Circle(0.125 -2.9:1.9 0.25)
)
		
;bound
_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(3.8*2 2.75*2 0:0) pH)
_Layer(lPkgGeoDfaT) _BoundHeight(_ShapeRectangle(pL pW 0:0) pH pName)

;ref & val
_CreateRefValue(pName 0:0 0:0)
_SaveDesign(pName)
