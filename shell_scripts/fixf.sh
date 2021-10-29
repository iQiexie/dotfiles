#!/bin/sh  

exec sudo tee /sys/module/hid_apple/parameters/fnmode
