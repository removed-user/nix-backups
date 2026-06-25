#!/bin/bash
function clone() {
local USER=$1
local REPO=$2
local DEST=$3
echo 'git clone https://github.com/'"${USER}"'/'"${REPO}"'.git' '--depth=1' ./"${DEST}"
}
clone
