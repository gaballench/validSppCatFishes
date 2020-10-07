; open eww and search the CAS catalog
M-x eww RET CAS catalog of fishes
(eww "CAS catalog of fishes")
; incremental search and then click into the link
C-s Search the catalog

; go to the search box and look for the genus of interest
Chaetostoma

; select all the text in the page
C-x h

; copy the selection
M-w

; paste (yank) it to another non-read-only buffer, e.g., *scratch*
C-y

; back to beginning of the buffer
C-<home> or M-x beginning-of-buffer

; all semicolons are comments in elisp! replace them with commas
C-M-% ; RET , RET !

; the field of interest is "Current status", but in order to homogenize text remove all newlines replacing them with spaces
C-M-% C-q C-j RET ' ' (space) RET !

; back to beginning of the buffer
C-<home> or M-x beginning-of-buffer

; a bunch of multiple blank characters are messing with the info, reduce all of these to single spaces
C-M-S-% [[:blank:]]+ RET ' ' (single space) RET !

; back to beginning of the buffer
C-<home> or M-x beginning-of-buffer

; be sure that no further spaces are present
C-M-S-% \s-+ RET ' ' (single space) RET !

; back to beginning of the buffer
C-<home> or M-x beginning-of-buffer

; insert newlines just before the regex "Current status"
C-M-% Current status RET C-q C-j Current status RET !

; back to beginning of the buffer
C-<home> or M-x beginning-of-buffer

; keep only lines with "Current status" regexp as there is a single header line messing with results 
M-x keep-lines RET "Current status: Valid as" RET

; remove the text before the species name as it is uniform accross records replacing with "nothing"
C-M-% "Current status: Valid as " RET RET !

; now remove starting with "Loricariidae" until end of line replacing the regexp with "nothing"
C-M-S-% "Loricariidae.+$" RET RET !

; first select all text and then sort the lines
C-x h
M-x sort-lines

; just keep lines with Chaetostoma as some names were once associated to Chaetostomus or Chaetostoma but not anymore
M-x keep-lines RET "Chaetostoma" RET
