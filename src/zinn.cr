require "./terminal.cr"

Terminal.clear
Terminal::Cursor.down(10)
sleep(100)
Terminal::Cursor.up(1)

while true
end
