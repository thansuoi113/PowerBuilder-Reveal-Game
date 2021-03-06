$PBExportHeader$w_preferences.srw
forward
global type w_preferences from window
end type
type sle_1 from sle_fittext within w_preferences
end type
type cb_4 from commandbutton within w_preferences
end type
type cb_3 from commandbutton within w_preferences
end type
type cb_2 from commandbutton within w_preferences
end type
type cb_1 from commandbutton within w_preferences
end type
type rb_3 from radiobutton within w_preferences
end type
type rb_2 from radiobutton within w_preferences
end type
type rb_1 from radiobutton within w_preferences
end type
type st_c10 from statictext within w_preferences
end type
type st_c9 from statictext within w_preferences
end type
type st_c8 from statictext within w_preferences
end type
type st_c7 from statictext within w_preferences
end type
type st_c6 from statictext within w_preferences
end type
type st_c5 from statictext within w_preferences
end type
type st_c4 from statictext within w_preferences
end type
type st_c3 from statictext within w_preferences
end type
type st_c2 from statictext within w_preferences
end type
type st_c1 from statictext within w_preferences
end type
type st_13 from statictext within w_preferences
end type
type st_12 from statictext within w_preferences
end type
type st_11 from statictext within w_preferences
end type
type st_10 from statictext within w_preferences
end type
type st_9 from statictext within w_preferences
end type
type st_8 from statictext within w_preferences
end type
type st_7 from statictext within w_preferences
end type
type st_6 from statictext within w_preferences
end type
type st_5 from statictext within w_preferences
end type
type st_4 from statictext within w_preferences
end type
type em_3 from editmask within w_preferences
end type
type em_2 from editmask within w_preferences
end type
type em_1 from editmask within w_preferences
end type
type st_3 from statictext within w_preferences
end type
type st_2 from statictext within w_preferences
end type
type st_1 from statictext within w_preferences
end type
type gb_1 from groupbox within w_preferences
end type
type gb_2 from groupbox within w_preferences
end type
type gb_3 from groupbox within w_preferences
end type
type gb_4 from groupbox within w_preferences
end type
end forward

global type w_preferences from window
integer width = 1550
integer height = 1080
boolean titlebar = true
string title = "Preferences"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "preferences.ico"
sle_1 sle_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
st_c10 st_c10
st_c9 st_c9
st_c8 st_c8
st_c7 st_c7
st_c6 st_c6
st_c5 st_c5
st_c4 st_c4
st_c3 st_c3
st_c2 st_c2
st_c1 st_c1
st_13 st_13
st_12 st_12
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
em_3 em_3
em_2 em_2
em_1 em_1
st_3 st_3
st_2 st_2
st_1 st_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
end type
global w_preferences w_preferences

event open;string	apath
ulong		temp

f_center_window(this)

//Read settings from registry
if RegistryGet(regbase,'Rows',RegULong!,temp)=1   then em_1.text=string(temp)
if RegistryGet(regbase,'Cells',ReguLong!,temp)=1  then em_2.text=string(temp)
if RegistryGet(regbase,'Colors',RegULong!,temp)=1 then em_3.text=string(temp)

if RegistryGet(regbase,'Color1',RegUlong!,temp)=1  then st_c1.backcolor =temp
if RegistryGet(regbase,'Color2',RegUlong!,temp)=1  then st_c2.backcolor =temp
if RegistryGet(regbase,'Color3',RegUlong!,temp)=1  then st_c3.backcolor =temp
if RegistryGet(regbase,'Color4',RegUlong!,temp)=1  then st_c4.backcolor =temp
if RegistryGet(regbase,'Color5',RegUlong!,temp)=1  then st_c5.backcolor =temp
if RegistryGet(regbase,'Color6',RegUlong!,temp)=1  then st_c6.backcolor =temp
if RegistryGet(regbase,'Color7',RegUlong!,temp)=1  then st_c7.backcolor =temp
if RegistryGet(regbase,'Color8',RegUlong!,temp)=1  then st_c8.backcolor =temp
if RegistryGet(regbase,'Color9',RegUlong!,temp)=1  then st_c9.backcolor =temp
if RegistryGet(regbase,'Color10',RegUlong!,temp)=1 then st_c10.backcolor=temp

if RegistryGet(regbase,'BGType',RegULong!,temp)=1 then
	if temp=1 then rb_1.checked=TRUE
	if temp=2 then rb_2.checked=TRUE
	if temp=3 then 
		rb_3.checked=TRUE
		if RegistryGet(regbase,'BGImage',RegString!,apath)=1 then
			sle_1.uf_setactualtext(apath)
		end if
	end if
