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

fake_sysfs=$(mktemp -d)
fake_path=$fake_sysfs/fake_backlight

init_backlight "$fake_path" raw

export BACKLIGHT_SYSFS=$fake_sysfs

$target_script | grep -qE "^100% \\(1000/1000\\)$"

output=$($target_script 50)

[ -z "$output" ]

"$target_script" | grep -qE "^50% \\(500/1000\\)$"

output=$($target_script +10)

[ -z "$output" ]

"$target_script" | grep -qE "^60% \\(600/1000\\)$"

output=$($target_script -20)

[ -z "$output" ]

"$target_script" | grep -qE "^40% \\(400/1000\\)$"

echo OK
