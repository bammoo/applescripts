
set tabUrl to missing value
set theNote to missing value
set tabTitle to missing value

tell application "Google Chrome"
    --activate
    tell application "System Events"
        tell application process "Google Chrome"
            set tabUrl to value of text field 1 of toolbar 1 of window 1
            set tabTitle to (title of window 1)
        end tell
    end tell
end tell

delay 0.2

log tabTitle
log tabUrl

tell application "Evernote"
    try
        set theNotes to selection
        set theNote to first item in theNotes
        set notifyTitle to "[note]: " & (get title of theNote)
        try
            --tell theNote to append html ("<br/>" & tabTitle)
            tell theNote to append html "<br/><br/><br/><br/>" & tabTitle & "<br/>" & tabUrl
            --tell theNote to append html tabTitle & tabUrl 
            --tell theNote to append html tabUrl
        on error errMsg
            log "error: "  & errMsg
            set notifyTitle to "ERROR: " & errMsg
        end try
        display notification tabUrl with title notifyTitle subtitle "《" & tabTitle & "》"
        --tell theNote to append html "<br/><br/>" & tabTitle & "<br/>" & tabUrl 
        --tell theNote to append text "23"
    end try
end tell