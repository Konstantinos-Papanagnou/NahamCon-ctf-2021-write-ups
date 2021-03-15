#!/bin/bash
cat esab64 | rev | base64 -d | rev