end if
end event

on w_preferences.create
this.sle_1=create sle_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_c10=create st_c10
this.st_c9=create st_c9
this.st_c8=create st_c8
this.st_c7=create st_c7
this.st_c6=create st_c6
this.st_c5=create st_c5
this.st_c4=create st_c4
this.st_c3=create st_c3
this.st_c2=create st_c2
this.st_c1=create st_c1
this.st_13=create st_13
this.st_12=create st_12
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.em_3=create em_3
this.em_2=create em_2
this.em_1=create em_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.Control[]={this.sle_1,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.st_c10,&
this.st_c9,&
this.st_c8,&
this.st_c7,&
this.st_c6,&
this.st_c5,&
this.st_c4,&
this.st_c3,&
this.st_c2,&
this.st_c1,&
this.st_13,&
this.st_12,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.em_3,&
this.em_2,&
this.em_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.gb_4}
end on

on w_preferences.destroy
destroy(this.sle_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_c10)
destroy(this.st_c9)
destroy(this.st_c8)
destroy(this.st_c7)
destroy(this.st_c6)
destroy(this.st_c5)
destroy(this.st_c4)
destroy(this.st_c3)
destroy(this.st_c2)
destroy(this.st_c1)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.em_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
end on

type sle_1 from sle_fittext within w_preferences
integer x = 837
integer y = 308
integer width = 645
integer height = 68
integer taborder = 80
string text = "No File Selected"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;this.parentwin=parent
end event

type cb_4 from commandbutton within w_preferences
integer x = 1166
integer y = 872
integer width = 343
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_3 from commandbutton within w_preferences
integer x = 818
integer y = 872
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OK"
end type

event clicked;RegistrySet(regbase,'Rows',RegUlong!,long(em_1.text))
RegistrySet(regbase,'Cells',RegUlong!,long(em_2.text))
RegistrySet(regbase,'Colors',RegUlong!,long(em_3.text))

RegistrySet(regbase,'Color1',RegUlong!,long(st_c1.backcolor))
RegistrySet(regbase,'Color2',RegUlong!,long(st_c2.backcolor))
RegistrySet(regbase,'Color3',RegUlong!,long(st_c3.backcolor))
RegistrySet(regbase,'Color4',RegUlong!,long(st_c4.backcolor))
RegistrySet(regbase,'Color5',RegUlong!,long(st_c5.backcolor))
RegistrySet(regbase,'Color6',RegUlong!,long(st_c6.backcolor))
RegistrySet(regbase,'Color7',RegUlong!,long(st_c7.backcolor))
RegistrySet(regbase,'Color8',RegUlong!,long(st_c8.backcolor))
RegistrySet(regbase,'Color9',RegUlong!,long(st_c9.backcolor))
RegistrySet(regbase,'Color10',RegUlong!,long(st_c10.backcolor))

if rb_1.checked then RegistrySet(regbase,'BGType',RegUlong!,1)
if rb_2.checked then RegistrySet(regbase,'BGType',RegUlong!,2)
if rb_3.checked then 
	RegistrySet(regbase,'BGType',RegUlong!,3)
	RegistrySet(regbase,'BGImage',RegString!,sle_1.uf_getactualtext())
else
	RegistryDelete(regbase,'BGImage')
end if


close(parent)

if isvalid(w_reveal) then w_reveal.wf_drawgrid()

end event

type cb_2 from commandbutton within w_preferences
integer x = 14
integer y = 876
integer width = 361
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Default"
end type

event clicked;em_1.text='24'
em_2.text='14'
em_3.text='4'

st_c1.backcolor=RGB(255,0,0)
st_c2.backcolor=RGB(0,128,0)
st_c3.backcolor=RGB(0,0,255)
st_c4.backcolor=RGB(255,255,0)
st_c5.backcolor=15780518
st_c6.backcolor=67108864
st_c7.backcolor=67108864
st_c8.backcolor=67108864
st_c9.backcolor=67108864
st_c10.backcolor=67108864

rb_2.checked=TRUE

cb_3.event clicked()
end event

type cb_1 from commandbutton within w_preferences
integer x = 1385
integer y = 232
integer width = 101
integer height = 68
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;string	docname,apath

if not rb_3.checked then return
if GetFileOpenName('Select Image',apath,docname,'BMP',&
						 'Bitmap Image (*.BMP),*.BMP,'+ &
						 'GIF Image (*.GIF),*.GIF,'+ &
						 'JPEG Image (*.JPG),*.JPG')=1 then
	sle_1.uf_setactualtext(apath)
