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

The backlight-brightness program is written in Bash and supports
interfaces exposed through the Linux backlight sysfs class.

By default, the first preferred interface is used. Preference is defined
by name alphabetical order and type preference.

The default path for looking up interfaces is `/sys/class/backlight`. It
can be overridden using the `BACKLIGHT_SYSFS` environment variable.

The interface to use can be forced using the `BACKLIGHT_PATH` environment
variable. For example,

```
$ BACKLIGHT_PATH=/sys/class/backlight/intel_backlight backlight-brightness 50
```

For reference, https://www.kernel.org/doc/Documentation/ABI/stable/sysfs-class-backlight
