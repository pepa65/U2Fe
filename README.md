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

This setup only works with either one of these:
* The user needs to own `/dev/uhid`: `sudo chown $USER /dev/uhid`
* U2Fe needs to be run with root privileges: `sudo ./u2fe`

## Usage
Run before visiting any website that uses U2F:

`./u2fe`

* See the remarks under Setup
* Test at: https://webauthn.io

## Generate documentation
`make doc`

