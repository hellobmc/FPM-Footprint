;FPM skill by BMC version=0.08 bimeichun@163.com
;Tree:LC/SMD
;Desc:0805
;Vendor:BMC
;Count:1
pA=4 pB=2.6 pL=2 pW=1.25 pH=0.55
sprintf(pName "LC-0805")
_PrepareNewSym(pName)

PN=_PadSMFillet(1.16 1.47)

_CreatePin(PN -0.875:0 "1")
_CreatePin(PN 0.875:0 "2")
	
;bound
_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(pA pB 0:0) pH)
_Layer(lPkgGeoDfaT) _BoundHeight(_ShapeRectangle(pL pW 0:0) pH pName)

;ref & val
_CreateRefValue(pName 0:0 0:0)
_SaveDesign(pName)
