#!/bin/bash

set -e

target_script=$1

clean_up()
{
    rm -rf "$fake_sysfs"
}

trap clean_up EXIT

fail()
{
    echo FAIL
}

trap fail ERR

init_backlight()
{
    local path
    local type

    path=$1
    type=$2

    mkdir -p "$path"

    echo 1000 | tee "$path"/brightness > "$path"/max_brightness
    echo "$type" > "$path"/type
}

assert_value()
{
    local pct
    local val
    local max

    pct=$1
    val=$2
    max=$3

    $target_script | grep -qE "^$pct% \\($val/$max\\)$"

    echo PASS
}

set_value()
{
    local pct
    local out

    pct=$1

    out="$($target_script "$pct")"

    test -z "$out"
}

test_msg()
{
    echo -ne "$*:\\t"
}

fake_sysfs=$(mktemp -d)
fake_path=$fake_sysfs/fake_backlight

init_backlight "$fake_path" raw

export BACKLIGHT_SYSFS=$fake_sysfs

test_msg "Initial value"

assert_value 100 1000 1000

test_msg "Set value"

set_value 50

assert_value 50 500 1000

test_msg "Increment"

set_value +10

assert_value 60 600 1000

test_msg "Decrement"

set_value -20

assert_value 40 400 1000

test_msg "Rounded value"

set_value 33

assert_value 33 330 1000

echo OK
