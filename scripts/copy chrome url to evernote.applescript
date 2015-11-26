set noteId to "evernote:///view/2147483647/s224/local/x-coredata://E08796F4-8732-4899-B547-0D37DDDB5043/ENNote/p734/"
set myNote to {}
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

tell application "Evernote"
    set theNote to find note noteId
    --get title of theNote
    set notifyTitle to "Sent Chrome tab url to Evernote"
    try
        --tell theNote to append html ("<br/>" & tabTitle)
        tell theNote to append html "<br/><br/><br/><br/>" & tabTitle & "<br/>" & tabUrl 
     on error errMsg
        set notifyTitle to "ERROR: " & errMsg
    end try
    display notification tabUrl with title notifyTitle subtitle "《" & tabTitle & "》"
    --tell theNote to append html "<br/><br/>" & tabTitle & "<br/>" & tabUrl 
    --tell theNote to append text "23"
end tell