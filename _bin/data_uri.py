#!/usr/bin/env python
# (cc) 2016 diamond-patterns

import sys

with open(sys.argv[1]) as f:
    print("data:image/png;base64," + f.read().encode('base64').replace('\n', ''))
