#MaxThreadsPerHotkey 3
Random, rand, 150, 300
Random, randLong, 250, 450


Loop{
	Start:
	PixelGetColor, probeColorCC, 1251, 920 ;CombatCheck
	PixelGetColor, probeColorHP25, 1442, 920 ;HP25% warning
	PixelGetColor, probeColorHP20, 1462, 920 ;HP20% warning
	PixelGetColor, probeColorHP65, 1478, 920 ;HP65% warning
	PixelGetColor, probeColorCAST, 1270, 920 ;Casting check
	PixelGetColor, probeColorTHP, 1496, 920 ;target HP lower then 45 warning 00A9FF
	PixelGetColor, probeColorWRATH, 1425, 920
	PixelGetColor, probeColorMOON, 1411, 920	
	PixelGetColor, probeColorWILD, 1396, 920	
	PixelGetColor, probeColorFURY, 1383, 920 ; 0xFFF917
	PixelGetColor, probeColorSUN, 1369, 920 ; 
	PixelGetColor, probeColorSTAR, 1353, 920 ; E2A7FF
	PixelGetColor, probeColorTHORN, 1339, 920 ;35E3DA
	
		Sleep, rand
													;Cast order in and out of combat
		if (probeColorCAST="0xE8D8FF") {		;casting check
				
				Goto, Start	
			
		}else if (probeColorWILD="0x991569") {							
					Send, =
					
		}else if (probeColorHP65="0xFFA51D"){
					Send, 4 
				
		}else if (probeColorTHORN="0x35E3DA"){
					Send, - 
				}
	
		if (probeColorCC="0x1705FF") {	;main combat check , if combat use rotation53
			if (probeColorCAST="0xE8D8FF") {		;casting check
				Goto, Start	
			
			}else if (probeColorSTAR="0xE2A7FF") {							
					Send, 6
			
			}else if (probeColorMOON="0xFF35E1") {							
					Send, 3
				
			}else if (probeColorSUN="0x006CFF") {							
					Send, 5
									
			}else if (probeColorWRATH="0x03FFB5") {							
					Send, 2
				}
		}
			
		if (probeColorCC!="0x1705FF") {  ;out of combat check
			if (probeColorCAST="0xE8D8FF") {		;casting check
					Goto, Start	
					
			}else if (probeColorFURY="0xFFF917") {							
					Send, 4
				}
		}
	}



^3:: 	;used for finding color values
	PixelGetColor, probeColorCC, 1251, 920 ;CombatCheck
	PixelGetColor, probeColorHP25, 1442, 920 ;HP25% warning
	PixelGetColor, probeColorHP20, 1462, 920 ;HP20% warning
	PixelGetColor, probeColorHP65, 1478, 920 ;HP65% warning
	PixelGetColor, probeColorTHP, 1496, 920 ;target HP lower then 45 warning
	PixelGetColor, probeColorWRATH, 1425, 920
	PixelGetColor, probeColorMOON, 1411, 920	
	PixelGetColor, probeColorWILD, 1396, 920	
	PixelGetColor, probeColorFURY, 1383, 920 ; 0x17F9FF
	PixelGetColor, probeColorSUN, 1369, 920 ;
	PixelGetColor, probeColorSTAR, 1353, 920 ;
	PixelGetColor, probeColorTHORN, 1339, 920 
	
	Sleep, randLong
;                                `n

	MsgBox,sun    %probeColorSUN%   fury  %probeColorFURY%  Wrath   %probeColorWRATH%    Moon   %probeColorMOON%     wild %probeColorWILD%    star  %probeColorSTAR%   thorn   %probeColorTHORN% 
Return

