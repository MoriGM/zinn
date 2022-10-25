{% if flag?(:linux) %}
  require "./impure/unix.cr"
{% end %}

module Terminal
  extend self

  def size : {Int32, Int32}
    if !File.exists?("/dev/tty")
      abort("Your not on a unix system with the /dev/tty file descriptor")
    end

    size = C::WinSize.new

    tty = File.open("/dev/tty", "r")
    C.ioctl(tty.fd, C::TIOCGWINSZ, pointerof(size))
    tty.close
    {size.ws_row.to_i, size.ws_col.to_i}
  end

  def clear
  end

  module Cursor
    extend self

    private ESC = "\x1b"

    def up(lines : Int32)
      print "#{ESC}[#{lines}A"
    end

    def down(lines : Int32)
      print "#{ESC}[#{lines}B"
    end

    def right(columns : Int32)
      print "#{ESC}[#{columns}C"
    end

    def left(columns : Int32)
      print "#{ESC}[#{columns}D"
    end

    def move(columns : Int32, lines : Int32)
      print "#{ESC}[#{lines};#{columns}H"
    end
  end
end
