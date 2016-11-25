;FPM skill by BMC version=0.08 bimeichun@163.com
;Tree:LC/SMD
;Desc:SMA(DO-214AC)
;Vendor:BMC
;Count:1
Courtyard=0.3
pL=4.32 pW=2.6 pH=2.2
sprintf(pName "LC-SMA_DO-214AC")
_PrepareNewSym(pName)

PN=_PadSMFillet(2 2)

_CreatePin(PN -2.1:0 "2")
_CreatePin(PN 2.1:0 "1")

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
	_Rectangle(0.7*2 1.2*2 0:0)
	_Line(list(-0.3:-1.2 -0.3:1.2))
	_Circle(0.125 -2.6:1.55 0.25)
)
		
;bound
_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(3.75*2 2.1*2 0:0) pH)
_Layer(lPkgGeoDfaT) _BoundHeight(_ShapeRectangle(pL pW 0:0) pH pName)

;ref & val
_CreateRefValue(pName 0:0 0:0)
_SaveDesign(pName)
