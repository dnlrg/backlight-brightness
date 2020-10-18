# Backlight brightness

Adjusts Intel backlight brightness level from the command line.

## Usage

```
$ backlight-brightness [[+|-]0..100]
```

### If used without arguments, prints the current brightness level,

```
$ backlight-brightness
45% (1997/4437)
```

### Set brightness level to percentage from maximum value,

```
$ backlight-brightness 50
$ backlight-brightness
50% (2219/4437)
```

### Increment or decrement in percentages from maximum value,

```
$ backlight-brightness +10
$ backlight-brightness
60% (2662/4437)

$ backlight-brightness -15
$ backlight-brightness
45% (1997/4437)
```

## How it works

The backlight-brightness program is written in Bash and supports Intel backlight interface exposed through Linux Kernel FS.

Other drivers providing brightness and max_brightness should work adjusting the BACKLIGHT environment variable.
