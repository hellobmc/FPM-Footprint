;FPM skill by BMC version=0.08 bimeichun@163.com
;Tree:LC/SMD
;Desc:HC49 SMD
;Vendor:BMC
;Count:1
pL=13.4 pW=4.9 pH=3.8
sprintf(pName "LC-HC-49SMD")
_PrepareNewSym(pName)

PN=_PadSMFillet(5.5 2)

_CreatePin(PN -4.75:0 "1")
_CreatePin(PN 4.75:0 "2")

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
	_Line(list(-5.7:1.65 -5.7:2.4 5.7:2.4 5.7:1.65))
	_Line(list(-5.7:-1.65 -5.7:-2.4 5.7:-2.4 5.7:-1.65))
)
		
;bound
_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(8.1*2 3.25*2 0:0) pH)
_Layer(lPkgGeoDfaT) _BoundHeight(_ShapeRectangle(pL pW 0:0) pH pName)

;ref & val
_CreateRefValue(pName 0:0 0:0)
_SaveDesign(pName)
