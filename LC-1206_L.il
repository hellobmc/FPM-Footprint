;FPM skill by BMC version=0.08 bimeichun@163.com
;Tree:LC/SMD
;Desc:1206_L
;Vendor:BMC
;Count:1
pA=5.2 pB=2.8 pL=3.1 pW=1.55 pH=0.55
sprintf(pName "LC-1206_L")
_PrepareNewSym(pName)

PN=_PadSMFillet(1.13 1.8)

_CreatePin(PN -1.49:0 "1")
_CreatePin(PN 1.49:0 "2")

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
	_Line(list(-2.382:1.227 2.382:1.227))
	_Line(list(-2.382:-1.227 2.382:-1.227))
)
		
;bound
_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(pA pB 0:0) pH)
_Layer(lPkgGeoDfaT) _BoundHeight(_ShapeRectangle(pL pW 0:0) pH pName)

;ref & val
_CreateRefValue(pName 0:0 0:0)
_SaveDesign(pName)
