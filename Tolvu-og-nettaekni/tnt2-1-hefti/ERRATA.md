# ERRATA – TNT2, 1. hefti: Talnakerfin, reikniaðgerðir og kóðar

Frumrit: `TNT2 Tölvurognettækni 1.hefti útgáfaB1.pdf` (útgáfa B1, 25.01.2022).
Blaðsíðutöl (Bls.) vísa í síðunúmer í PDF-skrá frumritsins (forsíðan er bls. 1). Allar villur hér að neðan hafa verið leiðréttar í `tnt2-1-hefti.md` og `tnt2-1-hefti.typ`.

Flokkar: **R** = reikningur/tölur, **S** = svör, **Ó** = ósamræmi, **M** = málfar/stafsetning, **F** = framsetning.

## Villur í reikningi og tölum

| Bls. | Flokkur | Í frumriti | Leiðrétt / athugasemd |
|:-:|:-:|:--|:--|
| 5 | R | „Talan 17,53 er því 110 + 7 · 1 (+) …“ | $1\cdot 10 + 7\cdot 1\;(+)\;5\cdot 0{,}1 + 3\cdot 0{,}01$ (margföldunarpunktinn vantaði; „110“ les sem talan hundrað og tíu). |
| 14 | R | Dæmi c: geymdir bitar (rauð lína) 1 0 1 0 | Rétt er 0 1 1 0 ($0111 + 0110$ gefur geymslu inn í 2. og 3. sæti). |
| 15 | R | Dæmi d: geymdir bitar 0 1 1 1 | Rétt er 1 1 1 1 ($1111 + 0111$ gefur geymslu í öll sæti, líka formerkisbitann sem er 1 í svarinu). |
| 16 | R | Dæmi h: „1110<sub>a2</sub> = 0001 + 1 = 0010<sub>2</sub> = 2<sub>10</sub>“ | Svarið er neikvætt: $-1110_{a2} \to -(0001+1) = -0010_2 = -2_{10}$. Mínusmerki vantaði. |
| 17 | R | „101 + 101 = 1010 (10) → 10101 + 101 = 1111 (15)“ | $1010 + 101 = 1111$ (15). Einnig vantaði skrefið $10100 + 101 = 11001$ (25) til að ná sex samlagningum. |
| 21 | R | „1 · 512 + 5 · 64 + 3 · 8 + 7 · 1 = 863<sub>8</sub>“ | $= 863_{10}$ (útkoman er í tugakerfi, ekki áttundarkerfi). |

## Villur í svörum (kafli 1.12)

| Dæmi | Flokkur | Í frumriti | Leiðrétt / athugasemd |
|:-:|:-:|:--|:--|
| 2c | S | „Tákn 1,2,3,…,F“ | Táknið **0** vantaði: 0–9 og A–F (16 tákn). |
| 3 | S | Svarið við **d** vantar og öll svör frá **e** eru færð um einn staf (svarið „e)“ á við d, „f)“ við e o.s.frv.). | Svörum raðað rétt: d, e, f, g, h. |
| 3d | S | „001111101<sub>2</sub>“ (9 bitar, rangt) | $\mathrm{37D}_{16} = 0011\,0111\,1101_2 = 1101111101_2$. |
| 3g | S | Aðeins tvíundarformið gefið. | Bætt við sextándukerfisforminu C0.A8.02.01 sem spurt er um. |
| 3h | S | C9 = „11011001“ | $\mathrm{C9}_{16} = 11001001_2$. Tugakerfisgildin, sem spurt er um, vantaði: 184:39:235:201:90:185. |
| 5c | S | „+1001<sub>a2</sub> = 1001<sub>2</sub> = 9<sub>10</sub>“ | 16 kemst ekki fyrir í 4 bitum; reikna þarf með 5 bitum: $10000 + 11001_{a2} = 1\,01001 \Rightarrow +01001_2 = 9_{10}$. Útkoman er ekki á a2-formi. |
| 5d | S | „−10111<sub>a2</sub> = −1001<sub>2</sub> = −9<sub>10</sub>“ | $7 - 13 = -6$: $0111 + 0011_{a2} = 0\,1010 \Rightarrow -1010_{a2} = -0110_2 = -6_{10}$. |

