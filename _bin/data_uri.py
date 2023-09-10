#!/usr/bin/env python

import sys

with open(sys.argv[1]) as f:
    print("data:image/png;base64," + f.read().encode('base64').replace('\n', ''))
