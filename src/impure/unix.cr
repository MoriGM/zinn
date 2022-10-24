lib C
  fun ioctl(fd : Int32, request : UInt32, iwr : C::WinSize*) : Int32

  struct WinSize
    ws_row : UInt16
    ws_col : UInt16
    ws_xpixel : UInt16
    ws_ypixel : UInt16
  end

  TIOCGWINSZ = 21523
end
