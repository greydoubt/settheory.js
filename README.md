# settheory.js

final fantasy zero_one (i) engine jRPG generic freebsd kernel

After the method to obtain the distribution sets has been chosen, and (if applicable) after those sets have been transferred, they will be extracted into the new NetBSD file system.

A message (see Figure 3.30, “Extraction of sets completed”) will let you know that the set extraction is now completed and that you have the opportunity to perform some essential configuration before finishing the NetBSD installation.

<img width="1077" height="598" alt="Screenshot 2026-04-25 at 23 05 32" src="https://github.com/user-attachments/assets/0ecda6b9-8cde-4b91-a1fe-8545e6c67566" />

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






