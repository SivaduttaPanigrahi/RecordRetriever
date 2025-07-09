HA$PBExportHeader$w_misth_ypal_search.srw
$PBExportComments$
forward
global type w_misth_ypal_search from w_searchex
end type
type gb_1 from groupbox within w_misth_ypal_search
end type
end forward

global type w_misth_ypal_search from w_searchex
integer width = 2309
integer height = 912
string icon = "res\ypal.ico"
gb_1 gb_1
end type
global w_misth_ypal_search w_misth_ypal_search

forward prototypes
protected function string of_createwhere ()
end prototypes

protected function string of_createwhere ();string	ls_where

string ls_where
string lstring
long llong

// Using the custom function for filters
lstring = dw.object.surname[1]
ls_where += of_customfilter("surname", lstring, "LIKE")

lstring = dw.object.name[1]
ls_where += of_customfilter("name", lstring, "LIKE")

lstring = dw.object.fathername[1]
ls_where += of_customfilter("fathername", lstring, "LIKE")

lstring = dw.object.sex[1]
ls_where += of_customfilter("sex", lstring, "=")

lstring = dw.object.kodtmima[1]
ls_where += of_customfilter("kodtmima", lstring, "=")

lstring = dw.object.kodidikot[1]
ls_where += of_customfilter("kodidikot", lstring, "=")

lstring = dw.object.mitroo[1]
ls_where += of_customfilter("mitroo", lstring, "=")

lstring = dw.object.adt[1]
ls_where += of_customfilter("adt", lstring, "=")

lstring = dw.object.afm[1]
ls_where += of_customfilter("afm", lstring, "=")

llong = dw.object.klimakio[1]
if not isnull(llong) then
    ls_where = ls_where + " AND klimakio = " + string(llong)
end if

lstring = dw.object.klados[1]
ls_where += of_customfilter("klados", lstring, "=")

lstring = dw.object.bathmos[1]
ls_where += of_customfilter("bathmos", lstring, "=")

return ls_where



end function

protected function string of_customfilter (string as_column, string as_value, string as_operator)
string ls_filter

// Check if the value is not null and not empty
if not isnull(as_value) and as_value <> "" then
    // Handle the "LIKE" operator separately to include wildcard
    if as_operator = "LIKE" then
        ls_filter = " AND " + as_column + " " + as_operator + " ~~'" + as_value + "%~~'"
    else
        // For other operators like "="
        ls_filter = " AND " + as_column + " " + as_operator + " ~~'" + as_value + "~~'"
    end if
end if

// Return the generated filter string
return ls_filter
end function


on w_misth_ypal_search.create
int iCurrent
call super::create
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_1
end on

on w_misth_ypal_search.destroy
call super::destroy
destroy(this.gb_1)
end on

event open;call super::open;fn_retrievechild(dw, "kodtmima", gs_kodxrisi)
fn_retrievechild(dw, "kodidikot", gs_kodxrisi)


	dw.Object.sex.Values=trn(113) + "	1/" + trn(380) + "	" + "2/"
	title = trn(70)
	
end event

type cb_cancel from w_searchex`cb_cancel within w_misth_ypal_search
integer x = 1938
integer y = 680
end type

type cb_ok from w_searchex`cb_ok within w_misth_ypal_search
integer x = 1600
integer y = 680
end type

type dw from w_searchex`dw within w_misth_ypal_search
integer x = 69
integer y = 64
integer width = 2135
integer height = 544
string dataobject = "dw_misth_ypal_search"
end type

type gb_1 from groupbox within w_misth_ypal_search
integer x = 27
integer width = 2226
integer height = 640
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = greekcharset!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Greek"
long textcolor = 33554432
long backcolor = 67108864
end type

