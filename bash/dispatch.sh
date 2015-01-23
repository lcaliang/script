#!/bin/bash

awk -f DivPatch.awk $1 
awk -f RepoPatch.awk JB.patch 
