$PBExportHeader$reveal.sra
$PBExportComments$Generated Application Object
forward
global type reveal from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
string	app_name='Reveal'
string	regbase ='HKEY_CURRENT_USER\Software\BradjaSoft\Reveal'
end variables

global type reveal from application
string appname = "reveal"
end type
global reveal reveal

on reveal.create
appname="reveal"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on reveal.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_reveal)
end event

