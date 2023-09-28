# U2F Emulated
**Emulate U2F through a virtual USB device using UHID system API on linux**

* License: GPL-2.0
* Author: César `MattGorko` Belley <cesar.belley@lse.epita.fr>
* Repo: github.com/pepa65/u2fe

## Usage
Run privileged before visiting any website that uses U2F:
`sudo ./u2fe`

* Test with: https://webauthn.io

## Building
`make`

## Setup
`./setup.sh`

## Test wit Valgrind:
`make check-valgrind`

## Generate documentation
`make doc`
