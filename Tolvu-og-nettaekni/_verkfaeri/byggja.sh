#!/usr/bin/env bash
# Býr til Typst-skrár (.typ) úr Markdown-skránum (.md) í hverri heftismöppu.
# Notkun:  ./_verkfaeri/byggja.sh          (keyrt úr möppunni Tolvu-og-nettaekni)
#          ./_verkfaeri/byggja.sh --pdf    (býr líka til PDF ef typst er uppsett)
set -euo pipefail
cd "$(dirname "$0")/.."
V="_verkfaeri"
for md in */*.md; do
  case "$md" in */ERRATA.md|_verkfaeri/*) continue;; esac
  dir=$(dirname "$md"); base=$(basename "$md" .md)
  ( cd "$dir" && pandoc "$base.md" -f markdown-implicit_figures-fancy_lists \
      --lua-filter "../$V/rafbok.lua" --template "../$V/rafbok.typst" \
      -t typst --wrap=none -o "$base.typ" )
  echo "  $dir/$base.typ"
  if [[ "${1:-}" == "--pdf" ]]; then
    typst compile "$dir/$base.typ" "$dir/$base.pdf"
    echo "  $dir/$base.pdf"
  fi
done
