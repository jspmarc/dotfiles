#!/bin/env sh

id=$(xdo id)

xdo hide $id
$("$@") > /dev/null 2>&1 &
wait
xdo show $id
