# grep SNDCTL_MIDI_SETMODE /usr/include/sys/soundcard.h

require 'ffi'


module Soundcard
  extend FFI::Library
  ffi_lib FFI::Library::LIBC

  SNDCTL_MIDI_SETMODE = 0x40044d01 # must match your system header
end



