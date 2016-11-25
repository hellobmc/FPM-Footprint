;FPM skill by BMC version=0.08 bimeichun@163.com
;Tree:LC/SMD
;Desc:SOD-123
;Vendor:BMC
;Count:1
Courtyard=0.3
pL=1.35*2 pW=0.825*2 pH=1.17
sprintf(pName "LC-SOD-123")
_PrepareNewSym(pName)

PN=_PadSMFillet(1 1.25)

_CreatePin(PN -1.475:0 "2")
_CreatePin(PN 1.475:0 "1")

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
	_Rectangle(0.5*2 0.7*2 0:0)
	_Line(list(-0.2:-0.7 -0.2:0.7))
	_Circle(0.125 -1.8:1 0.25)
)
		
;bound
_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(2.6*2 1.6*2 0:0) pH)
_Layer(lPkgGeoDfaT) _BoundHeight(_ShapeRectangle(pL pW 0:0) pH pName)

;ref & val
_CreateRefValue(pName 0:0 0:0)
_SaveDesign(pName)
