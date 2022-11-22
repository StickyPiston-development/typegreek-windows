#NoEnv
#SingleInstance force
#MaxThreadsPerHotkey 5
SendMode, Input
diacritics := ["-", "+", "/", "\", "=", ":", "_", "(", ";", ""] ;[psili, dasia, acute, grave, circumflex, diaeresis, macron, breve, iotaSub]
vowels := [0x03B1, 0x03B5, 0x03B7, 0x03B9, 0x03BF, 0x03C5, 0x03C9] ;[alpha, epsilon, eta, iota, omicron, upsilon, omega]
MsgBox, % "Ctrl+Shift+Alt+H for help`nCtrl+Shift+Alt+T to toggle`nCtrl+Shift+Alt+E to edit diacritics`nEscape to quit"
IfExist, %A_ScriptDir%\diacritics.dat
	Loop, Read, %A_ScriptDir%\diacritics.dat
		diacritics[A_Index] := A_LoopReadLine
^+!h::
Gui, destroy
Gui, -MinimizeBox
Gui, font, s15
Gui, Add, Text, x12 y5 w70 h30, Letters:
Gui, Add, Text, x152 y5 w90 h30, Diacritics:
Gui, font, s10
Gui, Add, Text, x12 y29 w180 h405, % "A`nB`nG`nD`nE`nZ`nE+T`nT+H`nI`nK`nL`nM`nN`nX`nO`nP+I`nR`nS`ns*`nT`nU`nP+H`nC`nP+S`nO+M"
Gui, Add, Text, x90 y29 w180 h405, % "Alfa`nBeta`nGamma`nDelta`nEta`nDzeta`nEta`nTheta`nIota`nKappa`nLambda`nMu`nNu`nXi`nOmicron`nPi`nRho`nSigma`nSigma*`nTau`nUpsilon`nPhi`nChi`nPsi`nOmega"
Gui, font, s10
Gui, Add, Text, x152 y29 w120 h190, % "Psili:`nDasia:`nAcute:`nGrave:`nCircumflex:`nDiaeresis:`nMacron:`nBreve:`nSub. Iota:"
Gui, Add, Text, x278 y29 w40 h190, % diacritics[1] "`n" diacritics[2] "`n" diacritics[4] "`n" diacritics[3] "`n" diacritics[5] "`n" diacritics[6] "`n" diacritics[7] "`n" diacritics[8] "`n" diacritics[9]
Gui, font, s10
Gui, Add, Button, x189 y440 w100 h40, Change Diacritics
Gui, Add, Button, x12 y440 w90 h40 default, OK
Gui, Show, w300 h490, Help
return

ButtonChangeDiacritics:
send, ^+!e
return

ButtonOK:
GuiClose:
GuiEscape:
Gui, destroy
return

^+!e::
Gui, destroy
Gui, -MinimizeBox
Gui, font, s10
Gui, Add, Edit, vPsili Limit1 x120 y9 w50 h20, % diacritics[1]
Gui, Add, Edit, vDasia Limit1 x120 y29 w50 h20, % diacritics[2]
Gui, Add, Edit, vAcute Limit1 x120 y49 w50 h20, % diacritics[3]
Gui, Add, Edit, vGrave Limit1 x120 y69 w50 h20, % diacritics[4]
Gui, Add, Edit, vCircumflex Limit1 x120 y89 w50 h20, % diacritics[5]
Gui, Add, Edit, vDiaeresis Limit1 x120 y109 w50 h20, % diacritics[6]
Gui, Add, Edit, vMacron Limit1 x120 y129 w50 h20, % diacritics[7]
Gui, Add, Edit, vBreve Limit1 x120 y149 w50 h20, % diacritics[8]
Gui, Add, Edit, vSubIota Limit1 x120 y169 w50 h20, % diacritics[9]
Gui, font, s13
Gui, Add, Text, x12 y9 w100 h180, Psili
Gui, Add, Text, x12 y29 w100 h180, Dasia
Gui, Add, Text, x12 y49 w100 h180, Acute
Gui, Add, Text, x12 y69 w100 h180, Grave
Gui, Add, Text, x12 y89 w100 h180, Circumflex
Gui, Add, Text, x12 y109 w100 h180, Diaeresis
Gui, Add, Text, x12 y129 w100 h180, Macron
Gui, Add, Text, x12 y149 w100 h180, Breve
Gui, Add, Text, x12 y169 w100 h180, Sub. Iota
Gui, font, s10
Gui, Add, Text, x12 y193 w180 h180, Leave Empty to Disable
Gui, Add, Button, default x6 y219 w55 h30, Change
Gui, Add, Button, x63 y219 w55 h30, Default
Gui, Add, Button, x120 y219 w55 h30, Cancel
Gui, Show, w180 h262, Change Diacritics
return

ButtonCancel:
Gui, destroy
return

ButtonChange:
Gui, submit
if(Psili == Dasia OR Psili == Acute OR Psili == Grave OR Psili == Circumflex OR Psili == Diaeresis OR Psili == Macron OR Psili == Breve OR Psili == SubIota OR Dasia == Acute OR Dasia == Grave OR Dasia == Circumflex OR Dasia == Diaeresis OR Dasia == Macron OR Dasia == Breve OR Dasia == SubIota OR Acute == Grave OR Acute == Circumflex OR Acute == Diaeresis OR Acute == Macron OR Acute == Breve OR Acute == SubIota OR Grave == Circumflex OR Grave == Diaeresis OR Grave == Macron OR Grave == Breve OR Grave == SubIota OR Circumflex == Diaeresis OR Circumflex == Macron OR Circumflex == Breve OR Circumflex == SubIota OR Diaeresis == Macron OR Diaeresis == Breve OR Diaeresis == SubIota OR Macron == Breve OR Macron == SubIota OR Breve == SubIota)
{
	Msgbox, 0x10, Error, Two or more diacritics match
	send, ^+!e
}
else
{
	IfExist, %A_ScriptDir%\diacritics.dat
		FileDelete, %A_ScriptDir%\diacritics.dat
	FileAppend, %Psili%`n%Dasia%`n%Acute%`n%Grave%`n%Circumflex%`n%Diaeresis%`n%Macron%`n%Breve%`n%SubIota%, %A_ScriptDir%\diacritics.dat
	Reload
}
return

ButtonDefault:
GuiControl,, Psili, % "-"
GuiControl,, Dasia, % "+"
GuiControl,, Acute, % "/"
GuiControl,, Grave, % "\"
GuiControl,, Circumflex, % "="
GuiControl,, Diaeresis, % ":"
GuiControl,, Macron, % "_"
GuiControl,, Breve, % "("
GuiControl,, SubIota, % ";"
return

esc::exitapp

;----Alpha
+a::send(0x0391)
a::send(0x03B1)
;----Beta
+b::send(0x0392)
b::send(0x03B2)
;----Gamma
+g::send(0x0393)
g::send(0x03B3)
;----Delta
+d::send(0x0394)
d::send(0x03B4)
;
;----Epsilon/Eta
+e::
send(0x0395)
while(getkeystate("E", "P"))
	if(getkeystate("T", "P"))
	{
		send {BS}
		send(0x0397)
	}
return
e::
send(0x03B5)
while(getkeystate("E", "P"))
	if(getkeystate("T", "P"))
	{
		send {BS}
		send(0x03B7)
	}
return
;----Zeta
+z::send(0x0396)
z::send(0x03B6)
;----Iota
+i::send(0x0399)
i::send(0x03B9)
;----Kappa
+k::send(0x039A)
k::send(0x03BA)
;----Lambda
+l::send(0x039B)
l::send(0x03BB)
;----Mu
+m::
if(!getkeystate("O", "P"))
	send(0x039C)
return
m::
if(!getkeystate("O", "P"))
	send(0x03BC)
return
;----Nu
+n::send(0x039D)
n::send(0x03BD)
;----Xi
+x::send(0x039E)
x::send(0x03BE)
;----Omicron/Omega
+o::
send(0x039F)
while(getkeystate("O", "P"))
	if(getkeystate("M", "P"))
	{
		send {BS}
		send(0x03A9)
	}
return
o::
send(0x03BF)
while(getkeystate("O", "P"))
	if(getkeystate("M", "P"))
	{
		send {BS}
		send(0x03C9)
	}
return
;----Pi
p & i::
if(getkeystate("Shift", "P"))
	send(0x03A0)
else
	send(0x03C0)
return
;----Rho
+r::send(0x03A1)
r::send(0x03C1)
;----Sigma
+s::send(0x03A3)
!s::Send, {U+03C2}
s::
Send, {U+03C3}
Input, tmp, L1 V T2, {up}{down}{left}{right}{bs}{delete} `t`n
if(ErrorLevel == "EndKey:Space" OR ErrorLevel == "EndKey:Tab" OR ErrorLevel == "EndKey:Enter")
	Send, % "{BS 2}{U+03C2}{" SubStr(ErrorLevel, 8) "}"
return
;----Tau/Theta
+t::
if(!getkeystate("E", "P"))
{
	send(0x03A4)
	while(getkeystate("T", "P"))
		if(getkeystate("H", "P"))
		{
			send {BS 2}
			send(0x0398)
			return
		}
}
return
t::
if(!getkeystate("E", "P"))
{
	send(0x03C4)
	while(getkeystate("T", "P"))
		if(getkeystate("H", "P"))
		{
			send {BS 2}
			send(0x03B8)
			return
		}
}
return
;----Upsilon
+u::send(0x03A5)
u::send(0x03C5)
;----Phi
p & h::
if(getkeystate("Shift", "P"))
	send(0x03A6)
else
	send(0x03C6)
return
;----Chi
+c::send(0x03A7)
c::send(0x03C7)
;----Psi
p & s::
if(getkeystate("Shift", "P"))
	send(0x03A8)
else
	send(0x03C8)
return

isMod(modifier)
{
	global diacritics
	loop % diacritics.length()
		if(diacritics[A_Index] == modifier)
			return true
	return false
}

isCaps(hex)
{
	return hex < 0x03AC OR ((hex > 0x1F00 AND Mod(hex, 0x10) > 0x7) AND Mod(hex // 0x10, 0x10) != 0x7)
}

hasDiacritics(hex)
{
	global vowels
	SetFormat, integer, H
	if(isCaps(hex))
		hex += 0x20
	if(hex == 0x03C1)
		return true
	loop % vowels.length()
	{
		if(hex == vowels[A_Index])
			return true
	}
	return false
}

send(hex)
{
	if(hasDiacritics(hex))
	{
		mod := ""
		while(isMod(mod))
		{
			if(mod != "")
				Send, {BS 2}
			hex := changeCode(hex, mod)
			Send, % "{U+" hex "}"
			Input, mod, L1 V T2, {up}{down}{left}{right}{bs}{delete} `t`n
			if(ErrorLevel != "Max")
				return
		}
	}
	else
		Send, % "{U+" hex "}"
}

changeCode(hex, mod)
{
	global diacritics
	global vowels
	if(mod == "")
		return hex
	SetFormat, integer, H
	ret := hex
	if(isCaps(ret)) ; caps
	{
		if(ret == 0x03A1 OR ret == 0x1FEC)
			return (mod == diacritics[2] ? (ret == 0x03A1 ? 0x1FEC : 0x03A1) : ret)
		else if(ret < 0x03AC)
		{
			if(mod == diacritics[6] AND (ret > 0x03A9 OR ret == 0x0399 OR ret == 0x03A5))
				return changeCode(ret + 0x20, mod) - 0x20
			else if(ret > 0x03A9 AND mod != diacritics[5] AND mod != diacritics[9])
				return changeCode((ret == 0x03AA ? vowels[4] : vowels[6]) - 0x20, mod)
			else if((mod == diacritics[1] AND ret + 0x20 != vowels[6]) OR mod == diacritics[2] OR ((mod == diacritics[7] OR mod == diacritics[8]) AND (ret + 0x20 == vowels[1] OR ret + 0x20 == vowels[4] OR ret + 0x20 == vowels[6])) OR (mod == diacritics[9] AND (ret + 0x20 == vowels[1] OR ret + 0x20 == vowels[3] OR ret + 0x20 == vowels[7])))
				return changeCode(ret + 0x20, mod) + (mod == diacritics[9] ? 0x9 : 0x8)
			else if(mod == diacritics[3] OR mod == diacritics[4])
			{
				if(ret + 0x20 == vowels[1])
					return 0x1FBA + (mod == diacritics[3])
				else if(ret + 0x20 == vowels[2])
					return 0x1FC8 + (mod == diacritics[3])
				else if(ret + 0x20 == vowels[3])
					return 0x1FCA + (mod == diacritics[3])
				else if(ret + 0x20 == vowels[4])
					return 0x1FDA + (mod == diacritics[3])
				else if(ret + 0x20 == vowels[5])
					return 0x1FF8 + (mod == diacritics[3])
				else if(ret + 0x20 == vowels[6])
					return 0x1FEA + (mod == diacritics[3])
				else if(ret + 0x20 == vowels[7])
					return 0x1FFA + (mod == diacritics[3])
			}
		}
		else if(Mod(ret // 0x10, 0x10) < 0x7)
		{
			if(mod == diacritics[6] AND (Mod(ret // 0x10, 0x10) == 0x3 OR Mod(ret // 0x10, 0x10) == 0x5))
				return 0x03AA + (Mod(ret // 0x10, 0x10) == 0x5)
			else if(mod == diacritics[7] OR mod == diacritics[8])
				return changeCode(ret - 0x8, mod) + 0x8
			else if((mod == diacritics[1] AND !Mod(ret, 0x2)) OR (mod == diacritics[2] AND Mod(ret, 0x2)))
			{
				if(Mod(ret, 0x10) < 0xA)
					return changeCode(hex - 0x8, mod) - 0x20
				else if(Mod(ret // 0x10, 0x10) != 0x5 AND Mod(ret, 0x10) < 0xE)
				{
					ret -= (Mod(ret, 0x10) - 0x9) // 0x2
					if(!Mod(ret // 0x10, 0x10))
						return ret + 0xB0
					else if(Mod(ret // 0x10, 0x10) == 0x1)
						return ret + 0xAD
					else if(Mod(ret // 0x10, 0x10) == 0x2)
						return ret + 0xA0
					else if(Mod(ret // 0x10, 0x10) == 0x3)
						return ret + 0xA0
					else if(Mod(ret // 0x10, 0x10) == 0x4)
						return ret + 0xAD
					else if(Mod(ret // 0x10, 0x10) == 0x5)
						return ret + 0x90
					else if(Mod(ret // 0x10, 0x10) == 0x6)
						return ret + 0x90
				}
				else
					return vowels[Mod(ret // 0x10, 0x10) + 0x1] - 0x20
			}
			else if(!(mod == diacritics[1] AND Mod(ret // 0x10, 0x10) == 0x5))
				return changeCode(hex - 0x8, mod) + 0x8
		}
		else if(Mod(ret // 0x10, 0x10) < 0xB)
		{
			if((mod == diacritics[1] AND !Mod(ret, 0x2)) OR (mod == diacritics[2] AND Mod(ret, 0x2)))
			{
				if(Mod(ret // 0x10, 0x10) == 0x8)
					return 0x1FBC
				else if(Mod(ret // 0x10, 0x10) == 0x9)
					return 0x1FCC
				else if(Mod(ret // 0x10, 0x10) == 0xA)
					return 0x1FFC
			}
			else
				return changeCode(ret - 0x8, mod) + 0x8
		}
		else if(Mod(ret, 0x10) < 0xA AND Mod(ret // 0x10, 0x10) != 0xC AND Mod(ret // 0x10, 0x10) != 0xF)
		{
			if((Mod(ret, 0x10) == 0x8 AND mod == diacritics[8]) OR (Mod(ret, 0x10) == 0x9 AND mod == diacritics[7]) OR mod == diacritics[6])
				return changeCode(ret - 0x8, mod) - 0x20
			else if(mod != diacritics[5] AND !(mod == diacritics[9] AND Mod(ret // 0x10, 0x10) > 0xC))
				return changeCode(vowels[Mod(ret // 0x10, 0x10) == 0xB ? 1 : (Mod(ret // 0x10, 0x10) == 0xD ? 4 : 7)] - 0x20, mod)
		}
		else if(Mod(ret, 0x10) < 0xC)
		{
			if((Mod(ret // 0x10, 0x10) == 0x5 AND Mod(ret, 0x2) AND mod == diacritics[1]) OR mod == diacritics[9])
				return ret
			else if(mod == diacritics[3] AND !Mod(ret, 0x2))
				return ret + 0x1
			else if(mod == diacritics[4] AND Mod(ret, 0x2))
				return ret - 0x1
			else if(mod == diacritics[6] AND (Mod(ret // 0x10, 0x10) == 0xD OR Mod(ret // 0x10, 0x10) == 0xE))
				return vowels[7] - (Mod(ret // 0x10, 0x10) == 0xD ? 0x1F : 0x1E)
			else if(mod != diacritics[6])
			{
				if(Mod(ret // 0x10, 0x10) < 0xC)
					ret -= 0x4A
				else if(Mod(ret // 0x10, 0x10) < 0xD)
					ret -= 0x56
				else if(Mod(ret // 0x10, 0x10) < 0xE)
					ret -= 0x64
				else if(Mod(ret, 0x10) < 0xA)
					ret -= 0x80
				else if(Mod(ret // 0x10, 0x10) < 0xF)
					ret -= 0x70
				else
					ret -= 0x6E
				return changeCode(ret, mod) + (mod == diacritics[3] OR mod == diacritics[4] ? -0x20 : 0x8)
			}
		}
		else
		{
			if((mod == diacritics[1] OR mod == diacritics[2]) AND ret != 0x1FEC AND ret != 0x03A1)
				return ret - (ret == 0x1FFC ? 0x54 : 0x34) + (mod == diacritics[2])
			else if(mod == diacritics[9])
			{
				if(ret == 0x1FBC)
					return vowels[1] - 0x20
				else if(ret == 0x1FCC)
					return vowels[3] - 0x20
				else if(ret == 0x1FFC)
					return vowels[7] - 0x20
			}
		}
	}
	else if(ret < 0x03CA) ; no modifiers
	{
		if(ret == 0x03C1)
		{
			if(mod == diacritics[1])
				return 0x1FE4
			else if(mod == diacritics[2])
				return 0x1FE5
		}
		else if(mod == diacritics[1] OR mod == diacritics[2])
		{
			ret := 0x1F00
			if(mod == diacritics[2])
				ret++
			while(hex != vowels[A_Index])
				ret += 0x10
		}
		else if (mod == diacritics[3] OR mod == diacritics[4])
		{
			ret := 0x1F70
			if(mod == diacritics[3])
				ret++
			while(hex != vowels[A_Index])
				ret += 0x2
		}
		else if(mod == diacritics[5])
		{
			if(ret == vowels[2] OR ret == vowels[5])
				return ret
			ret := 0x1FB6
			while(hex != vowels[A_Index])
			{
				if(A_Index == 2 OR A_Index == 5)
					continue
				ret += 0x10
			}
		}
		else if(mod == diacritics[6] AND (ret == vowels[4] OR ret == vowels[6]))
			return 0x03CA + (ret == vowels[6])
		else if(mod == diacritics[9])
		{
			if(ret == vowels[1])
				return 0x1FB3
			else if(ret == vowels[3])
				return 0x1FC3
			else if(ret == vowels[7])
				return 0x1FF3
		}
		else if(mod == diacritics[7])
		{
			if(ret == vowels[1])
				return 0x1FB1
			else if(ret == vowels[4])
				return 0x1FD1
			else if(ret == vowels[6])
				return 0x1FE
		}
		else if(mod == diacritics[8])
		{
			if(ret == vowels[1])
				return 0x1FB0
			else if(ret == vowels[4])
				return 0x1FD0
			else if(ret == vowels[6])
				return 0x1F0
		}
	}
	else if(ret < 0x03CC) ; diaeresis
	{
		if(mod == diacritics[1])
			return 0x1F30 + (ret == 0x03CB ? 0x20 : 0x0)
		else if(mod == diacritics[2])
			return 0x1F31 + (ret == 0x03CB ? 0x20 : 0x0)
		else if(mod == diacritics[3])
			return 0x1FD3 + (ret == 0x03CB ? 0x10 : 0x0)
		else if(mod == diacritics[4])
			return 0x1FD2 + (ret == 0x03CB ? 0x10 : 0x0)
		else if(mod == diacritics[5])
			return 0x1FD7 + (ret == 0x03CB ? 0x10 : 0x0)
		else if(mod == diacritics[6])
			return ret == 0x03CA ? vowels[4] : vowels[6]
		else if(mod == diacritics[7])
			return 0x1FD1 + (ret == 0x03CB ? 0x10 : 0x0)
		else if(mod == diacritics[8])
			return 0x1FD0 + (ret == 0x03CB ? 0x10 : 0x0)
	}
	else if(Mod(ret // 0x10, 0x10) < 0x7 AND Mod(ret, 0x10) < 0x6) ;1F00-1F65
	{
		if(mod == diacritics[9])
		{
			if(Mod(ret // 0x10, 0x10) == 0x0)
				return ret + 0x80
			else if(Mod(ret // 0x10, 0x10) == 0x2)
				return ret + 0x70
			else if(Mod(ret // 0x10, 0x10) == 0x6)
				return ret + 0x40
		}
		else if(mod == diacritics[7])
		{
			if(Mod(ret // 0x10, 0x10) == 0x0)
				return 0x1FB1
			else if(Mod(ret // 0x10, 0x10) == 0x3)
				return 0x1FD1
			else if(Mod(ret // 0x10, 0x10) == 0x5)
				return 0x1FE1
		}
		else if(mod == diacritics[8])
		{
			if(Mod(ret // 0x10, 0x10) == 0x0)
				return 0x1FB0
			else if(Mod(ret // 0x10, 0x10) == 0x3)
				return 0x1FD0
			else if(Mod(ret // 0x10, 0x10) == 0x5)
				return 0x1FE0
		}
		else if(mod == diacritics[6] AND (Mod(hex // 0x10, 0x10) == 0x3 OR Mod(hex // 0x10, 0x10) == 0x5))
		{
			if(Mod(ret, 0x10) < 0x2)
				return Mod(ret // 0x10, 0x10) == 0x3 ? 0x03CA : 0x03CB
			else if(Mod(ret, 0x10) < 0x4)
				ret := 0x1FD2
			else if(Mod(ret, 0x10) < 0x6)
				ret := 0x1FD3
			return ret + (Mod(hex // 0x10, 0x10) == 0x3 ? 0x0 : 0x10)
		}
		else if(Mod(ret, 0x10) == 0x0)
		{
			if(mod == diacritics[1])
			{
				ret := 0x1F00
				Loop
				{
					if(hex == ret)
						return vowels[A_Index]
					ret += 0x10
				}
			}
			else if(mod == diacritics[2])
				return ret + 0x1
			else if(mod == diacritics[4])
				return ret + 0x2
			else if(mod == diacritics[3])
				return ret + 0x4
			else if(mod == diacritics[5] AND Mod(ret // 0x10, 0x10) != 0x1 AND Mod(ret // 0x10, 0x10) != 0x4)
				return ret + 0x6
		}
		else if(Mod(ret, 0x10) == 0x1)
		{
			if(mod == diacritics[2])
			{
				ret := 0x1F01
				Loop
				{
					if(hex == ret)
						return vowels[A_Index]
					ret += 0x10
				}
			}
			else if(mod == diacritics[1])
				return ret - 0x1
			else if(mod == diacritics[4])
				return ret + 0x2
			else if(mod == diacritics[3])
				return ret + 0x4
			else if(mod == diacritics[5] AND Mod(ret // 0x10, 0x10) != 0x1 AND Mod(ret // 0x10, 0x10) != 0x4)
				return ret + 0x6
		}
		else if(Mod(ret, 0x10) == 0x2)
		{
			if(mod == diacritics[1])
				return 0x1F70 + Mod(ret // 0x10, 0x10) * 0x2
			else if(mod == diacritics[2])
				return ret + 0x1
			else if(mod == diacritics[4])
				return ret - 0x2
			else if(mod == diacritics[3])
				return ret + 0x2
			else if(mod == diacritics[5] AND Mod(ret // 0x10, 0x10) != 0x1 AND Mod(ret // 0x10, 0x10) != 0x4)
				return ret + 0x4
		}
		else if(Mod(ret, 0x10) == 0x3)
		{
			if(mod == diacritics[2])
				return 0x1F70 + Mod(ret // 0x10, 0x10) * 2
			else if(mod == diacritics[1])
				return ret - 0x1
			else if(mod == diacritics[4])
				return ret - 0x2
			else if(mod == diacritics[3])
				return ret + 0x2
			else if(mod == diacritics[5] AND Mod(ret // 0x10, 0x10) != 0x1 AND Mod(ret // 0x10, 0x10) != 0x4)
				return ret + 0x4
		}
		else if(Mod(ret, 0x10) == 0x4)
		{
			if(mod == diacritics[1])
				return 0x1F71 + Mod(ret // 0x10, 0x10) * 2
			else if(mod == diacritics[2])
				return ret + 0x1
			else if(mod == diacritics[4])
				return ret - 0x2
			else if(mod == diacritics[3])
				return ret - 0x4
			else if(mod == diacritics[5] AND Mod(ret // 0x10, 0x10) != 0x1 AND Mod(ret // 0x10, 0x10) != 0x4)
				return ret + 0x2
		}
		else
		{
			if(mod == diacritics[2])
				return 0x1F71 + Mod(ret // 0x10, 0x10) * 2
			else if(mod == diacritics[1])
				return ret - 0x1
			else if(mod == diacritics[4])
				return ret - 0x2
			else if(mod == diacritics[3])
				return ret - 0x4
			else if(mod == diacritics[5] AND Mod(ret // 0x10, 0x10) != 0x1 AND Mod(ret // 0x10, 0x10) != 0x4)
				return ret + 0x2
		}
	}
	else if(Mod(ret // 0x10, 0x10) < 0x7 AND Mod(ret, 0x10) < 0x8) ;1F06-1F67
	{
		if(mod == diacritics[3])
			return ret - 2
		else if(mod == diacritics[4])
			return ret - 4
		else if(mod == diacritics[5])
			return ret - 6
		else if(mod == diacritics[9])
		{
			if(Mod(ret // 0x10, 0x10) == 0x0)
				return ret + 0x80
			if(Mod(ret // 0x10, 0x10) == 0x2)
				return ret + 0x70
			if(Mod(ret // 0x10, 0x10) == 0x6)
				return ret + 0x40
		}
		else if(mod == diacritics[6])
		{
			if(Mod(ret // 0x10, 0x10) == 0x3)
				return 0x03CA
			if(Mod(ret // 0x10, 0x10) == 0x5)
				return 0x03CB
		}
		else if(mod == diacritics[7])
		{
			if(Mod(ret // 0x10, 0x10) == 0x0)
				return 0x1FB1
			if(Mod(ret // 0x10, 0x10) == 0x3)
				return 0x1FD1
			if(Mod(ret // 0x10, 0x10) == 0x5)
				return 0x1FE1
		}
		else if(mod == diacritics[8])
		{
			if(Mod(ret // 0x10, 0x10) == 0x0)
				return 0x1FB0
			if(Mod(ret // 0x10, 0x10) == 0x3)
				return 0x1FD0
			if(Mod(ret // 0x10, 0x10) == 0x5)
				return 0x1FE0
		}
		else if(Mod(ret, 0x10) == 0x6)
		{
			if(mod == diacritics[2])
				return ret + 1
			if(mod == diacritics[1])
			{
				if(ret == 0x1F06)
					return ret + 0xB0
				if(ret <= 0x1F36)
					return ret + 0xA0
				if(ret <= 0x1F66)
					return ret + 0x90
			}
		}
		else
		{
			if(mod == diacritics[1])
				return ret - 1
			if(mod == diacritics[2])
			{
				if(ret == 0x1F07)
					return ret + 0xAF
				if(ret <= 0x1F37)
					return ret + 0x9F
				if(ret <= 0x1F67)
					return ret + 0x8F
			}
		}
	}
	else if(Mod(ret // 0x10, 0x10) == 0x7) ;1F70-1F7D
	{
		if(mod == diacritics[1])
			return 0x1F04 + 0x10 * (Mod(ret, 0x10) // 0x2) - (Mod(ret, 0x2) ? 0 : 2)
		if(mod == diacritics[2])
			return 0x1F05 + 0x10 * (Mod(ret, 0x10) // 0x2) - (Mod(ret, 0x2) ? 0 : 2)
		if(mod == diacritics[5] AND !(ret == 0x1F72 OR ret == 0x1F73 OR ret == 0x1F78 OR ret == 0x1F79))
		{
			if(Mod(ret, 0x10) < 0x2)
				return 0x1FB6
			else if(Mod(ret, 0x10) < 0x6)
				return 0x1FC6
			else if(Mod(ret, 0x10) < 0x8)
				return 0x1FD6
			else if(Mod(ret, 0x10) < 0xC)
				return 0x1FE6
			else if(Mod(ret, 0x10) < 0xE)
				return 0x1FF6
		}
		else if(mod == diacritics[6])
		{
			if(ret == 0x1F76 OR ret == 0x1F77)
				return ret + 0x5C
			else if(ret == 0x1F7A OR ret == 0x1F7B)
				return ret + 0x68
		}
		else if(mod == diacritics[7])
		{
			if(ret == 0x1F70 OR ret == 0x1F71)
				return 0x1FB1
			else if(ret == 0x1F76 OR ret == 0x1F77)
				return 0x1FD1
			else if(ret == 0x1F7A OR ret == 0x1F7B)
				return 0x1FE1
		}
		else if(mod == diacritics[8])
		{
			if(ret == 0x1F70 OR ret == 0x1F71)
				return 0x1FB0
			else if(ret == 0x1F76 OR ret == 0x1F77)
				return 0x1FD0
			else if(ret == 0x1F7A OR ret == 0x1F7B)
				return 0x1FE0
		}
		else if(Mod(ret, 0x2))
		{
			if(mod == diacritics[3])
				return vowels[(ret - 0x1F70) // 0x2 + 0x1]
			else if(mod == diacritics[4])
				return ret - 0x1
			else if(mod == diacritics[9])
			{
				if(ret == 0x1F71)
					return 0x1FB4
				if(ret == 0x1F75)
					return 0x1FC4
				if(ret == 0x1F7D)
					return 0x1FF4
			}
		}
		else
		{
			if(mod == diacritics[4])
				return vowels[(ret - 0x1F70) // 0x2 + 0x1]
			else if(mod == diacritics[3])
				return ret + 0x1
			else if(mod == diacritics[9])
			{
				if(ret == 0x1F70)
					return 0x1FB2
				if(ret == 0x1F74)
					return 0x1FC2
				if(ret == 0x1F7C)
					return 0x1FF2
			}
		}
	}
	else if(Mod(ret // 0x10, 0x10) < 0xB AND Mod(ret, 0x10) < 0x8) ;1F80-1FA7
	{
		if(mod == diacritics[3])
		{
			if(Mod(ret, 0x10) < 0x2)
				return ret + 0x4
			if(Mod(ret, 0x10) < 0x4)
				return ret + 0x2
			if(Mod(ret, 0x10) < 0x6)
				return ret - 0x4
			if(Mod(ret, 0x10) < 0x8)
				return ret - 0x2
		}
		else if(mod == diacritics[4])
		{
			if(Mod(ret, 0x10) < 0x2)
				return ret + 0x2
			if(Mod(ret, 0x10) < 0x4)
				return ret - 0x2
			if(Mod(ret, 0x10) < 0x6)
				return ret - 0x2
			if(Mod(ret, 0x10) < 0x8)
				return ret - 0x4
		}
		else if(mod == diacritics[5])
		{
			if(Mod(ret, 0x10) > 0x5)
				return ret - 0x6
			if(Mod(ret, 0x10) > 0x3)
				return ret + 0x2
			if(Mod(ret, 0x10) > 0x1)
				return ret + 0x4
			return ret + 0x6
		}
		else if(mod == diacritics[9])
		{
			if(Mod(ret // 0x10, 0x10) == 0x8)
				return ret - 0x80
			if(Mod(ret // 0x10, 0x10) == 0x9)
				return ret - 0x70
			if(Mod(ret // 0x10, 0x10) == 0xA)
				return ret - 0x40
		}
		else if(mod == diacritics[7] AND Mod(ret // 0x10, 0x10) == 0x8)
			return 0x1FB1
		else if(mod == diacritics[8] AND Mod(ret // 0x10, 0x10) == 0x8)
			return 0x1FB0
		else if(Mod(ret, 0x2))
		{
			if(mod == diacritics[2])
			{
				if(Mod(ret, 0x10) == 0x1)
					ret += 0x32
				else
					ret += 0x2F
				if(Mod(ret, 0x10) > 0x5)
					ret++
				if(Mod(hex // 0x10, 0x10) == 0xA)
					ret += 0x20
			}
			else if(mod == diacritics[1])
				return ret - 0x1
		}
		else
		{
			if(mod == diacritics[1])
			{
				if(Mod(ret, 0x10) == 0x0)
					ret += 0x33
				else
					ret += 0x30
				if(Mod(ret, 0x10) > 0x5)
					ret++
				if(Mod(hex // 0x10, 0x10) == 0xA)
					ret += 0x20
			}
			else if(mod == diacritics[2])
				return ret + 0x1
		}
	}
	else if(Mod(ret, 0x10) < 0x8) ;1FB0-1FF7
	{
		if((ret == 0x1FE4 OR ret == 0x1FE5) AND (mod == diacritics[1] OR mod == diacritics[2])) ; rho
			return (ret - 0x1FE4 ? (mod == diacritics[1] ? 0x1FE4 : 0x03C1) : (mod == diacritics[2] ? 0x1FE5 : 0x03C1))
		else if(Mod(ret, 0x10) < 0x2)
		{
			if(mod == diacritics[5])
				return ret + (Mod(ret, 0x10) ? 0x5 : 0x6)
			if(mod == diacritics[6] AND Mod(ret // 0x10, 0x10) != 0xB)
				return Mod(ret // 0x10, 0x10) == 0xD ? 0x03CA : 0x03CB
			if(Mod(ret // 0x10, 0x10) == 0xB)
			{
				if(mod == diacritics[1])
					return 0x1F00
				if(mod == diacritics[2])
					return 0x1F01
				if(mod == diacritics[3])
					return 0x1F71
				if(mod == diacritics[4])
					return 0x1F70
				if(mod == diacritics[9])
					return 0x1FB3
			}
			if(Mod(ret, 0x10))
			{
				if(mod == diacritics[7])
				{
					if(ret == 0x1FB1)
						return vowels[1]
					if(ret == 0x1FD1)
						return vowels[4]
					if(ret == 0x1FE1)
						return vowels[6]
				}
				if(mod == diacritics[8])
					return ret - 1
			}
			else
			{
				if(mod == diacritics[8])
				{
					if(ret == 0x1FB0)
						return vowels[1]
					if(ret == 0x1FD0)
						return vowels[4]
					if(ret == 0x1FE0)
						return vowels[6]
				}
				if(mod == diacritics[7])
					return ret + 1
			}
		}
		else if((Mod(ret // 0x10, 0x10) == 0xD OR Mod(ret // 0x10, 0x10) == 0xE) AND (Mod(ret, 0x10) < 0x4 OR Mod(ret, 0x10) == 0x7))
		{
			if(mod == diacritics[1] OR mod == diacritics[2])
				return (Mod(ret // 0x10, 0x10) == 0xD ? 0x1F36 : 0x1F56) + (Mod(ret, 0x10) < 0x4 ? Mod(ret, 0x10) * 0x2 - 0x8 : 0x0) + (mod == diacritics[2])
			else if(mod == diacritics[5])
				return Mod(ret, 0x10) == 0x7 ? (ret == 0x1FD7 ? 0x03CA : 0x03CB) : (ret + (Mod(ret, 0x10) == 0x2 ? 0x5 : 0x4))
			else if(mod == diacritics[6])
				return ret - (Mod(ret, 0x10) == 0x7 ? 0x1 : (Mod(ret // 0x10, 0x10) == 0xD ? 0x5C : 0x68))
			else if(mod == diacritics[7] OR mod == diacritics[8])
				return ret - (Mod(ret, 0x10) == 0x7 ? 0x6 : (Mod(ret, 0x10) == 0x2 ? 0x1 : 0x2)) - (mod == diacritics[8])
			else if(Mod(ret, 0x10) == 0x2)
			{
				if(mod == diacritics[4])
					return ret == 0x1FD2 ? 0x03CA : 0x03CB
				else if(mod == diacritics[3])
					return ret + 0x1
			}
			else
			{
				if(Mod(ret, 0x10) == 0x7)
					return ret - (mod == diacritics[3] ? 0x4 : (mod == diacritics[4] ? 0x5 : 0x0))
				else if(mod == diacritics[3])
					return ret == 0x1FD3 ? 0x03CA : 0x03CB
				else if(mod == diacritics[4])
					return ret - 0x1
			}
		}
		else if(Mod(ret, 0x10) < 0x5)
		{
			if(mod == diacritics[3])
			{
				if(Mod(ret, 0x10) == 0x2)
					return ret + 0x2
				else if(Mod(ret, 0x10) == 0x3)
					return ret + 0x1
				else if(Mod(ret, 0x10) == 0x4)
					return ret - 0x1
			}
			else if(mod == diacritics[4])
			{
				if(Mod(ret, 0x10) == 0x2)
					return ret + 0x1
				else if(Mod(ret, 0x10) == 0x3)
					return ret - 0x1
				else if(Mod(ret, 0x10) == 0x4)
					return ret - 0x2
			}
			else if(mod == diacritics[5])
				return ret + (Mod(ret, 0x10) == 0x2 ? 0x5 : (Mod(ret, 0x10) == 0x3 ? 0x4 : 0x3))
			else if((mod == diacritics[7] OR mod == diacritics[8]) AND Mod(ret // 0x10, 0x10) == 0xB)
				return 0x1FB0 + (mod == diacritics[7])
			else if(mod == diacritics[9])
			{
				if(Mod(ret, 0x10) == 0x3)
				{
					if(ret == 0x1FB3)
						return vowels[1]
					else if(ret == 0x1FC3)
						return vowels[3]
					else if(ret == 0x1FF3)
						return vowels[7]
				}
				else if(Mod(ret, 0x10) == 0x4)
					ret--
				if(Mod(ret // 0x10, 0x10) == 0xB)
					return ret - 0x42
				else if(Mod(ret // 0x10, 0x10) == 0xC)
					return ret - 0x4E
				else if(Mod(ret // 0x10, 0x10) == 0xF)
					return ret - 0x76
			}
			else if(Mod(ret // 0x10, 0x10) == 0xF)
				ret -= 0x20
			if(mod == diacritics[1] OR mod == diacritics[2])
				return ret - (Mod(ret, 0x10) == 0x3 ? 0x33 : 0x30) + (mod == diacritics[2])
		}
		else if(Mod(ret, 0x10) == 0x6)
		{
			if(!(mod == diacritics[6] OR mod == diacritics[7] OR mod == diacritics[8] OR mod == diacritics[9]))
			{
				if(ret == 0x1FB6)
					ret -= 0x10
				if(ret < 0x1FE6)
					ret -= 0x10
				if(mod == diacritics[1] OR mod == diacritics[2])
					return ret - (mod == diacritics[1] ? 0x90 : 0x8F)
				else if(mod == diacritics[3] OR mod == diacritics[4])
					return 0x1F70 + (Mod(ret // 0x10, 0x10) - 0x9) * 2 + (mod == diacritics[3])
				else if(mod == diacritics[5])
					return vowels[Mod(ret // 0x10, 0x10) - 0x8]
			}
			else if((mod == diacritics[6] AND (ret == 0x1FD6 OR ret == 0x1FE6)) OR (mod == diacritics[9] AND !(ret == 0x1FD6 OR ret == 0x1FE6)))
				return ret + 1
			else if((mod == diacritics[7] OR mod == diacritics[8]) AND !(ret == 0x1FC6 OR ret == 0x1FF6))
				return ret - 0x5 - (mod == diacritics[8])
		}
		else if(mod == diacritics[1] OR mod == diacritics[2])
		{
			if(ret == 0x1FF7)
				ret -= 0x20
			return ret - (mod == diacritic[1] ? 0x31 : 0x30)
		}
		else if(mod == diacritics[3] OR mod == diacritics[4])
			return ret - (mod == diacritics[3] ? 0x3 : 0x5)
		else if(mod == diacritics[5])
			return ret - 0x4
		else if(mod == diacritics[7] OR mod == diacritics[8])
			return ret - (mod == diacritics[7] ? 0x6 : 0x7)
		else if(mod == diacritics[9])
			return ret - 1
	}
	return ret
}

^+!t::Suspend, Toggle