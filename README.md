# U2Fe
**U2F emulated: Emulate U2F through a virtual USB device using the UHID system API on Linux**

* License: GPL-2.0
* Author: César `MattGorko` Belley <cesar.belley@lse.epita.fr>
* Repo: github.com/pepa65/u2fe
* After: github.com/Agnoctopus/U2F-Emulated

## Building
`make`

## Setup
`./setup`

Make sure the user is authorized to do I/O on `/dev/uhid`, or run with root privileges.

## Usage
Run before visiting any website that uses U2F:

`./u2fe`

* Test at: https://webauthn.io

## Generate documentation
`make doc`

## Test with Valgrind:
`make check-valgrind`