## Ósamræmi

| Bls. | Flokkur | Í frumriti | Leiðrétt / athugasemd |
|:-:|:-:|:--|:--|
| 13 | Ó | „Síðar (í hefti 4) lærum við að búa til rökrás sem framkvæmir samlagningu …“ | TNT2 hefur aðeins þrjú hefti og samlagningarrásir koma hvorki fyrir í 2. né 3. hefti. Breytt í „Síðar lærum við …“. Höfundur ætti að staðfesta hvar efnið er. |
| 20 | Ó | „… 8421 kóði en um hann var nánar fjallað í kafla 1.3 (tvíundarkerfið)“ | Tvíundarkerfið er í kafla **1.2**; kafli 1.3 er sextándukerfið. |
| 20 | Ó | Excess-3: „Talan 0 er því 011<sub>x3</sub>“ | Kóðinn er 4 bita: $0011_{x3}$, til samræmis við aðra 4 bita kóða í kaflanum. |
| 22 | Ó/F | Spurning 1c: „stærsta tvíundakerfistala sem hægt er að tákna með 4 bitum“, en svarið er gefið í tugakerfi (15). | Orðað: „stærsta tala sem hægt er að tákna með 4 bitum“. |
| víða | Ó | Hugtökin eru rituð á ýmsa vegu: tvíundarkerfi/tvíundakerfi, áttundarkerfi/áttundakerfi, tvíundarkerfistala/tvíundatala. | Samræmt í *tvíundarkerfi* og *áttundarkerfi* (algengasta form frumritsins). |
| 1 | Ó | Titill á forsíðu „Tölvu og nettækni“. | „Tölvu- og nettækni“ (bandstrik vegna sameiginlegs seinni liðar). |

## Málfar og stafsetning

| Bls. | Í frumriti | Leiðrétt |
|:-:|:--|:--|
| 4 | „Rökrásir og öll lógík … byggja á tveimur stöðum“ | „byggjast á“ |
| 5 | „Þetta hljómar flókið **er** svona eru öll talnakerfi byggð upp“ | „flókið **en** svona …“ |
| 5 | „hinsvegar“ | „hins vegar“ |
| 7 | „þá sést að þær eru jafngildar margföldunarstuðlunum −1“ | Óskýrt; umorðað: „þær eru jafnar næsta margföldunarstuðli fyrir ofan, mínus 1“. |
| 7 | „8 bitar (1 bæt) **innihalda** 256 ólíkar stöður“ | „1 **bæti** … geta táknað 256 ólíkar stöður“ (*bæti* er íðorðið). |
| 8 | „En nú hefur tugakerfið bara 10 tákn en sextándukerfið krefst þess væntanlega að hafa 16 tákn“ | Einfaldað: „En tugakerfið hefur bara 10 tákn og sextándukerfið þarf 16 tákn.“ |
| 10 | „við deilum í tugakerfistöluna með 2“ / „deila í 1 með 2“ | „deilum tugakerfistölunni með 2“ / „deila 1 með 2“ |
| 9 | „margföldunarstuðlum tvíundarkerfisins..“ (tveir punktar) | einn punktur |
| 10 | Talnarunan „128 - 64 - 32 - … – 1“ er tvítekin. | Sett fram einu sinni, í töflu með bitunum. |
| 13 | „1´complement“, „2´complement“ | *one's complement*, *two's complement* |
| 17 | „6 x 5“, „1x110“ | margföldunarpunktur, $6\cdot 5$ |
| 23 | „Umbreyttu **henni** í tugakerfi …“ (um MAC-vistfang, hk.) | „Umbreytið **því** …“ (einnig samræmt í fleirtölu boðhátt eins og önnur dæmi). |
| 24 | „Deilið 5 upp í 15“ | „Deilið 15 með 5“ (skýrara). |

## Framsetning

* Rauðir (geymdir) bitar og bláir formerkisbitar eru í Markdown/Typst sýndir í sérstakri línu, *geymt*, og formerkisbitinn feitletraður.
* Svörin í 5c og 5d innihalda nú stutta útleiðslu svo nemendur geti borið sína reikninga saman við þau.
