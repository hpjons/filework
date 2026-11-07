# Tölvu- og nettækni (TNT2 og TNT3)

Kennsluhefti Eiríks Guðmundssonar af [rafbok.is](https://www.rafbok.is), færð úr PDF yfir í
**Markdown** (til birtingar á vef) og **Typst** (til prentunar). Upprunalegu PDF-skrárnar eru
óbreyttar í þessari möppu.

| Mappa | Hefti | Myndir |
|:--|:--|:-:|
| [`tnt2-1-hefti/`](tnt2-1-hefti/) | TNT2, 1. hefti – Talnakerfin, reikniaðgerðir og kóðar | 3 |
| [`tnt2-2-hefti/`](tnt2-2-hefti/) | TNT2, 2. hefti – Rofavirkni og rökrásahlið | 63 |
| [`tnt2-3-hefti/`](tnt2-3-hefti/) | TNT2, 3. hefti – Einföldunaraðferðir | 28 |
| [`tnt3/`](tnt3/) | TNT3 – Kennsluhefti (TTL/CMOS, vippur, teljarar, gistur, minni) | 147 |

Í hverri möppu eru:

* `<hefti>.md` – frumtextinn, Markdown með YAML-haus. Stærðfræði og einingar eru ritaðar með
  LaTeX (`$…$` og `$$…$$`), t.d. `$5\,\mathrm{V}$`, `$\overline{A+B}$`, `$1101_{2}$`.
* `<hefti>.typ` – Typst-útgáfa til prentunar (A4), búin til sjálfvirkt úr `.md`-skránni.
* `myndir/` – myndir skornar úr PDF-skjalinu (216 dpi), tölusettar í þeirri röð sem þær koma
  fyrir: `mynd-1.png`, `mynd-2.png`, … Forsíðumyndin heitir `forsida.png`.
* `ERRATA.md` – villur í reikningi, tölum, hugtökum og málfari sem fundust í frumritinu og
  hvernig þær voru lagfærðar.

## Að búa til Typst og PDF

Markdown-skráin er frumgagnið. Eftir breytingar á henni:

```bash
./_verkfaeri/byggja.sh
```

```bash
./_verkfaeri/byggja.sh --pdf
```

Fyrri skipunin endurnýjar `.typ`-skrárnar (krefst [pandoc](https://pandoc.org) 3.1 eða nýrra), sú
seinni býr líka til PDF (krefst [Typst](https://typst.app)). Einnig má þýða staka skrá beint:

```bash
typst compile tnt3/tnt3.typ
```

Verkfærin í `_verkfaeri/`:

* `rafbok.lua` – pandoc-sía: þýðir LaTeX-stærðfræðina yfir í Typst-stærðfræði, gerir myndir með
  myndatexta („*Mynd N: …*“ í næstu málsgrein) að Typst-`figure` og ákvarðar myndastærð.
* `rafbok.typst` – útlitssniðmát (forsíða, efnisyfirlit, síðuhaus og -fótur, töflur).
* `linuskil.py` – setur harðar línuskiptingar í dæma- og svarlista (a), b), …) svo þeir birtist
  rétt bæði á vef og í Typst.
