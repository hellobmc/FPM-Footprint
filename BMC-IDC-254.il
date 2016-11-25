;FPM skill by BMC version=0.08 bimeichun@163.com
;Tree:BMC/Connector
;Desc:IDC 2.54
;Vendor:BMC
;Count:10
;Datasheet:http://www.szlcsc.com/member/downloadFile-D69832D125B5FB90-new_pdf_doc-pdf_see.html

Courtyard=0.3 Pitch=2.54 pB=8.8 pH=8.8 pPad=1.5 pHole=0.9

PN1 = _PadTH_Default(pPad pHole t)
PN2  = _PadTH_Default(pPad pHole)
for(num 2 10
	sprintf(pName, "BMC-IDC-254-2x%dP", num)
	_PrepareNewSym(pName)
	pA=num*Pitch+7.6
	
	Pnum=0
	for(i 1 num Pnum++ sprintf(pin_name,"%d",Pnum) 
		px = (i-(num+1.0)/2)*Pitch
		if(i==1 
			(progn _CreatePin(PN1 px:-Pitch/2 pin_name)
			Pnum++ sprintf(pin_name,"%d",Pnum) 
			_CreatePin(PN2 px:Pitch/2 pin_name))
			(progn _CreatePin(PN2 px:-Pitch/2 pin_name)
			Pnum++ sprintf(pin_name,"%d",Pnum) 
			_CreatePin(PN2 px:Pitch/2 pin_name))
		)
	)
    
	;bound
	_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2) pH) 
	_Layer(lPkgGeoDfaT) _BoundHeight(_ShapeRectangle(pA pB) pH pName)
	    
	;silkscreen & assembly	
	x=(-(num-1.0)/2)*Pitch y=-pB/2-0.2
	for(i 1 2
		if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
		_Rectangle(pA pB)
		_Rectangle(pA-2.28 pB-2.28 0:0)
		_Rectangle(4.5 1.14 0:-(pB/2)+1.14/2)

		_Line(list(x:y x-0.2:y-0.6 x+0.2:y-0.6 x:y))
		_Line(list(x:y x:y-0.6))
	)
	    
	;ref & val
	_CreateRefValue(pName 0:0)
	_CrossCenter()

	_SaveDesign(pName)
	_MakeDevice(pName,2)
)
