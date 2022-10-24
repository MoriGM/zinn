{% if flag?(:linux) %}
  require "./impure/unix.cr"
{% end %}

module AnsiTerm
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
end
