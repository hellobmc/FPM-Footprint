;FPM skill by BMC version=0.08 bimeichun@163.com
;Tree:LC/SMD
;Desc:SOT-223
;Vendor:BMC
;Count:1
Courtyard=0.3
pL=7 pW=6.5 pH=2.5
sprintf(pName "LC-SOT-223")
_PrepareNewSym(pName)

PN=_PadSMFillet(2.2 1)
PN2=_PadSMFillet(2.2 3.5)

_CreatePin(PN 3:-2.3 "1")
_CreatePin(PN 3:0 "2")
_CreatePin(PN 3:2.3 "3")
_CreatePin(PN2 -3:0 "4")

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
	_Rectangle(1.4*2 3*2 0:0)
)
		
;bound
_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(4.75*2 4.25*2 0:0) pH)
_Layer(lPkgGeoDfaT) _BoundHeight(_ShapeRectangle(pL pW 0:0) pH pName)

;ref & val
_CreateRefValue(pName 0:0 0:0)
_SaveDesign(pName)
