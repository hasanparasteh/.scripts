#!/bin/sh
curl "https://api.github.com/users/$1/repos" | jq ".[].name"
