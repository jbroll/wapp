#!/usr/bin/env tclkit8.6
#
source wapp.tcl
source wapp-routes.tcl

wapp-route GET /image/date/file {
    puts  "GET $date $file"
}

wapp-route PUT /image/date/file {
    puts  "PUT $date $file"
}

wapp-route DELETE /image/date/file {
    puts  "DEL $date $file"
}

proc wapp-route-filter {page} {
    if {[wapp-param REQUEST_METHOD] eq "OPTIONS"} {
        wapp-reply-code "200 OK"; wapp ""; return 0
    }
    return 1
}

proc wapp-route-notfound {page} {
    wapp-reply-code "404 Not Found"
    wapp-mimetype "application/json"
    wapp "{\"error\":\"not found\"}"
}

proc wapp-default {} {
    wapp-subst { HI }
}

wapp-start $argv

