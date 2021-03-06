$PBExportHeader$w_reveal.srw
forward
global type w_reveal from window
end type
type st_1 from statictext within w_reveal
end type
type dw_1 from datawindow within w_reveal
end type
end forward

global type w_reveal from window
integer width = 1495
integer height = 952
boolean titlebar = true
string title = "Reveal"
string menuname = "m_reveal"
boolean controlmenu = true
long backcolor = 67108864
boolean center = true
st_1 st_1
dw_1 dw_1
end type
global w_reveal w_reveal

type variables
datastore	near
long			rows,cells,colors,color[10]
long			his_index=0
string		astep[]
any			history[]
long			total_cells,cells_left
long			uncover_cells[]

boolean		gameover=FALSE
long			score=0
end variables

forward prototypes
public function long wf_getcolor (long arow, long acell)
public subroutine wf_getnear (long arow, long acell)
public subroutine wf_undo ()
public subroutine wf_redo ()
public subroutine wf_drawgrid ()
public function boolean wf_isgameover ()
end prototypes

public function long wf_getcolor (long arow, long acell);string	temp

if arow>rows or arow<1 or acell>cells or acell<1 then return -1
temp  =dw_1.Object.cells[arow]
return long(mid(temp,acell,1))

end function

public subroutine wf_getnear (long arow, long acell);long		i,j,acolor,rownear

acolor=wf_getcolor(arow,acell)
if acolor=0 then return

for j=acell -1 to acell +1
	if j<1 or j>cells then continue
	for i=arow -1 to arow +1
		if i<1 or i>rows  then continue
		if ((i=arow -1) and (j=acell -1)) or &
		   ((i=arow -1) and (j=acell +1)) or &
			((i=arow +1) and (j=acell -1)) or &
			((i=arow +1) and (j=acell +1)) then continue
		if wf_getcolor(i,j)=acolor then
			rownear=near.Find('arow='+string(i)+' and acell='+string(j),1,near.RowCount())
			if rownear>0 then continue
			rownear=near.InsertRow(0)
			near.SetItem(rownear,'arow' ,i)
			near.SetItem(rownear,'acell',j)
			wf_getnear(i,j)
		end if
	next
next
		
end subroutine

public subroutine wf_undo ();if his_index=0 then return

astep=history[his_index]
dw_1.Object.cells.Primary.Current[1,rows]=astep
cells_left +=uncover_cells[his_index]
st_1.event ue_refresh()
his_index --


end subroutine

public subroutine wf_redo ();if his_index>Upperbound(history) then return

astep=history[his_index]
dw_1.Object.cells.Primary.Current[1,rows]=astep
cells_left -=uncover_cells[his_index]
his_index ++

end subroutine

public subroutine wf_drawgrid ();string	mod_str,colorstr,acell,pencol,penstyle,apath
long		i,j,ax,title_height,randgen
any		empty[]
ulong		temp


//Read Settings
rows  =24
cells =14
colors=5

color[1]=RGB(255,0,0)
color[2]=RGB(0,128,0)
color[3]=RGB(0,0,255)
color[4]=RGB(255,255,0)
color[5]=15780518

if RegistryGet(regbase,'Rows',RegULong!,temp)=1   then rows  =temp
if RegistryGet(regbase,'Cells',ReguLong!,temp)=1  then cells =temp
if RegistryGet(regbase,'Colors',RegULong!,temp)=1 then colors=temp

if RegistryGet(regbase,'Color1',RegUlong!,temp)=1  then color[ 1]=temp
if RegistryGet(regbase,'Color2',RegUlong!,temp)=1  then color[ 2]=temp
if RegistryGet(regbase,'Color3',RegUlong!,temp)=1  then color[ 3]=temp
if RegistryGet(regbase,'Color4',RegUlong!,temp)=1  then color[ 4]=temp
if RegistryGet(regbase,'Color5',RegUlong!,temp)=1  then color[ 5]=temp
if RegistryGet(regbase,'Color6',RegUlong!,temp)=1  then color[ 6]=temp
if RegistryGet(regbase,'Color7',RegUlong!,temp)=1  then color[ 7]=temp
if RegistryGet(regbase,'Color8',RegUlong!,temp)=1  then color[ 8]=temp
if RegistryGet(regbase,'Color9',RegUlong!,temp)=1  then color[ 9]=temp
if RegistryGet(regbase,'Color10',RegUlong!,temp)=1  then color[10]=temp

dw_1.DataObject='d_grid'
dw_1.SetRedraw(FALSE)
penstyle='0'

//Create grid
ax=0
for i=1 to cells
	colorstr="0~tCase( long(mid(cells,"+string(i)+",1)) "+&
	         " when 1 then "+string(color[1])+&
				" when 2 then "+string(color[2])+&
				" when 3 then "+string(color[3])+&
				" when 4 then "+string(color[4])+&
				" when 5 then "+string(color[5])+&
				" when 6 then "+string(color[6])+&
				" when 7 then "+string(color[7])+&
				" when 8 then "+string(color[8])+") "

	pencol  =colorstr
	mod_str+='create rectangle(band=detail x="'+string(ax)+'" y="0" height="76" width="80" '+'name=cell_'+string(i,'00')+' '+&
	         'visible="1~tIf(long(mid(cells,'+string(i)+',1))=0,0,1)" brush.hatch="6" brush.color="'+colorstr+'" pen.style="'+penstyle+'" '+&
				'pen.width="0" pen.color="'+pencol+'"  background.mode="2" background.color="536870912" ) '
	
	ax=ax+80
next

dw_1.Modify(mod_str)
dw_1.Modify('DataWindow.Detail.Height=76')

randgen=year(today())+month(today())*day(today())+hour(now())*minute(now())+second(now())+cpu()
randomize(randgen)

