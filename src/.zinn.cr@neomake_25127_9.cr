require "./terminal.cr"

Terminal.clear
Terminal::Cursor.down(10)
sleep(1)
Terminal::Cursor.up(1)
sleep(5)
Terminal::Cursor.move(0, 0)

loop do
end
