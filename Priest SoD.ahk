#MaxThreadsPerHotkey 3



Loop{
	Random, rand, 150, 300
	Random, randLong, 250, 450
	
	
	Start:
	PixelGetColor, probeColorCC, 1251, 920 ;CombatCheck
	PixelGetColor, probeColorHP25, 1442, 920 ;HP25% warning
	PixelGetColor, probeColorHP20, 1462, 920 ;HP20% warning
	PixelGetColor, probeColorHP65, 1478, 920 ;HP65% warning
	PixelGetColor, probeColorTHP, 1496, 920 ;target HP lower then 45 warning 00A9FF
	PixelGetColor, probeColorPEN, 1397, 920 ;Pennence
	PixelGetColor, probeColorSWP, 1360, 920 ;Word pain
	PixelGetColor, probeColorVP, 1415, 920 ;Void Plague
	PixelGetColor, probeColorFT, 1378, 920 ;Fortitude
	PixelGetColor, probeColorPWS, 1343, 920 ;Shield
	PixelGetColor, probeColorSHT, 334, 1036 ;Shoot
	PixelGetColor, probeColorRNW, 1513, 920 ;renew
	PixelGetColor, probeColorHF, 1326, 920 ;HolyFire  00FFF4
	PixelGetColor, probeColorCAST, 1270, 920 ;Casting  00FFF4
	PixelGetColor, probeColorIF, 1325, 920 ;Inner Fire
	PixelGetColor, probeColorHUM, 1309, 920 ;Homunculi 
	
	
	
		
		Sleep, rand
													;Cast order in and out of combat
			if (probeColorCAST="0xE8D8FF") {		;casting check
					Goto, Start	
			}else if (probeColorHP20="0xBEFF00") {		
					Send, 0
					Sleep, rand
			}else if (probeColorHP25="0x06FF00") {		
					Send, 6
					Sleep, rand
			}else if (probeColorHP65="0xFFA51D"){
		
				if (probeColorRNW!="0xADFFD1")  
				{
					Send, 7
					Sleep, rand
					
				} else {						
					Send, 6
					Sleep, rand
					}
		

			}else if (probeColorFT="0xFFFCF9") {		
					Send, =
					Sleep, rand
			}else if (probeColorIF="0x3B8BFF") {
					Send, 9
					Sleep, rand
					}
	
		if (probeColorCC="0x1705FF") {	;main combat check , if combat use rotation53
			if (probeColorCAST="0xE8D8FF") {		
					Goto, Start					
				
				} else if (probeColorPWS="0xFF64FE")  && (probeColorTHP!="0x00A9FF") {		
					Send, -
					Sleep, rand
					
				} else if (probeColorHUM="0xFF99BB") {			
					Send, 2 
					Sleep, rand
					
				} else if (probeColorVP="0x00F1FF") && (probeColorTHP!="0x00A9FF") {			
					Send, 8 
					Sleep, rand
					
				} else if (probeColorSWP="0x7141FF") && (probeColorTHP!="0x00A9FF") {			
					Send, 4 
					Sleep, rand
							
				;} else if (probeColorHF="0x00FFF4") && (probeColorTHP!="0x00A9FF") {			
				;	Send, 5 
				;	Sleep, rand
				
				} else if (probeColorPEN="0xFF5118") {		
					Send, 3
					Sleep, rand
						
				} else if (probeColorSHT="0x1A74DD") {									
					Send, 1
					Sleep, rand
				}
			}
			
		if (probeColorCC!="0x1705FF") {  ;out of combat check
			
			if (probeColorHP65="0xFFA51D") {		
					Send, 6
					Sleep, rand
				}
		
			
			}
				
		
	}



$3:: 	;used for finding color values
	PixelGetColor, probeColorCC, 1251, 920 ;CombatCheck
	PixelGetColor, probeColorHP25, 1442, 920 ;HP25% warning
	PixelGetColor, probeColorHP20, 1462, 920 ;HP20% warning
	PixelGetColor, probeColorHP65, 1478, 920 ;HP65% warning
	PixelGetColor, probeColorTHP, 1496, 920 ;target HP lower then 45 warning
	PixelGetColor, probeColorPEN, 1397, 920 ;Pennence
	PixelGetColor, probeColorSWP, 1360, 920 ;Word pain
	PixelGetColor, probeColorVP, 1415, 920 ;Void Plague
	PixelGetColor, probeColorFT, 1378, 920 ;Fortitude
	PixelGetColor, probeColorPWS, 1343, 920 ;Shield
	PixelGetColor, probeColorSHT, 334, 1036 ;Shoot
	PixelGetColor, probeColorRNW, 1513, 920 ;renew
	PixelGetColor, probeColorHF, 1326, 920 ;HolyFire
	PixelGetColor, probeColorCAST, 1270, 920 ;Casting  00FFF4
	PixelGetColor, probeColorIF, 1325, 920 ;Inner Fire
	PixelGetColor, probeColorHUM, 1309, 920 ;Homunculi BB99FF
	Send, 3
	Sleep, randLong
;                                `n
	MsgBox, HUM   %probeColorHUM%    CC   %probeColorCC% HP25  %probeColorHP25%   HP20    %probeColorHP20%  HP65 %probeColorHP65% `n  Penn   %probeColorPEN%    SWP   %probeColorSWP%     VP    %probeColorVP%    fort   %probeColorFT% `n  PWS   %probeColorPWS%   shoot   %probeColorSHT%    target hp %probeColorTHP%    renew  %probeColorRNW%   HF   %probeColorHF%  Casting  %probeColorCAST%   Inner   %probeColorIF%
Return

