;FPM skill by BMC version=0.08 bimeichun@163.com
;Tree:LC/SMD
;Desc:0603_LED
;Vendor:BMC
;Count:1
pA=3.5 pB=2 pL=1.6 pW=0.8 pH=0.45 
sprintf(pName "LC-0603_LED")
_PrepareNewSym(pName)

PN=_PadSMFillet(0.93 0.98)

_CreatePin(PN -0.77:0 "2")
_CreatePin(PN 0.77:0 "1")

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
	_Rectangle(3.124 1.634 0:0)
	_Line(list(2:0 3.2:0))
	_Line(list(2.6:0.6 2.6:-0.6))
)
		
;bound
_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(3.5 2 0:0) pH)
_Layer(lPkgGeoDfaT) _BoundHeight(_ShapeRectangle(pL pW 0:0) pH pName)

;ref & val
_CreateRefValue(pName 0:0 0:0)
_SaveDesign(pName)
