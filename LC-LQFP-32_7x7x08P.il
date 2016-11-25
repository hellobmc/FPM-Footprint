;FPM skill by BMC version=0.08 bimeichun@163.com
;Tree:LC/SMD
;Desc:LQFP-32 7x7 Pitch 0.8
;Vendor:BMC
;Count:1
Courtyard=0.3
FilletR=0.55/2
pL=7 pW=7 pH=1.6 Pitch=0.8
sprintf(pName "LC-LQFP-32_7x7x08P")
_PrepareNewSym(pName)

PN1=_PadSMFillet(0.55 1.65)
PN2=_PadSMFillet(1.65 0.55)
	
for(i 1 8
	px=Pitch*(i-1)-2.8
	_CreatePin(PN1 px:-4.175 i)
)
	
for(i 9 16
	py=Pitch*(i-9)-2.8
	_CreatePin(PN2 4.175:py i)
)
	
for(i 17 24
	px=2.8-Pitch*(i-17)
	_CreatePin(PN1 px:4.175 i)
)
	
for(i 25 32
	py=2.8-Pitch*(i-25)
	_CreatePin(PN2 -4.175:py i)
)

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
	_Rectangle(2.95*2 2.95*2 0:0)
	_Circle(0.3 -1.95:-1.95 0.6)
	_Circle(0.15 -3.6:-4.2 0.3)
)
		
;bound
_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(5.5*2 5.5*2 0:0) pH)
_Layer(lPkgGeoDfaT) _BoundHeight(_ShapeRectangle(pL pW 0:0) pH pName)

;ref & val
_CreateRefValue(pName 0:0 0:0)
_SaveDesign(pName)
