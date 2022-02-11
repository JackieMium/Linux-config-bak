#!/usr/bin/env python3

# This is a tiny Python script to rename subtitle files (*.ass or *.srt)
# according to media file names (*.mp4 or *.mkv).

# To use the script, simple run it with a file path and 
# part of the file name (shoule be unique for regrex to work)

#######################
import os
import sys
from pathlib import Path
import glob

if len(sys.argv) != 3:
    print("Two arguements needed!")
    print("1st for file path and 2nd for media name (regrex).")

path = Path(sys.argv[1])

if not path.is_dir():
    print("Arg 1 should be a valid path!")
else:
    os.chdir(path)
    media_list = []
    sub_list = []
    media_list = [f for f_ in [glob.glob(e) for e in ('*.mkv', '*.mp4')] for f in f_]
    sub_list = [f for f_ in [glob.glob(e) for e in ('*.ass', '*.srt')] for f in f_]
        
    sub_match = []
    media_match = []
    for f in sub_list:
        if sys.argv[2] in f:
            sub_match.append(f)
    if len(sub_match) == 0:
        print("No matching sub file found!")
    if len(sub_match) > 1:
        print("Multiple sub files found!")
   
    for m in media_list:
        if sys.argv[2] in m:
            media_match.append(m)
    if len(media_match) == 0:
        print("No matching media file found!")
    if len(media_match) > 1:
        print("Multiple media files found!")
    
    if len(media_match) == 1 and len(sub_match) == 1:
        media_name = Path(media_match[0]).stem
        sub_name = Path(sub_match[0]).stem
        sub_ext = Path(sub_match[0]).suffix
        if media_name == sub_name:
            print("All good, renaming not needed.")
        else:
            Path(sub_match[0]).rename(Path(media_name + sub_ext))
