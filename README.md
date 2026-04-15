# settheory.js

final fantasy zero_one (i) engine jRPG generic freebsd kernel

```ruby

int mode = MIDI_MODE_TRADITIONAL; // or TIMED / ALTERNATIVE

ioctl(fd, SNDCTL_MIDI_SETMODE, &mode);


require 'ffi'

module LibC
  extend FFI::Library
  ffi_lib FFI::Library::LIBC

  attach_function :ioctl, [:int, :ulong, :pointer], :int
end

# Constants (values must match your system headers)
SNDCTL_MIDI_SETMODE   = 0x40044d01   # verify this!
MIDI_MODE_TRADITIONAL = 0
MIDI_MODE_TIMED       = 1
MIDI_MODE_ALTERNATIVE = 2

fd = IO.sysopen("/dev/midi", "r+")

# Allocate an int and set value
mode_ptr = FFI::MemoryPointer.new(:int)
mode_ptr.write_int(MIDI_MODE_TRADITIONAL)

# Call ioctl
ret = LibC.ioctl(fd, SNDCTL_MIDI_SETMODE, mode_ptr)

if ret == -1
  raise SystemCallError.new("ioctl failed", FFI.errno)
end
```






