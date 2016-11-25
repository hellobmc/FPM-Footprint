;FPM skill by BMC version=0.08 bimeichun@163.com
;Tree:LC/SMD
;Desc:SOT-23
;Vendor:BMC
;Count:1
Courtyard=0.3
pL=2.5 pW=3 pH=2.5
sprintf(pName "LC-SOT-23")
_PrepareNewSym(pName)

PN=_PadSMFillet(1.25 0.7)

_CreatePin(PN 1.25:-0.95 "1")
_CreatePin(PN 1.25:0.95 "2")
_CreatePin(PN -1.25:0 "3")

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
	_Line(list(0.165:1.46 -0.65:1.46 -0.65:0.8))
	_Line(list(0.165:-1.46 -0.65:-1.46 -0.65:-0.8))
)
		
;bound
_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(2.4*2 2.25*2 0:0) pH)
_Layer(lPkgGeoDfaT) _BoundHeight(_ShapeRectangle(pL pW 0:0) pH pName)

;ref & val
_CreateRefValue(pName 0:0 0:0)
_SaveDesign(pName)
