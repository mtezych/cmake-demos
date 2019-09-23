#!/usr/bin/env python3

import subprocess


def main () :

    subprocess.check_call(["cmake", "-P", "Script.cmake"])


if __name__ == "__main__" :

    main()
