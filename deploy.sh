#!/bin/bash

source /root/.bashrc

/app/script.exp $2

b4a default "$1"
b4a deploy