end if


end event

type rb_3 from radiobutton within w_preferences
integer x = 832
integer y = 232
integer width = 544
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "From File"
end type

type rb_2 from radiobutton within w_preferences
integer x = 832
integer y = 152
integer width = 599
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use default"
boolean checked = true
end type

type rb_1 from radiobutton within w_preferences
integer x = 832
integer y = 76
integer width = 599
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "No background"
end type

type st_c10 from statictext within w_preferences
integer x = 571
integer y = 736
integer width = 105
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;ChooseColor(this.backcolor)
end event

type st_c9 from statictext within w_preferences
integer x = 571
integer y = 656
integer width = 105
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;ChooseColor(this.backcolor)
end event

type st_c8 from statictext within w_preferences
integer x = 571
integer y = 576
integer width = 105
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;ChooseColor(this.backcolor)
end event

type st_c7 from statictext within w_preferences
integer x = 571
integer y = 496
integer width = 105
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;ChooseColor(this.backcolor)
end event

type st_c6 from statictext within w_preferences
integer x = 571
integer y = 416
integer width = 105
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;ChooseColor(this.backcolor)
end event

type st_c5 from statictext within w_preferences
integer x = 183
integer y = 736
integer width = 105
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;ChooseColor(this.backcolor)
end event

type st_c4 from statictext within w_preferences
integer x = 183
integer y = 656
integer width = 105
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 65535
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;ChooseColor(this.backcolor)
end event

type st_c3 from statictext within w_preferences
integer x = 183
integer y = 576
integer width = 105
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16711680
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;ChooseColor(this.backcolor)
end event

type st_c2 from statictext within w_preferences
integer x = 183
integer y = 496
integer width = 105
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 32768
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;ChooseColor(this.backcolor)
end event

type st_c1 from statictext within w_preferences
integer x = 183
integer y = 416
integer width = 105
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 255
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;ChooseColor(this.backcolor)
end event

type st_13 from statictext within w_preferences
integer x = 448
integer y = 744
integer width = 114
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "#10"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_12 from statictext within w_preferences
integer x = 448
integer y = 664
integer width = 114
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "#9"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_11 from statictext within w_preferences
integer x = 448
integer y = 584
integer width = 114
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "#8"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_10 from statictext within w_preferences
integer x = 448
integer y = 504
integer width = 114
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "#7"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_9 from statictext within w_preferences
integer x = 448
integer y = 424
integer width = 114
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "#6"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_8 from statictext within w_preferences
integer x = 50
integer y = 744
integer width = 114
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "#5"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_7 from statictext within w_preferences
integer x = 50
integer y = 664
integer width = 114
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "#4"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_preferences
integer x = 50
integer y = 584
integer width = 114
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "#3"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_preferences
integer x = 50
integer y = 504
integer width = 114
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "#2"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_preferences
integer x = 50
integer y = 424
integer width = 114
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "#1"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_3 from editmask within w_preferences
integer x = 398
integer y = 232
integer width = 274
integer height = 64
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "5"
boolean border = false
alignment alignment = right!
string mask = "00"
boolean spin = true
end type

type em_2 from editmask within w_preferences
integer x = 398
integer y = 152
integer width = 274
integer height = 64
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "14"
boolean border = false
alignment alignment = right!
string mask = "00"
boolean spin = true
end type

type em_1 from editmask within w_preferences
integer x = 398
integer y = 72
integer width = 274
integer height = 64
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "24"
boolean border = false
alignment alignment = right!
string mask = "00"
boolean spin = true
end type

type st_3 from statictext within w_preferences
integer x = 73
integer y = 236
integer width = 293
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Colors"
boolean focusrectangle = false
end type

type st_2 from statictext within w_preferences
integer x = 73
integer y = 156
integer width = 293
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cells"
boolean focusrectangle = false
end type

type st_1 from statictext within w_preferences
integer x = 73
integer y = 76
integer width = 293
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rows"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_preferences
integer x = 14
integer width = 741
integer height = 344
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dimensions"
end type

type gb_2 from groupbox within w_preferences
integer x = 14
integer y = 344
integer width = 741
integer height = 496
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Colors"
end type

type gb_3 from groupbox within w_preferences
integer x = 768
integer width = 754
integer height = 404
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Background"
end type

type gb_4 from groupbox within w_preferences
integer x = 14
integer y = 824
integer width = 1499
integer height = 36
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

