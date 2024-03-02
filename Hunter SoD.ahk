#MaxThreadsPerHotkey 3

Loop {
    Start:
    Random, rand, 150, 300
    Random, randLong, 250, 450
    GetColors()
    
    Sleep, rand

    ; Cast order in and out of combat
    if (probeColorCAST="0xE8D8FF") { ; casting check
        Goto, Start
    ; } else if (probeColorPHP="0xAABAAA") {
    ;     Send, +{s}
    } else if (probeColorLION="0xBAAB5D") {
        Send, +4
    }
    
    if (probeColorCC="0x1705FF") { ; main combat check, if combat use rotation53
        if (probeColorCAST="0xE8D8FF") {
            Goto, Start
        } else if (probeColorHSTL!="0x00008A") {
            Send, 0
        } else if (probeColorKILL="0x7F008C") && (probeColorTHP!="0x00A9FF") {
            Send, =
            Sleep, rand
        } else if (probeColorSRPT="0x925B00") && (probeColorRNG="0xFF13B1") && (probeColorTHP!="0x00A9FF") {
            Send, 4
            Sleep, rand
        } else if (probeColorCONC="0x355992") && (probeColorRNG="0xFF13B1") && (probeColorTRGT="0x7E9285") {
            Send, 8
            Sleep, rand
        } else if (probeColorARC="0x229200") && (probeColorRNG="0xFF13B1") {
            Send, 5
            Sleep, rand
        } else if (probeColorSHOOT="0xF7FBF7") && (probeColorRNG="0xFF13B1") {
            Send, 3
            Sleep, rand
        } else if (probeColorRNG="0x0300FF") && (probeColorASPT!="0x3E31BA") && (probeColorTRGT="0x7E9285") && (probeColorTHP!="0x00A9FF") {
            Send, +2
        } else if (probeColorMONG="0x61ECFF") && (probeColorRNG="0x0300FF") {
            Send, -
            Sleep, rand
        } else if (probeColorRPTR="0x03FFB5") && (probeColorRNG="0x0300FF") {
            Send, 2
            Sleep, rand
        } else if (probeColorMLEE="0x080C93") && (probeColorRNG="0x0300FF") {
            Send, 1
            Sleep, rand
        }
        
        Sleep, rand
    }
    
    if (probeColorCC!="0x1705FF") { ; out of combat check
        if (probeColorCAST="0xE8D8FF") { ; casting check
            Goto, Start
        ; } else if (probeColorASPT="0x3E31BA") || (probeColorASPT="0xBA8B22") {
        ;     Send, +3
        }
    }
}

$3:: ; used for finding color values
    GetColors()

    Send, 3
    ; Sleep, randLong
    ; `n

    ; MsgBox, WEAP %probeColorWEAP% Flank %probeColorKILL% Lion %probeColorLION% MONG %probeColorMONG% CHat %probeColorCHAT% Hostility %probeColorHSTL% THP %probeColorTHP% Casting %probeColorCAST% Pet HP %probeColorPHP% Aspect %probeColorASPT% Target %probeColorTRGT% CONC %probeColorCONC% Arcane %probeColorARC% CHIM %probeColorCHIM% CC %probeColorCC% HP25 %probeColorHP25% HP20 %probeColorHP20% HP65 %probeColorHP65% `n Ranged %probeColorRNG% SERPENT %probeColorSRPT% SHOOT %probeColorSHOOT% MELEE %probeColorMLEE% RAPTOR %probeColorRPTR%
Return

GetColors() {
    global probeColorCC, probeColorHP25, probeColorHP20, probeColorHP65, probeColorTHP
    global probeColorRNG, probeColorSRPT, probeColorSHOOT, probeColorMLEE, probeColorRPTR
    global probeColorARC, probeColorCHIM, probeColorCONC, probeColorTRGT, probeColorASPT
    global probeColorPHP, probeColorCAST, probeColorHSTL, probeColorMONG, probeColorLION
    global probeColorKILL, probeColorWEAP
    ; Repeated code block for getting colors
    PixelGetColor, probeColorCC, 1251, 920 ; CombatCheck
    PixelGetColor, probeColorHP25, 1442, 920 ; HP25% warning
    PixelGetColor, probeColorHP20, 1462, 920 ; HP20% warning
    PixelGetColor, probeColorHP65, 1478, 920 ; HP65% warning
    PixelGetColor, probeColorTHP, 1496, 920 ; target HP lower than 45 warning 00A9FF
    PixelGetColor, probeColorRNG, 1417, 920 ; Range check RANGE: MELEE:
    PixelGetColor, probeColorSRPT, 1384, 920 ; Serpent Sting
    PixelGetColor, probeColorSHOOT, 443, 1036 ; shoot
    PixelGetColor, probeColorMLEE, 346, 1036 ; Melee
    PixelGetColor, probeColorRPTR, 1402, 920 ; Raptor Strike
    PixelGetColor, probeColorARC, 1368, 920 ; Arcane Shot
    PixelGetColor, probeColorCHIM, 1354, 920 ; Chimera Shot
    PixelGetColor, probeColorCONC, 1337, 920 ; Concussive Shot
    PixelGetColor, probeColorTRGT, 1234, 920 ; Check for if Target of Target
    PixelGetColor, probeColorASPT, 1323, 920 ; Check for aspect
    PixelGetColor, probeColorPHP, 1497, 905 ; Pet Health 50%
    PixelGetColor, probeColorCAST, 1270, 920 ; Casting check
    PixelGetColor, probeColorHSTL, 1285, 920 ; Hostility Check
    PixelGetColor, probeColorMONG, 1417, 905 ; Mongoose Strike
    PixelGetColor, probeColorLION, 1402, 905 ; Lion Buff
    PixelGetColor, probeColorKILL, 1385, 904 ; Flanking Strike
    PixelGetColor, probeColorWEAP, 1369, 904 ; Weapon check
}