for i=1 to rows
	dw_1.InsertRow(0)
	acell=''
	for j=1 to cells
		acell+=string(rand(colors))
	next
	dw_1.SetItem(i,1,acell)
next
dw_1.SetRedraw(TRUE)

dw_1.height=rows*(long(dw_1.Describe('Datawindow.Detail.Height'))+1)
dw_1.width =ax

if RegistryGet(regbase,'BGType',RegULong!,temp)<>1 then temp=2
if temp=2 or temp=3 then
	dw_1.Modify('p_1.width=' +string(dw_1.Width))
	dw_1.Modify('p_1.height='+string(dw_1.Height))
	dw_1.SetPosition('p_1','Background',TRUE)
	if temp=3 then
		RegistryGet(regbase,'BGImage',RegString!,apath)
		if FileExists(apath) then dw_1.Modify("p_1.FileName='"+apath+"'")
	end if
else
	dw_1.Modify('DESTROY p_1')
end if

title_height=this.height - this.Workspaceheight()
this.height=dw_1.y +dw_1.height+title_height -20
this.width =dw_1.width +32

history[]=empty[]
his_index=0

total_cells=rows*cells
cells_left =total_cells
st_1.event ue_refresh()
gameover=FALSE
score=0
end subroutine

public function boolean wf_isgameover ();//Returns TRUE if no more valid moves
string	cell1,cell2
long		i,j,arow,acolumn

arow   =rows
acolumn=1
do while arow>0 or acolumn<=cells

	//Check Row
	if arow>0 then
		for i=1 to cells -1
			//if mid(string(dw_1.Object.Data[arow,1]),i,1)='0' then exit
			cell1=mid(string(dw_1.Object.Data[arow,1]),i,1)
			cell2=mid(string(dw_1.Object.Data[arow,1]),i+1,1)
			if (cell1=cell2) and ((cell1<>'0') and (cell2<>'0')) then return FALSE
		next
	end if
	
	//Check Column
	if acolumn<=cells then
		for i=rows to 2 step -1
			if mid(string(dw_1.Object.Data[i,1]),acolumn,1)='0' then exit
			cell1=mid(string(dw_1.Object.Data[i   ,1]),acolumn,1)
			cell2=mid(string(dw_1.Object.Data[i -1,1]),acolumn,1)
			if cell1=cell2 then return FALSE
		next
	end if
	
	arow    --
	acolumn ++
loop

return TRUE

end function

event open;near=CREATE datastore
near.Dataobject='d_cell'

wf_drawgrid()
end event

on w_reveal.create
if this.MenuName = "m_reveal" then this.MenuID = create m_reveal
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.dw_1}
end on

on w_reveal.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_1)
destroy(this.dw_1)
end on

event resize;st_1.Width=this.Workspacewidth()
end event

type st_1 from statictext within w_reveal
event ue_refresh ( )
integer x = 5
integer y = 4
integer width = 1449
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 65280
long backcolor = 0
boolean enabled = false
string text = "Total Cells :  - Cells Left :"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event ue_refresh();this.Text='Total Cells :'+string(total_cells)+' - Cells Left :'+string(cells_left)
//if score>0 then this.text=' - Score :'+string(long(score*total_cells/cells_left))
end event

type dw_1 from datawindow within w_reveal
integer y = 80
integer width = 1449
integer height = 680
integer taborder = 10
string title = "none"
string dataobject = "d_grid"
boolean border = false
boolean livescroll = true
end type

event clicked;string	temp,upcell
long		acell,arow,acolor,i,j,upcolor

if gameover then return
if left(dwo.name,4)<>'cell' then return
acell =long(right(dwo.name,2))
arow  =row
acolor=wf_getcolor(arow,acell)
if acolor=0 then return

near.Reset()
wf_getnear(arow,acell)
if near.RowCount()=1 then
	Messagebox(app_name,'No cells with the same color near',Exclamation!)
	return
end if

dw_1.SetRedraw(FALSE)
his_index ++
astep=dw_1.Object.cells.Primary.Current[1,rows]
history[his_index]=astep
uncover_cells[his_index]=near.RowCount()
cells_left -=near.RowCount()
score+=near.RowCount()*2
st_1.event ue_refresh()

//Hide cells with same color
near.SetSort('acell A, arow A')
near.Sort()
for i=1 to near.RowCount()
	arow =near.Object.arow[i]
	acell=near.Object.acell[i]
	
	temp=dw_1.Object.cells[arow]
	temp=Replace(temp,acell,1,'0')
	dw_1.SetItem(arow,1,temp)
	
	//Move cells on top of hidden
	for j=arow  to 2 step -1
		upcolor=wf_getcolor(j -1,acell)
		temp  =dw_1.Object.cells[j]
		temp=Replace(temp,acell,1,string(upcolor))
		dw_1.SetItem(j,1,temp)
	next
	temp  =dw_1.Object.cells[1]
	temp=Replace(temp,acell,1,'0')
	dw_1.SetItem(j,1,temp)
next

j=0
do while j<cells
	//Check if in the bottom line we have a gap
	j ++
	temp=dw_1.Object.cells[rows]
	if double(mid(temp,j))=0 then exit
	if wf_getcolor(rows,j)=0 then
		for i=1 to rows
			temp=dw_1.Object.cells[i]
			temp=mid(temp,1,j -1)+mid(temp,j +1)+'0'
			dw_1.SetItem(i,1,temp)
		next
		j --
	end if
loop

dw_1.SetRedraw(TRUE)
if wf_isgameover() then
	MessageBox('Reveal','GAME OVER',StopSign!)
	openwithparm(w_halloffame,string(total_cells)+'^'+string(cells_left))
	gameover=TRUE
end if
//parent.title='Boxes near: '+string(near.rowCount())
end event

