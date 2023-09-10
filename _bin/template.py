#!/usr/bin/env python
# new_post.py
# derived from:
# - http://benjamincongdon.me/blog/2016/03/21/Jekyll-New-Post-Script/
# - http://github.com/pubgem/www-pubgem-org
# - http://github.com/iandennismiller/diamond-patterns

from datetime import datetime
from six.moves import input
import sys
import glob
import os


def main():
    templates = map((lambda x: os.path.basename(x)), glob.glob("_templates/*.txt"))
    templates = map((lambda x: x[:-4]), templates)
    category = input("Which category? {{{0}}}: ".format(", ".join(templates)))

    try:
        with open("_templates/{0}.txt".format(category)) as f:
            template = f.read()
    except:
        print("the category is not recognized")
        sys.exit(1)

    title = input("Title: ")
    tags = input("Tags: ")

    timestamp = datetime.today().strftime("%Y-%m-%d %H:%M:%S")
    datestamp = datetime.today().strftime("%Y-%m-%d")
    file_name = datestamp + "-" + "-".join(title.split(" ")).lower() + ".markdown"
    with open("_posts/" + category + "/" + file_name, "w+") as file:
        file.write(template.format(title, timestamp, tags))


if __name__ == "__main__":
    main()
