;FPM skill by BMC version=0.08 bimeichun@163.com
;Tree:BMC/Connector
;Desc:XH2.54 pitch 2.50
;Vendor:BMC
;Count:15
;Datasheet:http://www.szlcsc.com/member/downloadFile-7660F65EC8B31EB5-new_pdf_doc-pdf_see.html

Courtyard=0.3 Pitch=2.5 pB=5.8 pH=7.0 pPad=1.6 pHole=1.0

PN1 = _PadTH_Default(pPad pHole t)
PN2 = _PadTH_Default(pPad pHole)
for(num 2 16
	sprintf(pName, "BMC-XH254-%dP", num)
	_PrepareNewSym(pName)
	pA=(num+1)*Pitch
	
	for(i 1 num
		px = (i-(num+1.0)/2)*Pitch
		if(i==1
			_CreatePin(PN1 px:0.6 i) 
			_CreatePin(PN2  px:0.6 i) 
		) 
	)
    
	;bound
	_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2) pH) 
	_Layer(lPkgGeoDfaT) _BoundHeight(_ShapeRectangle(pA pB) pH pName)
    
	;silkscreen & assembly
	x=(-(num-1.0)/2)*Pitch y=pB/2+0.2	
	for(i 1 2
		if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
		_Rectangle(pA pB)
		_Line(list(-pA/2:pB/2-0.75 -2:pB/2-0.75 -2:pB/2))
		;_Line(list(-2:pB/2-0.75 ))
		
		_Line(list(pA/2:pB/2-0.75 2:pB/2-0.75 2:pB/2))
		;_Line(list(2:pB/2-0.75 ))
		
		_Line(list(-pA/2:pB/2-2.25 -pA/2+0.75:pB/2-2.25 -pA/2+0.75:-pB/2+0.75 pA/2-0.75:-pB/2+0.75 pA/2-0.75:pB/2-2.25 pA/2:pB/2-2.25))
		;_Line(list(-pA/2+0.75:pB/2-2.25 ))
		;_Line(list(-pA/2+0.75:-pB/2+0.75 ))
		;_Line(list(pA/2-0.75:-pB/2+0.75 ))
		;_Line(list(pA/2-0.75:pB/2-2.25 ))
		
		_Line(list(x:y x-0.2:y+0.6 x+0.2:y+0.6 x:y))
		_Line(list(x:y x:y+0.6))
	)
    
	;ref & val
	_CreateRefValue(pName 0:0)
	_CrossCenter()
	
	_SaveDesign(pName)
	_MakeDevice(pName,2)
)