$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type st_1 from statictext within w_main
end type
type lb_data from listbox within w_main
end type
end forward

global type w_main from window
integer width = 1513
integer height = 1672
boolean titlebar = true
string title = "Drag And Drop In ListBox"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
lb_data lb_data
end type
global w_main w_main

type variables
Integer ii_index
String is_text

end variables
on w_main.create
this.st_1=create st_1
this.lb_data=create lb_data
this.Control[]={this.st_1,&
this.lb_data}
end on

on w_main.destroy
destroy(this.st_1)
destroy(this.lb_data)
end on

event resize;//lb_data.Move(4,4)
lb_data.Resize(newwidth -15 , newheight - 150)

end event

event open;Int li_row

For li_row = 1  To 20
	lb_data.additem( " Data Item Row " + String(li_row))
Next
end event

type st_1 from statictext within w_main
integer x = 37
integer y = 32
integer width = 1353
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
string text = "Note: Unchecked Sorted Properties Of ListBox "
boolean focusrectangle = false
end type

type lb_data from listbox within w_main
event ue_lbuttondown pbm_lbuttondown
event ue_lbuttonup pbm_lbuttonup
event ue_getdata pbm_custom01
event ue_adddata pbm_custom02
integer y = 128
integer width = 1463
integer height = 1376
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event ue_lbuttondown;This.PostEvent("ue_getdata")

end event

event ue_lbuttonup;This.PostEvent("ue_adddata")

end event

event ue_getdata;ii_index = This.SelectedIndex()
is_text = This.SelectedItem()
This.SetRedraw(False)

end event

event ue_adddata;If ii_index <= 0 Then Return

Int li_dropindex
li_dropindex = This.SelectedIndex()

This.DeleteItem(ii_index)
This.InsertItem(is_text,li_dropindex)
This.SelectItem(li_dropindex)
This.SetRedraw(True)

end event

