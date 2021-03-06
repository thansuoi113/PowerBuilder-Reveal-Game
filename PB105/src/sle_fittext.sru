$PBExportHeader$sle_fittext.sru
forward
global type sle_fittext from singlelineedit
end type
end forward

global type sle_fittext from singlelineedit
integer width = 1321
integer height = 116
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type
global sle_fittext sle_fittext

type prototypes
Function Long GetDC(long hWnd) Library "user32.dll"
Function Long ReleaseDC(long hWnd, uint hdc) Library "user32.dll"
Function Long PathCompactPathA(long hdc,ref string astext,long alen) Library "shlwapi.dll" alias for "PathCompactPathA;Ansi"
end prototypes

type variables
Public:

window		parentwin
long			correction=50

Private:

string		actualtext=''
long			thisdc=0



end variables

forward prototypes
public subroutine uf_setactualtext (string atext)
public subroutine uf_fittext ()
public function string uf_getactualtext ()
end prototypes

public subroutine uf_setactualtext (string atext);actualtext=atext
this.uf_fittext()
end subroutine

public subroutine uf_fittext ();string	temp

if not isvalid(parentwin) then
	beep(2)
	return
end if

thisDC=GetDC(handle(parentwin))
temp=actualtext
PathCompactPathA(thisDC,temp,UnitsToPixels(this.width,XUnitsToPixels!) +correction)
this.text=temp
ReleaseDC(handle(parentwin),thisDC)
end subroutine

public function string uf_getactualtext ();return actualtext
end function

event constructor;//Here you must set Parentwin
//
// i.e. this.parentwin=parent
end event

on sle_fittext.create
end on

on sle_fittext.destroy
end on

event modified;this.post uf_fittext()
end event

