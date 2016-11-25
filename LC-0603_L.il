;FPM skill by BMC version=0.08 bimeichun@163.com
;Tree:LC/SMD
;Desc:0603_L
;Vendor:BMC
;Count:1
pA=3.5 pB=2 pL=1.6 pW=0.8 pH=0.45 
sprintf(pName "LC-0603_L")
_PrepareNewSym(pName)

PN=_PadSMFillet(0.93 0.98)

_CreatePin(PN -0.77:0 "1")
_CreatePin(PN 0.77:0 "2")

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
	_Line(list(-1.562:0.817 1.562:0.817))
	_Line(list(-1.562:-0.817 1.562:-0.817))
)
		
;bound
_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(pA pB 0:0) pH)
_Layer(lPkgGeoDfaT) _BoundHeight(_ShapeRectangle(pL pW 0:0) pH pName)

;ref & val
_CreateRefValue(pName 0:0 0:0)
_SaveDesign(pName)
