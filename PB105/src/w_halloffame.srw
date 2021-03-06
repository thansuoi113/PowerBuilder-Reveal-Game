$PBExportHeader$w_halloffame.srw
forward
global type w_halloffame from window
end type
type cb_1 from commandbutton within w_halloffame
end type
type cb_2 from commandbutton within w_halloffame
end type
type dw_1 from datawindow within w_halloffame
end type
end forward

global type w_halloffame from window
integer width = 1673
integer height = 968
boolean titlebar = true
string title = "Hall Of Fame"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
cb_1 cb_1
cb_2 cb_2
dw_1 dw_1
end type
global w_halloffame w_halloffame

event open;string	temp,scores[]
long		tot,left,arow,i


RegistryGet(regbase,'HOF',RegMultiString!,scores)
for i=1 to Upperbound(scores)
	dw_1.ImportString(scores[i])
next
for i=Upperbound(scores) to 10
	dw_1.ImportString('Anonymous'+'~t'+'0'+'~t'+'0')
next


f_center_window(this)
temp=Message.StringParm
if temp='' or isnull(temp) then
	return
end if

tot =long(mid(temp,1,pos(temp,'^') -1))
left=long(mid(temp,pos(temp,'^') +1))

arow=dw_1.InsertRow(0)
dw_1.SetItem(arow,2,tot )
dw_1.SetItem(arow,3,left)
dw_1.SetItem(arow,4,9)

dw_1.Sort()
do while dw_1.Rowcount()>10
	dw_1.DeleteRow(dw_1.RowCount())
loop

arow=dw_1.Find('#4=9',1,dw_1.RowCount())
if arow>10 or arow=0 then
	close(this)
	return
end if

open(w_entername)
temp=Message.StringParm
dw_1.SetItem(arow,1,temp)


end event

on w_halloffame.create
this.cb_1=create cb_1
this.cb_2=create cb_2
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.cb_2,&
this.dw_1}
end on

on w_halloffame.destroy
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.dw_1)
end on

event close;string		scores[]
long			i


for i=1 to 10
	if i<=dw_1.RowCount() then
		scores[i]=dw_1.GetItemString(i,1)+'~t'+string(dw_1.GetItemNumber(i,2))+'~t'+string(dw_1.GetItemNumber(i,3))
	else
		scores[i]='Anonymous'+'~t'+'0'+'~t'+'0'
	end if
next
RegistrySet(regbase,'HOF',RegMultiString!,scores)

end event

type cb_1 from commandbutton within w_halloffame
integer x = 951
integer y = 784
integer width = 338
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Reset"
end type

event clicked;string		scores[]
long			i

if MessageBox('Bombs','Are you sure you want to reset Hall Of Fame?',Question!,YesNo!,2)=2 then return

for i=1 to 10
	scores[i]='Anonymous'+'~t'+'0'+'~t'+'0'
next
RegistrySet(regbase,'HOF',RegMultiString!,scores)

RegistryGet(regbase,'HOF',RegMultiString!,scores)
for i=1 to Upperbound(scores)
	dw_1.ImportString(scores[i])
next
for i=Upperbound(scores) to 10
	dw_1.ImportString('Anonymous'+'~t'+'0'+'~t'+'0')
next

end event

type cb_2 from commandbutton within w_halloffame
integer x = 1298
integer y = 784
integer width = 338
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OK"
boolean cancel = true
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_halloffame
integer x = 14
integer width = 1623
integer height = 764
integer taborder = 10
string title = "none"
string dataobject = "d_halloffame"
boolean border = false
boolean livescroll = true
end type

