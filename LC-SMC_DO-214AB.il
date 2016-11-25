;FPM skill by BMC version=0.08 bimeichun@163.com
;Tree:LC/SMD
;Desc:SMC(DO-214AB)
;Vendor:BMC
;Count:1
Courtyard=0.3
pL=3.43*2 pW=2.92*2 pH=2.4
sprintf(pName "LC-SMC_DO-214AB")
_PrepareNewSym(pName)

PN=_PadSMFillet(2.794 3.81)

_CreatePin(PN -3.568:0 "2")
_CreatePin(PN 3.568:0 "1")

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
	_Rectangle(1.8*2 2.7*2 0:0)
	_Line(list(-1.2:2.7 -1.2:-2.7))
	_Circle(0.2 -4.2:2.6 0.4)
)
		
;bound
_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(5.5*2 3.75*2 0:0) pH)
_Layer(lPkgGeoDfaT) _BoundHeight(_ShapeRectangle(pL pW 0:0) pH pName)

;ref & val
_CreateRefValue(pName 0:0 0:0)
_SaveDesign(pName)
