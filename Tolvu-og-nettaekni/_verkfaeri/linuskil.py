#!/usr/bin/env python3
"""Hjálparforrit: bætir harðri línuskiptingu (\\ í línulok) við línur í
dæma- og svarlistum (a), b), i), …) svo þær birtist hver í sinni línu
bæði í vefbirtingu (CommonMark/GitHub) og í Typst. Lagar líka línur sem
byrja á t.d. „0. sætið“ svo þær verði ekki að tölusettum lista."""
import re, sys
pat = re.compile(r'^\s*(\*\*)?([a-h]|i{1,3}|iv)\)')
for fn in sys.argv[1:]:
    lines = open(fn, encoding="utf-8").read().split("\n")
    out = []; inmath = False; front = 0
    for i, l in enumerate(lines):
        s = l.strip()
        if s == "---" and front < 2 and i < 15: front += 1
        if s.startswith("$$"):
            if not (s.endswith("$$") and len(s) > 2): inmath = not inmath
        l = re.sub(r'^(\s*(?:- )?)(\d+)\. (sæti)', r'\1\2\\. \3', l)
        nxt = lines[i+1] if i+1 < len(lines) else ""
        ok = (s and nxt.strip() and not inmath and not l.endswith("\\")
              and not s.startswith(("|", ">", "#", "$$", "- ", "!"))
              and not nxt.strip().startswith(("|", "$$", "!", ">")))
        if ok and (pat.match(nxt) or pat.match(l) or re.match(r'^\*\*\d+\.\*\*$', s)
                   or (nxt.startswith("   ") and not nxt.startswith("    "))):
            l += "\\"
        out.append(l)
    open(fn, "w", encoding="utf-8").write("\n".join(out))
