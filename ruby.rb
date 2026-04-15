# grep SNDCTL_MIDI_SETMODE /usr/include/sys/soundcard.h

require 'ffi'

#
module Soundcard
  extend FFI::Library
  ffi_lib FFI::Library::LIBC

  SNDCTL_MIDI_SETMODE = 0x40044d01 # must match your system header
end

#
int mode = MIDI_MODE_TRADITIONAL; // or TIMED / ALTERNATIVE
ioctl(fd, SNDCTL_MIDI_SETMODE, &mode);

# 
module LibC
  extend FFI::Library
  ffi_lib FFI::Library::LIBC

  attach_function :ioctl, [:int, :ulong, :pointer], :int
end

#
# Constants (values must match your system headers)
SNDCTL_MIDI_SETMODE   = 0x40044d01   # verify this!
MIDI_MODE_TRADITIONAL = 0
MIDI_MODE_TIMED       = 1
MIDI_MODE_ALTERNATIVE = 2

#
fd = IO.sysopen("/dev/midi", "r+")

# Allocate an int and set value
mode_ptr = FFI::MemoryPointer.new(:int)
mode_ptr.write_int(MIDI_MODE_TRADITIONAL)

# Call ioctl
ret = LibC.ioctl(fd, SNDCTL_MIDI_SETMODE, mode_ptr)

if ret == -1
  raise SystemCallError.new("ioctl failed", FFI.errno)
end
