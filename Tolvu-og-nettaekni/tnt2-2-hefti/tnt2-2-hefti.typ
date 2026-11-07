// Sjálfvirkt búið til úr Markdown-skjalinu með pandoc og _verkfaeri/rafbok.lua.
// Breytið frekar .md-skránni og keyrið _verkfaeri/byggja.sh.

#let titill = [Tölvu- og nettækni]
#let undirtitill = [Rofavirkni og rökrásahlið]
#let afangi = [TNT2 – 2\. hefti]
#let hofundur = [Eiríkur Guðmundsson]
#let utgafa = [Útgáfa B1 – 25.01.2022]

#let blockquote(body) = block(
  width: 100%, inset: (x: 12pt, y: 9pt), radius: 3pt,
  fill: rgb("#eef4fb"), stroke: (left: 3pt + rgb("#2f6db5")),
  body,
)
#let horizontalrule = line(start: (25%, 0%), end: (75%, 0%), stroke: 0.5pt + gray)

#set document(title: titill, author: "Eiríkur Guðmundsson")
#set text(lang: "is", font: ("Libertinus Serif", "New Computer Modern"), size: 11pt)
#show math.equation: set text(font: ("New Computer Modern Math",))
#set par(justify: true, leading: 0.62em)
#set page(
  paper: "a4",
  margin: (x: 2.5cm, top: 2.6cm, bottom: 2.4cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(90))
      #afangi #h(1fr) #undirtitill
      #v(-6pt) #line(length: 100%, stroke: 0.4pt + luma(160))
    ]
  },
  footer: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(90))
      Rafbók – www.rafbok.is #h(1fr) #counter(page).display("1")
    ]
  },
)

#show heading: set text(font: ("New Computer Modern Sans", "Libertinus Sans", "DejaVu Sans"), fill: rgb("#1f4e8c"))
#show heading.where(level: 2): it => { pagebreak(weak: true); block(above: 0.4em, below: 1em, text(size: 17pt, it.body)) }
#show heading.where(level: 3): it => block(above: 1.6em, below: 0.8em, text(size: 13pt, it.body))
#show heading.where(level: 4): it => block(above: 1.3em, below: 0.7em, text(size: 11.5pt, it.body))

#set table(stroke: 0.5pt + luma(120), inset: (x: 6pt, y: 4pt))
#show table.cell.where(y: 0): set text(weight: "bold")
#show table: set align(center)
#show figure: set block(breakable: false, above: 1.2em, below: 1.2em)
#show figure.caption: set text(size: 9.5pt, style: "italic")
#set list(indent: 0.8em)
#set enum(indent: 0.8em)
#show link: set text(fill: rgb("#2f6db5"))

// ---------- Forsíða ----------
#page(header: none, footer: none)[
  #set align(center)
  #v(2cm)
  #text(size: 13pt, tracking: 2pt, fill: luma(80))[RAFBÓK]
  #v(1.2cm)
  #text(size: 26pt, weight: "bold", font: ("New Computer Modern Sans", "DejaVu Sans"), fill: rgb("#1f4e8c"))[#titill]
  #v(0.4cm)
  #text(size: 16pt)[#afangi]
  #v(0.3cm)
  #text(size: 18pt, style: "italic")[#undirtitill]
  #v(1cm)
  #image("myndir/forsida.png", width: 60%)
  #v(1fr)
  #text(size: 13pt)[#hofundur]
  #v(0.3cm)
  #text(size: 10pt, fill: luma(90))[#utgafa]
  #v(1cm)
]

#outline(title: [Efnisyfirlit], depth: 3, indent: auto)
#pagebreak()

#blockquote[
Þetta hefti er án endurgjalds á rafbókinni #link("https://www.rafbok.is")[www.rafbok.is]. Allir rafiðnaðarmenn og rafiðnaðarnemar geta fengið aðgang að rafbókinni án endurgjalds.

Heimilt er að afrita textann til fræðslu í skólum sem reknir eru fyrir opinbert fé án leyfis höfundar eða Rafmenntar, fræðsluseturs rafiðnaðarins. Hvers konar sala á textanum í heild eða að hluta til er óheimil nema að fengnu leyfi höfundar og Rafmenntar.

Vinsamlegast sendið leiðréttingar og athugasemdir til höfundar eða til Báru Laxdal Halldórsdóttur á netfangið #link("mailto:bara@rafmennt.is")[bara\@rafmennt.is].

Höfundur er Eiríkur Guðmundsson. Umbrot í rafbók: Bára Laxdal Halldórsdóttir.
]

== 1\. Rofar, snertur og ljós
<rofar-snertur-og-ljós>
#box(image("myndir/mynd-1.png", width: 50pt)) #box(image("myndir/mynd-2.png", width: 68pt))

#emph[Mynd 1 og 2: Opin snerta A og ljós Y. Til vinstri er ekki þrýst á A, til hægri er þrýst á A og ljósið logar.]

Þetta er mynd af snertu eða rofa (merktum A) og ljósi (merktu Y). Þegar þrýst er á rofa A lokast hann og fer að leiða straum. Þá kviknar ljós á peru Y.

Við getum táknað þessa virkni með $Y eq A$, þ.e. þegar þrýst er á A kviknar á Y.

== 2\. Hliðtengdar snertur
<hliðtengdar-snertur>
En ef við bætum öðrum rofa, B, við hliðina á A? Það kallast að hliðtengja B við A.

#figure(image("myndir/mynd-3.png", width: 61pt), caption: [Mynd 3: Hliðtengdar snertur A og B.], numbering: none)
Skiptir máli hvort við þrýstum á A eða B til að fá ljós á Y? Nei, það skiptir ekki máli, báðir gera það sama og straumnum er sama hvort hann fer í gegnum A eða B eða báða. Það kemur ekki meira ljós þó að við ýtum á báða; það er háð spennunni og viðnámi ljósaperunnar.

Við getum lýst þessu með $Y eq A$ #strong[EÐA] $B$; það kemur ljós ef þrýst er á A eða B.

Ef við myndum bæta þriðja rofanum, C, við hliðina á B og hliðtengja hann væri því lýst með $Y eq A$ #strong[EÐA] $B$ #strong[EÐA] $C$. Það væri nóg að þrýsta á einhvern einn af þessum þremur rofum, þá kæmi ljós á Y. Svona virkar hliðtenging.

== 3\. Raðtengdar snertur
<raðtengdar-snertur>
Prófum nú að breyta tengingunni.

#box(image("myndir/mynd-4.png", width: 50pt)) #box(image("myndir/mynd-5.png", width: 63pt))

#emph[Mynd 4 og 5: Raðtengdar snertur A og B. Til hægri er þrýst á báðar og ljósið logar.]

Til þess að ljósið Y fái straum er ljóst að það verður að þrýsta á bæði A og B. Við getum táknað það með $Y eq A$ #strong[OG] $B$, þ.e. það þarf að þrýsta á báða samtímis til að fá ljós á Y. Þetta er kallað að raðtengja A og B því þeir koma í lóðréttri röð.

Hvað ef við bætum við þriðju snertunni, C, neðan við B? Þá er ljóst að það þarf að ýta á allar þrjár, A, B og C, til að fá ljós.

Þetta getum við táknað með $Y eq A$ #strong[OG] $B$ #strong[OG] $C$, þ.e. allar þrjár snerturnar verða að vera lokaðar. Svona virkar raðtenging.

== 4\. Lokaðar snertur
<lokaðar-snertur>
Snertur eru af tveimur gerðum. Önnur gerðin er kölluð opin snerta (#strong[NO] \= #emph[Normally Open]). Hún leiðir ekki straum nema þrýst sé á hana.

Hin gerðin kallast lokuð snerta (#strong[NC] \= #emph[Normally Closed]). Hún leiðir straum ef ekki er þrýst á hana. Sé þrýst á hana hættir hún að leiða straum.

#align(center)[#table(
  columns: 4,
  align: (col, row) => (center,center,center,center,).at(col),
  inset: 6pt,
  [#box(image("myndir/mynd-6.png", width: 63pt))], [#box(image("myndir/mynd-7.png", width: 77pt))], [#box(image("myndir/mynd-8.png", width: 67pt))], [#box(image("myndir/mynd-9.png", width: 91pt))],
  [Mynd 6: Opin snerta A í hlutlausri stöðu],
  [Mynd 7: Opin snerta A í virkri stöðu],
  [Mynd 8: Lokuð snerta A í hlutlausri stöðu],
  [Mynd 9: Lokuð snerta A í virkri stöðu],
)
]

Opin snerta A kveikir ljós Y þegar þrýst er á hana.

Lokuð snerta A slekkur ljós Y þegar þrýst er á hana. Lokuð snerta leiðir straum þegar #strong[EKKI] er þrýst á hana. Við getum lýst þessu með $Y eq$ #strong[EKKI] $A$, þ.e. það má ekki þrýsta á A ef ljósið á að vera kveikt.

== 5\. Sambland hliðtengingar, raðtengingar og opinna og lokaðra snerta
<sambland-hliðtengingar-raðtengingar-og-opinna-og-lokaðra-snerta>
Oftast eru rásir sambland af hliðtengingu og raðtengingu og með bæði opnar og lokaðar snertur. Tökum dæmi.

#figure(image("myndir/mynd-10.png", width: 61pt), caption: [Mynd 10: A og B hliðtengdar og raðtengdar við C.], numbering: none)
Til að kveikja á ljósi Y þarf að þrýsta á (A #strong[EÐA] B) #strong[OG] C. Við getum táknað það með $Y eq paren.l A$ #strong[EÐA] $B paren.r$ #strong[OG] $C$.

Tökum annað dæmi.

#figure(image("myndir/mynd-11.png", width: 61pt), caption: [Mynd 11: A og B hliðtengdar og raðtengdar við lokaða snertu C.], numbering: none)
Til að kveikja á ljósi Y verður að þrýsta á A eða B og ekki á C. Þetta má tákna með $Y eq paren.l A$ #strong[EÐA] $B paren.r$ #strong[OG EKKI] $C$.

Sjáum að hliðtenging er #strong[EÐA], raðtenging #strong[OG] og lokuð snerta #strong[EKKI].

Við munum kynnast nýjum rithætti á næstu blaðsíðum þar sem #strong[EÐA] er skilgreint sem samlagning, #strong[OG] sem margföldun og #strong[EKKI] með striki yfir bókstaf.

== 6\. Grunnhliðin OR, AND og NOT
<grunnhliðin-or-and-og-not>
#strong[Hlið] eru rásir sem herma eftir ákveðnum tengingum, svo sem lokaðri snertu, hliðtengingu opinna og lokaðra snerta, raðtengingu opinna og lokaðra snerta og blönduðum tengingum opinna og lokaðra snerta.

Hlið eru táknuð með kassa. Vinstra megin á kassann koma inngangar hliðsins. Þeir eru minnst einn en oftast fleiri. Inngangar þjóna sama tilgangi í rökrásum og snertur og skynjarar í segulliðastýringum. Öll grunnhliðin hafa síðan einn útgang sem við táknum með bókstafnum Y í þessari bók. Útgangurinn kemur hægra megin út úr kassanum. Á hverjum kassa er síðan tákn sem segir til um hvað hliðið gerir (hvernig það virkar).

#figure(image("myndir/mynd-12.png", width: 113pt), caption: [Mynd 12: Dæmi um hlið með þrjá innganga, A, B og C, og útganginn Y.], numbering: none)
Virkni hvers hliðs er lýst með sannleikstöflu hliðsins sem segir hvernig útgangurinn hegðar sér í samræmi við stöðu innganganna.

=== 6.1 Hvernig búum við til sannleikstöflur?
<hvernig-búum-við-til-sannleikstöflur>
#blockquote[
Hvert hlið hefur sína #strong[sannleikstöflu].

Í sannleikstöflum eru settar upp allar mögulegar stöður sem upp geta komið á inngöngum hliðanna og sýnt hvernig útgangurinn breytist í samræmi við stöður innganganna.

Hlið sem hefur tvo innganga getur haft fjórar mismunandi stöður og hlið sem hefur þrjá innganga getur haft átta mismunandi stöður.

Fjöldi lína í sannleikstöflu er $2^(upright("fjöldi innganga"))$.
]

Notum OR-hlið til skýringar. Við fáum síðar nánari skýringu á því hvað OR-hlið gerir. Einn inngangur getur bara haft tvær stöður, 0 eða 1 (#emph[off] eða #emph[on]). Ef við bætum við inngöngum fjölgar mögulegum stöðum innganganna sem margfeldi af tveimur. Dálkurinn lengst til hægri (útgangurinn) sýnir hvaða gildi útgangurinn tekur miðað við ákveðnar stöður á inngöngunum. Af því að þetta er OR-hlið skoðar það hvort inngangur A #strong[EÐA] B sé virkur (1). Þessi kafli fjallar samt meira um það hvernig við gerum sannleikstöflu (stöðutöflu) innganganna.

#strong[Tveir inngangar, A og B: fjórar stöður, $2^2 eq 4$, og því hefur taflan fjórar línur.]

#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [Inngangur A (gildi $2 eq 2^1$)], [Inngangur B (gildi $1 eq 2^0$)], [Útgangur $Y eq A plus B$],
  [0],
  [0],
  [0],
  [0],
  [1],
  [1],
  [1],
  [0],
  [1],
  [1],
  [1],
  [1],
)
]

Sá inngangur sem er næst útganginum #strong[Y] er gildisminnsti inngangurinn (LSB). Í þessu tilfelli er það inngangur #strong[B]. Hann breytist hraðast og myndar mynstrið 0-1-0-1 niður á við. Sá sem er næst honum til vinstri, í þessu tilfelli inngangur #strong[A], er gildismeiri og skiptir því bara um stöðu í annað hvert skipti og myndar því mynstrið 0-0-1-1 niður á við. Almenna reglan er sú að inngangurinn næst útganginum #strong[Y] (LSB) skiptir um stöðu í hverri línu, sá næsti til vinstri skiptir helmingi hægar, sá næsti vinstra megin við hann skiptir fjórum sinnum hægar o.s.frv.

#strong[Þrír inngangar, A, B og C: átta stöður, $2^3 eq 8$, og því átta línur.]

#align(center)[#table(
  columns: 4,
  align: (col, row) => (center,center,center,center,).at(col),
  inset: 6pt,
  [Inngangur A (gildi $4 eq 2^2$)], [Inngangur B (gildi $2 eq 2^1$)], [Inngangur C (gildi $1 eq 2^0$)], [Útgangur $Y eq A plus B plus C$],
  [0],
  [0],
  [0],
  [0],
  [0],
  [0],
  [1],
  [1],
  [0],
  [1],
  [0],
  [1],
  [0],
  [1],
  [1],
  [1],
  [1],
  [0],
  [0],
  [1],
  [1],
  [0],
  [1],
  [1],
  [1],
  [1],
  [0],
  [1],
  [1],
  [1],
  [1],
  [1],
)
]

Hér er inngangur #strong[C] gildisminnstur (LSB). Hann skiptir því um stöðu í hverri línu og býr til mynstrið 0-1-0-1-0-1-0-1 niður á við.

Inngangur #strong[B] er næstgildisminnstur. Hann endurtekur mynstrið 0-0-1-1-0-0-1-1 niður á við.

Inngangur #strong[A] er gildismestur (MSB) og skiptir um stöðu fjórum sinnum hægar en inngangur #strong[C] og myndar mynstrið 0-0-0-0-1-1-1-1 niður á við.

#strong[Fjórir inngangar, A, B, C og D: sextán stöður, $2^4 eq 16$, og því sextán línur.]

#align(center)[#table(
  columns: 5,
  align: (col, row) => (center,center,center,center,center,).at(col),
  inset: 6pt,
  [A (gildi $8 eq 2^3$)], [B (gildi $4 eq 2^2$)], [C (gildi $2 eq 2^1$)], [D (gildi $1 eq 2^0$)], [$Y eq A plus B plus C plus D$],
  [0],
  [0],
  [0],
  [0],
  [0],
  [0],
  [0],
  [0],
  [1],
  [1],
  [0],
  [0],
  [1],
  [0],
  [1],
  [0],
  [0],
  [1],
  [1],
  [1],
  [0],
  [1],
  [0],
  [0],
  [1],
  [0],
  [1],
  [0],
  [1],
  [1],
  [0],
  [1],
  [1],
  [0],
  [1],
  [0],
  [1],
  [1],
  [1],
  [1],
  [1],
  [0],
  [0],
  [0],
  [1],
  [1],
  [0],
  [0],
  [1],
  [1],
  [1],
  [0],
  [1],
  [0],
  [1],
  [1],
  [0],
  [1],
  [1],
  [1],
  [1],
  [1],
  [0],
  [0],
  [1],
  [1],
  [1],
  [0],
  [1],
  [1],
  [1],
  [1],
  [1],
  [0],
  [1],
  [1],
  [1],
  [1],
  [1],
  [1],
)
]

Hér er inngangur #strong[D] gildisminnstur (LSB) og myndar mynstrið 0-1-0-1-0-1-0-1-0-1-0-1-0-1-0-1.

- #strong[C] myndar rununa 0-0-1-1 til skiptis,
- #strong[B] myndar rununa 0-0-0-0-1-1-1-1 til skiptis og
- #strong[A], sem er gildismesti inngangurinn (MSB), myndar rununa 0-0-0-0-0-0-0-0-1-1-1-1-1-1-1-1, þ.e. $8 dot.op 0$ og $8 dot.op 1$ til skiptis.

#strong[Samband gildis inngangsins og mynstursins af 0 og 1 sem inngangurinn myndar:]

#align(center)[#table(
  columns: 2,
  align: (col, row) => (center,left,).at(col),
  inset: 6pt,
  [Gildi inngangs], [Mynstur],
  [1],
  [$1 dot.op 0$ og $1 dot.op 1$ til skiptis],
  [2],
  [$2 dot.op 0$ og $2 dot.op 1$ til skiptis],
  [4],
  [$4 dot.op 0$ og $4 dot.op 1$ til skiptis],
  [8],
  [$8 dot.op 0$ og $8 dot.op 1$ til skiptis],
)
]

=== 6.2 OR-hlið (EÐA-hlið)
<or-hlið-eða-hlið>
#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [DIN-staðall], [ANSI-staðall], [Útgangsjafna],
  [#box(image("myndir/mynd-13.png", width: 82pt))],
  [#box(image("myndir/mynd-14.png", width: 85pt))],
  [$Y eq A plus B$],
  [Mynd 13: Tákn fyrir tveggja innganga OR-hlið í DIN-staðli. A og B eru inngangar (vinstri hlið) og Y er útgangur (hægri hlið). Táknið ≥1 hefur ákveðna þýðingu: ef einn eða fleiri inngangar eru 1 er útgangurinn 1\.],
  [Mynd 14: Tákn fyrir tveggja innganga OR-hlið í ANSI-staðli. Táknið hefur enga augljósa merkingu.],
  [Útgangsjafna tveggja innganga OR-hliðs],
)
]

#strong[OR-hlið] er rás sem hefur tvo eða fleiri innganga. Útgangur hennar (Y) verður hár (1) #strong[ef] einn eða fleiri inngangar eru háir (sjá táknið á hliðinu). Á íslensku hefur þetta verið nefnt EÐA-hlið, þ.e. útgangurinn verður hár ef A EÐA B (eða báðir) eru háir.

Ef OR-hlið hefur 3 innganga breytist útgangsjafna þess í $Y eq A plus B plus C$ og sannleikstaflan hefur $2^3 eq 8$ línur.

Tveggja innganga OR-hlið hefur eftirfarandi sannleikstöflu. A og B eru inngangarnir. Þeir eru tveir og sannleikstaflan hefur því $2^2 eq 4$ línur. Tveir inngangar geta því haft fjórar ólíkar stöður.

#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [$Y eq A plus B$],
  [0],
  [0],
  [0],
  [0],
  [1],
  [1],
  [1],
  [0],
  [1],
  [1],
  [1],
  [1],
)
]

#emph[Sannleikstafla fyrir tveggja innganga OR-hlið.]

Það kann að þykja einkennilegt út frá jöfnunni $Y eq A plus B$ að í neðstu línunni fáum við $1 plus 1 eq 1$ en hafa ber í huga að við erum ekki að vinna með venjulega algebru hér heldur svokallaða Boole-algebru (#emph[Boolean algebra]) og 1 táknar hér ákveðið spennugildi (eða rökgildi) en ekki töluna 1\.

#figure(image("myndir/mynd-15.png", width: 62pt), caption: [Mynd 15: Rofarás sem lýsir OR-virkni.], numbering: none)
#blockquote[
OR-virkni má lýsa með rofarásinni á mynd 15\. Táknum inngangana með rofunum A og B. Lokaður rofi leiðir straum og hefur þá gildið 1 en opinn rofi gildið 0\. Ef A #strong[EÐA] B #strong[EÐA] báðir eru lokaðir (1) lýsir peran (Y). #strong[OR]-virkni jafngildir því hliðtengingu opinna snerta í rofarás.
]

Líka má lýsa virkni OR-hliðs með svokallaðri díóðulógík, þ.e. hvernig búa má til OR-virkni með díóðurás.

#figure(image("myndir/mynd-16.png", width: 102pt), caption: [Mynd 16: OR-virkni búin til með díóðurás (díóðulógík).], numbering: none)
=== 6.3 AND-hlið (OG-hlið)
<and-hlið-og-hlið>
#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [DIN-staðall], [ANSI-staðall], [Útgangsjafna],
  [#box(image("myndir/mynd-17.png", width: 81pt))],
  [#box(image("myndir/mynd-18.png", width: 83pt))],
  [$Y eq A B$],
  [Mynd 17: Tákn fyrir tveggja innganga AND-hlið í DIN-staðli. Táknið #strong[&] hefur ákveðna þýðingu: ef inngangarnir A #strong[OG] B eru báðir 1 er útgangurinn 1\.],
  [Mynd 18: Tákn fyrir tveggja innganga AND-hlið í ANSI-staðli. Táknið hefur enga augljósa merkingu.],
  [Útgangsjafna AND-hliðs],
)
]

AND-hlið er rás sem hefur tvo eða fleiri innganga. Útgangur hennar (Y) verður hár ef allir inngangar hennar eru háir, þ.e. A #strong[OG] B #strong[OG] C #strong[OG] … Þess vegna er AND-hlið kallað #strong[OG]-hlið á íslensku.

Útgangsjafna tveggja innganga AND-hliðs er $Y eq A B$.

$A B$ þýðir A sinnum B, en eins og hefð er fyrir í stærðfræði er margföldunartákninu oftast sleppt.

Tveggja innganga AND-hlið hefur eftirfarandi sannleikstöflu.

#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [$Y eq A B$],
  [0],
  [0],
  [0],
  [0],
  [1],
  [0],
  [1],
  [0],
  [0],
  [1],
  [1],
  [1],
)
]

Sjáum að útgangurinn Y verður ekki 1 fyrr en bæði A #strong[OG] B verða 1\.

Þriggja innganga AND-hlið hefur útgangsjöfnuna $Y eq A B C$.

Fjögurra innganga AND-hlið hefur útgangsjöfnuna $Y eq A B C D$ o.s.frv.

#figure(image("myndir/mynd-19.png", width: 61pt), caption: [Mynd 19: Rofarás sem lýsir AND-virkni.], numbering: none)
#blockquote[
AND-virkni má lýsa með rofarásinni á mynd 19\. Táknum inngangana með rofunum A og B. Lokaður rofi leiðir straum og hefur þá gildið 1 en opinn rofi gildið 0\. Ef A #strong[OG] B eru báðir lokaðir (1) lýsir peran (Y). AND-virkni jafngildir því raðtengingu opinna snerta í rofarás.
]

=== 6.4 NOT-hlið (EKKI-hlið)
<not-hlið-ekki-hlið>
#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [DIN-staðall], [ANSI-staðall], [Útgangsjafna],
  [#box(image("myndir/mynd-20.png", width: 80pt))],
  [#box(image("myndir/mynd-21.png", width: 80pt))],
  [$Y eq overline(A)$],
  [Mynd 20: Tákn fyrir NOT-hlið í DIN-staðli. Táknið #strong[1] hefur ákveðna þýðingu. NOT-hlið hefur aðeins einn inngang.],
  [Mynd 21: Tákn fyrir NOT-hlið í ANSI-staðli. Táknið hefur enga augljósa merkingu.],
  [Strik fyrir ofan bókstaf táknar neitun eða #strong[EKKI].],
)
]

NOT-hlið hefur einfalda virkni. Það breytir 0 í 1 og 1 í 0, þ.e. það snýr öllu við sem kemur inn. Hringur eða þríhyrningur á útgangi þýðir viðsnúningur (#emph[inverting]).

NOT-hlið hefur eftirfarandi sannleikstöflu.

#align(center)[#table(
  columns: 2,
  align: (col, row) => (center,center,).at(col),
  inset: 6pt,
  [A], [$Y eq overline(A)$],
  [0],
  [1],
  [1],
  [0],
)
]

#figure(image("myndir/mynd-22.png", width: 61pt), caption: [Mynd 22: Rofarás sem lýsir NOT-virkni.], numbering: none)
#blockquote[
NOT-virkni má lýsa með rofarásinni á mynd 22\. Táknum innganginn með rofanum A. Lokaður rofi leiðir straum og hefur þá gildið 1 en opinn rofi gildið 0\. Ef $overline(A)$ er lokaður ($overline(0) eq 1$) lýsir peran (Y). NOT-virkni jafngildir því lokaðri snertu í rofarás. Ef #strong[EKKI] er ýtt á rofa A er ljós á peru Y.
]

== 7\. Samsettu hliðin NOR og NAND
<samsettu-hliðin-nor-og-nand>
=== 7.1 NOR-hlið (EKKI-EÐA-hlið)
<nor-hlið-ekki-eða-hlið>
#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [DIN-staðall], [ANSI-staðall], [Útgangsjafna],
  [#box(image("myndir/mynd-23.png", width: 84pt))],
  [#box(image("myndir/mynd-24.png", width: 82pt))],
  [$Y eq overline(A plus B)$],
  [Mynd 23: Tákn fyrir tveggja innganga NOR-hlið í DIN-staðli. Táknið ≥1 hefur ákveðna þýðingu: ef einn eða fleiri inngangar eru 1 er útgangurinn 0 (akkúrat öfugt við OR).],
  [Mynd 24: Tákn fyrir tveggja innganga NOR-hlið í ANSI-staðli. Táknið hefur enga augljósa merkingu.],
  [Útgangsjafna NOR-hliðs],
)
]

NOR-hlið er ekkert annað en OR-hlið með útganginn tengdan í gegnum NOT-hlið.

#figure(image("myndir/mynd-25.png", width: 255pt), caption: [Mynd 25: NOR-hlið jafngildir OR-hliði með NOT-hliði á útgangi.], numbering: none)
Útgangsjafnan er því útgangsjafna OR-hliðs, viðsnúin. Sannleikstaflan verður því sannleikstafla OR-hliðs, viðsnúin.

#align(center)[#table(
  columns: 4,
  align: (col, row) => (center,center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [OR: $Y eq A plus B$], [NOR: $Y eq overline(A plus B)$],
  [0],
  [0],
  [0],
  [1],
  [0],
  [1],
  [1],
  [0],
  [1],
  [0],
  [1],
  [0],
  [1],
  [1],
  [1],
  [0],
)
]

#emph[Sannleikstafla OR-hliðs og NOR-hliðs.]

#figure(image("myndir/mynd-26.png", width: 67pt), caption: [Mynd 26: Rofarás sem lýsir NOR-virkni.], numbering: none)
#blockquote[
NOR-virkni má lýsa með rofarásinni á mynd 26\. Táknum inngangana með rofunum A og B. Lokaður rofi leiðir straum og hefur þá gildið 1 en opinn rofi gildið 0\. Ef $overline(A)$ og $overline(B)$ eru lokaðir ($overline(0) eq 1$) lýsir peran (Y), annars er hún slökkt. Um leið og við breytum stöðu A- eða B-rofans slökknar ljósið. NOR-virkni jafngildir því raðtengingu lokaðra snerta í rofarás. Þetta er afleiðing reglu De Morgans sem verður kynnt síðar: $overline(A plus B) eq overline(A) dot.op overline(B)$.
]

=== 7.2 NAND-hlið (EKKI-OG-hlið)
<nand-hlið-ekki-og-hlið>
#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [DIN-staðall], [ANSI-staðall], [Útgangsjafna],
  [#box(image("myndir/mynd-27.png", width: 85pt))],
  [#box(image("myndir/mynd-28.png", width: 84pt))],
  [$Y eq overline(A B)$],
  [Mynd 27: Tákn fyrir tveggja innganga NAND-hlið í DIN-staðli. Táknið #strong[&] hefur ákveðna þýðingu: ef einn eða fleiri inngangar eru 0 er útgangurinn 1 (öfugt við AND).],
  [Mynd 28: Tákn fyrir tveggja innganga NAND-hlið í ANSI-staðli. Táknið hefur enga augljósa merkingu.],
  [Útgangsjafna NAND-hliðs],
)
]

NAND-hlið er ekkert annað en AND-hlið með útganginn tengdan í gegnum NOT-hlið.

#figure(image("myndir/mynd-29.png", width: 257pt), caption: [Mynd 29: NAND-hlið jafngildir AND-hliði með NOT-hliði á útgangi.], numbering: none)
Útgangsjafnan er því útgangsjafna AND-hliðs, viðsnúin. Sannleikstaflan verður því sannleikstafla AND-hliðs, viðsnúin.

#align(center)[#table(
  columns: 4,
  align: (col, row) => (center,center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [AND: $Y eq A B$], [NAND: $Y eq overline(A B)$],
  [0],
  [0],
  [0],
  [1],
  [0],
  [1],
  [0],
  [1],
  [1],
  [0],
  [0],
  [1],
  [1],
  [1],
  [1],
  [0],
)
]

#emph[Sannleikstafla AND-hliðs og NAND-hliðs.]

#figure(image("myndir/mynd-30.png", width: 70pt), caption: [Mynd 30: Rofarás sem lýsir NAND-virkni.], numbering: none)
#blockquote[
NAND-virkni má lýsa með rofarásinni á mynd 30\. Táknum inngangana með rofunum A og B. Lokaður rofi leiðir straum og hefur þá gildið 1 en opinn rofi gildið 0\. Ef $overline(A)$ #strong[EÐA] $overline(B)$ er lokaður ($overline(0) eq 1$) lýsir peran (Y), annars er hún slökkt. Um leið og við breytum stöðu bæði A- og B-rofans slökknar ljósið. NAND-virkni jafngildir því hliðtengingu lokaðra snerta í rofarás. Þetta er afleiðing reglu De Morgans sem verður kynnt síðar: $overline(A B) eq overline(A) plus overline(B)$.
]

== 8\. XOR og XNOR
<xor-og-xnor>
=== 8.1 XOR-hlið
<xor-hlið>
#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [DIN-staðall], [ANSI-staðall], [Útgangsjafna],
  [#box(image("myndir/mynd-31.png", width: 82pt))],
  [#box(image("myndir/mynd-32.png", width: 82pt))],
  [$Y eq A xor B eq overline(A) B plus A overline(B)$],
  [Mynd 31: Tákn fyrir XOR-hlið í DIN-staðli. Táknið #strong[\=1] hefur ákveðna þýðingu: ef nákvæmlega einn inngangur er 1 er útgangurinn 1\. Þetta er því hið eiginlega EÐA-hlið (#emph[Exclusive OR] \= XOR).],
  [Mynd 32: Tákn fyrir XOR-hlið í ANSI-staðli. Táknið hefur enga augljósa merkingu.],
  [Útgangsjafna XOR-hliðs],
)
]

Sannleikstafla XOR-hliðs:

#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [$Y eq A xor B eq overline(A) B plus A overline(B)$],
  [0],
  [0],
  [0],
  [0],
  [1],
  [1],
  [1],
  [0],
  [1],
  [1],
  [1],
  [0],
)
]

Sjáum að þegar inngangar XOR-hliðs eru ekki eins er útgangurinn $Y eq 1$.

Þessu má lýsa með eftirfarandi rofarás.

#figure(image("myndir/mynd-33.png", width: 58pt), caption: [Mynd 33: Rofarás sem lýsir XOR-virkni.], numbering: none)
=== 8.2 XNOR-hlið
<xnor-hlið>
#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [DIN-staðall], [ANSI-staðall], [Útgangsjafna],
  [#box(image("myndir/mynd-34.png", width: 83pt))],
  [#box(image("myndir/mynd-35.png", width: 80pt))],
  [$Y eq overline(A xor B) eq overline(A) thin overline(B) plus A B$],
  [Mynd 34: Tákn fyrir XNOR-hlið í DIN-staðli. Táknið #strong[\=] hefur ákveðna þýðingu: ef inngangarnir eru eins er útgangurinn 1\.],
  [Mynd 35: Tákn fyrir XNOR-hlið í ANSI-staðli. Táknið hefur enga augljósa merkingu.],
  [Útgangsjafna XNOR-hliðs],
)
]

Sannleikstafla XNOR-hliðs:

#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [$Y eq overline(A xor B) eq overline(A) thin overline(B) plus A B$],
  [0],
  [0],
  [1],
  [0],
  [1],
  [0],
  [1],
  [0],
  [0],
  [1],
  [1],
  [1],
)
]

Sjáum að þegar inngangar XNOR-hliðs eru eins er útgangurinn $Y eq 1$.

Virkni XNOR-hliðs má skýra með eftirfarandi rofarás.

#figure(image("myndir/mynd-36.png", width: 68pt), caption: [Mynd 36: Rofarás sem lýsir XNOR-virkni.], numbering: none)
== 9\. Neitun á inngangi og útgangi
<neitun-á-inngangi-og-útgangi>
=== 9.1 Neitun á inngangi
<neitun-á-inngangi>
#strong[(Inngöngum er snúið við áður en hliðið framkvæmir aðgerð sína.)]

Hvernig túlkum við neitun á inngangi?

#align(center)[#table(
  columns: 2,
  align: (col, row) => (center,left,).at(col),
  inset: 6pt,
  [Rás], [Skýring],
  [#box(image("myndir/mynd-37.png", width: 128pt))],
  [Mynd 37: Hér er engin neitun, hvorki á inngangi né útgangi.],
  [#box(image("myndir/mynd-38.png", width: 127pt))],
  [Mynd 38: Hér er neitun á inngangi B sem þýðir að honum er snúið við áður en OR-hliðið leggur saman.],
  [#box(image("myndir/mynd-39.png", width: 124pt))],
  [Mynd 39: Hér er neitun á inngangi A sem þýðir að honum er snúið við áður en OR-hliðið leggur saman.],
  [#box(image("myndir/mynd-40.png", width: 127pt))],
  [Mynd 40: Hér er neitun á inngöngum A og B sem þýðir að þeim er báðum snúið við áður en OR-hliðið leggur saman.],
)
]

=== 9.2 Neitun á útgangi
<neitun-á-útgangi>
#strong[(Útganginum er snúið við eftir að hliðið hefur framkvæmt aðgerð sína.)]

#figure(image("myndir/mynd-41.png", width: 153pt), caption: [Mynd 41: Neitun á útgangi.], numbering: none)
- Efst: Hér leggjum við saman A og B (#strong[OR]) og snúum síðan útkomunni við: #strong[NOR].
- Í miðju: Hér margföldum við saman A og B (#strong[AND]) og snúum síðan útkomunni við: #strong[NAND].
- Neðst: Hér er #strong[XOR]-aðgerðin framkvæmd fyrst og síðan er útkomunni snúið við: #strong[XNOR].

=== 9.3 Skiptir máli hvort neitunin er á inngangi eða útgangi?
<skiptir-máli-hvort-neitunin-er-á-inngangi-eða-útgangi>
Til þess að finna svarið við því þarf að skrifa niður sannleikstöflur beggja möguleika og bera þær saman. Tökum dæmi.

#figure(image("myndir/mynd-42.png", width: 316pt), caption: [Mynd 42: Er $overline(A) plus overline(B)$ það sama og
$overline(A plus B)$?], numbering: none)
Er þetta það sama? Skiptir máli hvort neitunin kemur á innganga OR-hliðs eða við notum bara NOR-hlið?

#align(center)[#table(
  columns: 4,
  align: (col, row) => (center,center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [$Y eq overline(A) plus overline(B)$], [$Y eq overline(A plus B)$],
  [0],
  [0],
  [1],
  [1],
  [0],
  [1],
  [1],
  [0],
  [1],
  [0],
  [1],
  [0],
  [1],
  [1],
  [0],
  [0],
)
]

Sjáum að rásirnar hafa ekki sömu sannleikstöflu og eru því ekki eins. #strong[Það skiptir því máli hvort neitunin er á inngangi eða útgangi.]

== 10\. Samtenging rökrásahliða, útgangsjöfnur
<samtenging-rökrásahliða-útgangsjöfnur>
Skoðum rásina á myndinni hér að neðan. Hvernig getum við fundið útganginn Y á svona samtengdri rás?

#figure(image("myndir/mynd-43.png", width: 386pt), caption: [Mynd 43: Rásin í DIN-staðli (til vinstri) og sama rás í ANSI-staðli (til
hægri).], numbering: none)
Við byrjum á því að skoða útgangsjöfnur allra hliðanna fyrir framan síðasta hliðið (OR-hliðið). OR-hliðið leggur síðan saman alla þessa útganga og sú summa myndar útganginn Y.

Skoðum fyrst reglu sem kennd er við De Morgan.

#blockquote[
#strong[Regla De Morgans segir okkur að við megum klippa í sundur stórar neitanir en við verðum þá að breyta margföldun í samlagningu eða samlagningu í margföldun.]
]

#strong[Regla De Morgans 1:] $overline(A plus B) eq overline(A) dot.op overline(B)$. Þegar við klippum í sundur stóra neitun yfir samlagningu breytist plús í margföldun.

#strong[Regla De Morgans 2:] $overline(A B) eq overline(A) plus overline(B)$. Þegar við klippum í sundur stóra neitun yfir margföldun breytist margföldun í plús.

Næst skulum við átta okkur á því að tvöföld neitun jafngildir engri neitun og þreföld neitun jafngildir einni neitun:

$ overline(overline(A)) eq A #h(2em) overline(overline(overline(A))) eq overline(A) $

Þetta þýðir almennt að:

- Slétttölufjöldi (jafntölufjöldi) neitana jafngildir engri neitun.
- Oddatölufjöldi neitana jafngildir einni neitun.
- Það má klippa stórar neitanir á fleiri en einum stað.

Tökum dæmi:

$ overline(overline(A) plus B plus overline(C)) eq overline(overline(A)) dot.op overline(B) dot.op overline(overline(C)) eq A dot.op overline(B) dot.op C eq A overline(B) C $

#figure(image("myndir/mynd-44.png", width: 386pt), caption: [Mynd 44: Útgangsjafna samtengdu rásarinnar.], numbering: none)
Útganginn á neðsta hliðinu (NOR) má einfalda með reglu De Morgans eins og gert er á myndinni. Útgangsjafnan verður þá

$ Y eq overline(A) B C plus A B overline(C) plus overline(A) B overline(C) $

því síðasta hliðið leggur saman innganga sína.

Næst búum við til sannleikstöflu með 8 línum. Fjöldi innganga er 3 og $2^3 eq 8$. Við gerum sérstakan dálk fyrir hvern inngang sem kemur inn á síðasta hliðið (#strong[OR]). Fyrir liðinn $overline(A) B C$ leitum við að línunni 011 í sannleikstöflunni, fyrir $A B overline(C)$ að línunni 110 og fyrir $overline(A) B overline(C)$ að línunni 010\. Bara á þessum stöðum kemur 1 í útkomu vegna AND-virkninnar, annars 0\. Lokaútkoman er síðan summa (vegna OR-hliðsins) hverrar línu í sannleikstöflunni.

#align(center)[#table(
  columns: 7,
  align: (col, row) => (center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [C], [$overline(A) B C$], [$A B overline(C)$], [$overline(A) B overline(C)$], [$Y$],
  [0],
  [0],
  [0],
  [0],
  [0],
  [0],
  [0],
  [0],
  [0],
  [1],
  [0],
  [0],
  [0],
  [0],
  [#strong[0]],
  [#strong[1]],
  [#strong[0]],
  [0],
  [0],
  [#strong[1]],
  [#strong[1]],
  [#strong[0]],
  [#strong[1]],
  [#strong[1]],
  [#strong[1]],
  [0],
  [0],
  [#strong[1]],
  [1],
  [0],
  [0],
  [0],
  [0],
  [0],
  [0],
  [1],
  [0],
  [1],
  [0],
  [0],
  [0],
  [0],
  [#strong[1]],
  [#strong[1]],
  [#strong[0]],
  [0],
  [#strong[1]],
  [0],
  [#strong[1]],
  [1],
  [1],
  [1],
  [0],
  [0],
  [0],
  [0],
)
]

#strong[Annað dæmi:]

#figure(image("myndir/mynd-45.png", width: 182pt), caption: [Mynd 45: Annað dæmi um samtengda rás.], numbering: none)
Byrjum á því að skrifa útgangsjöfnur hliðanna þriggja á undan OR-hliðinu. OR-hliðið leggur síðan saman þær útkomur.

#figure(image("myndir/mynd-46.png", width: 182pt), caption: [Mynd 46: Útgangsjöfnur hliðanna.], numbering: none)
Fyrir $overline(A) thin overline(B) C$ leitum við að línunni 001 því það er eina línan sem gefur 1 fyrir þá jöfnu. Fyrir $A B C$ leitum við að línunni 111\. Fyrir XOR-hliðið (neðst) munum við að það gefur bara 1 á útgang þegar inngangarnir eru ekki eins. Við þurfum því að skoða dálkana fyrir #strong[A] og #strong[B] og skoða hvenær #strong[A] og #strong[B] eru ekki eins.

Útkoman er:

$ Y eq overline(A) thin overline(B) C plus A B C plus A xor B $

Sannleikstaflan er því:

#align(center)[#table(
  columns: 7,
  align: (col, row) => (center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [C], [$overline(A) thin overline(B) C$], [$A B C$], [$A xor B$], [$Y$],
  [0],
  [0],
  [0],
  [0],
  [0],
  [0],
  [0],
  [#strong[0]],
  [#strong[0]],
  [#strong[1]],
  [#strong[1]],
  [0],
  [0],
  [#strong[1]],
  [#strong[0]],
  [#strong[1]],
  [0],
  [0],
  [0],
  [#strong[1]],
  [#strong[1]],
  [#strong[0]],
  [#strong[1]],
  [1],
  [0],
  [0],
  [#strong[1]],
  [#strong[1]],
  [#strong[1]],
  [#strong[0]],
  [0],
  [0],
  [0],
  [#strong[1]],
  [#strong[1]],
  [#strong[1]],
  [#strong[0]],
  [1],
  [0],
  [0],
  [#strong[1]],
  [#strong[1]],
  [1],
  [1],
  [0],
  [0],
  [0],
  [0],
  [0],
  [#strong[1]],
  [#strong[1]],
  [#strong[1]],
  [0],
  [#strong[1]],
  [0],
  [#strong[1]],
)
]

Við lærum síðar hvernig hægt er að einfalda svona rásir annaðhvort með #strong[Boole-algebru] eða #strong[Karnaugh-korti] (3. hefti).

== 11\. NOR-lógík
<nor-lógík>
Er hægt að búa til öll rökrásahlið bara með NOR-hliðum? Svarið er já, það er hægt. Skoðum möguleikana.

#figure(image("myndir/mynd-47.png", width: 331pt), caption: [Mynd 47: NOT, OR, AND og NAND búin til eingöngu úr NOR-hliðum.], numbering: none)
Þegar við tengjum saman tvo innganga í einn virkar það eins og einn inngangur. Þannig er hægt að búa til NOT-hlið úr NOR-hliði.

Er hægt að búa til öll hlið með NAND-hliðum? Er til NAND-lógík? (Sjá verkefni 6.)

== 12\. Rásir teiknaðar eftir rökrásajöfnum
<rásir-teiknaðar-eftir-rökrásajöfnum>
Hvernig teiknum við rás ef við fáum gefna rökrásajöfnu? Við byrjum á að skoða hvort liðir eða þættir jöfnunnar eru tengdir saman með samlagningu eða margföldun. Séu þeir settir saman með samlagningu endar rásin á OR-hliði. Sé rásin sett saman með margföldun endar hún á AND-hliði. Við vinnum sem sagt frá hægri til vinstri, eða frá útgangi til innganga.

#strong[Dæmi 1]

$ Y eq overline(A) B C plus A B overline(C) plus A overline(B) C $

Þessi jafna er sett saman með samlagningu og endar því á OR-hliði. Það sem kemur inn á OR-hliðið er útkoma úr þremur AND-hliðum sem mynda margfeldin. Við þurfum því OR-hlið með þremur inngöngum og þrjú AND-hlið með þremur inngöngum hvert. Að síðustu þurfum við þrjú NOT-hlið til að búa til neitanir á inngöngum (á myndinni eru þær sýndar sem hringir á inngöngum).

#figure(image("myndir/mynd-48.png", width: 106pt), caption: [Mynd 48: Rás teiknuð eftir jöfnunni í dæmi 1\.], numbering: none)
#strong[Dæmi 2]

$ Y eq lr((A plus B plus overline(C))) dot.op lr((A plus overline(B) plus C)) $

Sjáum að þetta er margfeldi tveggja summa. Rásin endar því á AND-hliði en summurnar eru búnar til með tveimur OR-hliðum. Að lokum þurfum við tvö NOT-hlið fyrir neitanirnar á C og B.

#figure(image("myndir/mynd-49.png", width: 117pt), caption: [Mynd 49: Rás teiknuð eftir jöfnunni í dæmi 2\.], numbering: none)
== 13\. Verkefni
<verkefni>
#strong[(Ekki nota bara svörin, það er sjálfsblekking.)]

#strong[1\.] Hvað heita rásirnar?

#align(center)[#table(
  columns: 4,
  align: (col, row) => (center,center,center,center,).at(col),
  inset: 6pt,
  [I)], [II)], [III)], [IV)],
  [#box(image("myndir/mynd-50.png", width: 72pt))],
  [#box(image("myndir/mynd-51.png", width: 81pt))],
  [#box(image("myndir/mynd-52.png", width: 80pt))],
  [#box(image("myndir/mynd-53.png", width: 77pt))],
  [Mynd 50],
  [Mynd 51],
  [Mynd 52],
  [Mynd 53],
)
]

#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [V)], [VI)], [VII)],
  [#box(image("myndir/mynd-54.png", width: 83pt))],
  [#box(image("myndir/mynd-55.png", width: 86pt))],
  [#box(image("myndir/mynd-56.png", width: 91pt))],
  [Mynd 54],
  [Mynd 55],
  [Mynd 56],
)
]

Hver er útgangsjafna þeirra?

I) $D eq$ \
II) $F eq$ \
III) $I eq$ \
IV) $L eq$ \
V) $P eq$ \
VI) $T eq$ \
VII) $W eq$

Fyllið út í sannleikstöflurnar.

#align(center)[#table(
  columns: 15,
  align: (col, row) => (center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [C], [D], [], [E], [F], [], [G], [H], [I], [], [J], [K], [L],
  [0],
  [0],
  [0],
  [],
  [],
  [0],
  [],
  [],
  [0],
  [0],
  [],
  [],
  [0],
  [0],
  [],
  [0],
  [0],
  [1],
  [],
  [],
  [1],
  [],
  [],
  [0],
  [1],
  [],
  [],
  [0],
  [1],
  [],
  [0],
  [1],
  [0],
  [],
  [],
  [],
  [],
  [],
  [1],
  [0],
  [],
  [],
  [1],
  [0],
  [],
  [0],
  [1],
  [1],
  [],
  [],
  [],
  [],
  [],
  [1],
  [1],
  [],
  [],
  [1],
  [1],
  [],
  [1],
  [0],
  [0],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [1],
  [0],
  [1],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [1],
  [1],
  [0],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [1],
  [1],
  [1],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
)
]

#align(center)[#table(
  columns: 12,
  align: (col, row) => (center,center,center,center,center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [M], [N], [O], [P], [], [R], [S], [T], [], [U], [V], [W],
  [0],
  [0],
  [0],
  [],
  [],
  [0],
  [0],
  [],
  [],
  [0],
  [0],
  [],
  [0],
  [0],
  [1],
  [],
  [],
  [0],
  [1],
  [],
  [],
  [0],
  [1],
  [],
  [0],
  [1],
  [0],
  [],
  [],
  [1],
  [0],
  [],
  [],
  [1],
  [0],
  [],
  [0],
  [1],
  [1],
  [],
  [],
  [1],
  [1],
  [],
  [],
  [1],
  [1],
  [],
  [1],
  [0],
  [0],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [1],
  [0],
  [1],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [1],
  [1],
  [0],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [1],
  [1],
  [1],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
)
]

#strong[2\.] Finnið útgangsjöfnu rásarinnar og fyllið síðan út í sannleikstöfluna. Þið getið notað #strong[reglu De Morgans] til að einfalda útkomu NOR-hliðsins.

#figure(image("myndir/mynd-57.png", width: 201pt), caption: [Mynd 57: Rásin í verkefni 2\.], numbering: none)
#align(center)[#table(
  columns: 4,
  align: (col, row) => (center,center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [C], [$Y eq$],
  [0],
  [0],
  [0],
  [],
  [0],
  [0],
  [1],
  [],
  [0],
  [1],
  [0],
  [],
  [0],
  [1],
  [1],
  [],
  [1],
  [0],
  [0],
  [],
  [1],
  [0],
  [1],
  [],
  [1],
  [1],
  [0],
  [],
  [1],
  [1],
  [1],
  [],
)
]

#strong[3\.] Hvernig breytist sannleikstaflan í verkefni 2 við þessa breytingu á rásinni?

#figure(image("myndir/mynd-58.png", width: 201pt), caption: [Mynd 58: Breytt rás (verkefni 3).], numbering: none)
#strong[4\.] Gera þessar rásir sama hlutinn? Skrifið útgangsjöfnur þeirra og notið síðan #strong[reglu De Morgans] á NOR-hliðið.

#figure(image("myndir/mynd-59.png", width: 207pt), caption: [Mynd 59: Rásirnar í verkefni 4\.], numbering: none)
#strong[5\.] Er sama hvort við setjum neitanir á innganga AND-hliðs eða notum bara NAND-hlið?

#strong[6\.] Sýnið fram á að hægt sé að búa til NOT, OR, NOR og AND með því að nota eingöngu NAND-hlið (NAND-lógík).

#strong[7\.] Teiknið rás eftir eftirfarandi jöfnu:

$ Y eq A overline(B) C plus overline(A) B C $

#strong[8\.] Teiknið rás eftir eftirfarandi jöfnu:

$ Y eq overline(A) thin overline(B) C plus A B overline(C) plus A xor B plus overline(B xor C) $

== 14\. Svör
<svör>
#strong[1\.] I) AND, II) NOT, III) XOR, IV) OR, V) NOR, VI) NAND, VII) XNOR.

Útgangsjöfnurnar eru:

$ D eq A B C #h(2em) F eq overline(E) #h(2em) I eq G xor H #h(2em) L eq J plus K $

$ P eq overline(M plus N plus O) #h(2em) T eq overline(R S) #h(2em) W eq overline(U xor V) $

#align(center)[#table(
  columns: 15,
  align: (col, row) => (center,center,center,center,center,center,center,center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [C], [#strong[D]], [], [E], [#strong[F]], [], [G], [H], [#strong[I]], [], [J], [K], [#strong[L]],
  [0],
  [0],
  [0],
  [#strong[0]],
  [],
  [0],
  [#strong[1]],
  [],
  [0],
  [0],
  [#strong[0]],
  [],
  [0],
  [0],
  [#strong[0]],
  [0],
  [0],
  [1],
  [#strong[0]],
  [],
  [1],
  [#strong[0]],
  [],
  [0],
  [1],
  [#strong[1]],
  [],
  [0],
  [1],
  [#strong[1]],
  [0],
  [1],
  [0],
  [#strong[0]],
  [],
  [],
  [],
  [],
  [1],
  [0],
  [#strong[1]],
  [],
  [1],
  [0],
  [#strong[1]],
  [0],
  [1],
  [1],
  [#strong[0]],
  [],
  [],
  [],
  [],
  [1],
  [1],
  [#strong[0]],
  [],
  [1],
  [1],
  [#strong[1]],
  [1],
  [0],
  [0],
  [#strong[0]],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [1],
  [0],
  [1],
  [#strong[0]],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [1],
  [1],
  [0],
  [#strong[0]],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [1],
  [1],
  [1],
  [#strong[1]],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
)
]

#align(center)[#table(
  columns: 12,
  align: (col, row) => (center,center,center,center,center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [M], [N], [O], [#strong[P]], [], [R], [S], [#strong[T]], [], [U], [V], [#strong[W]],
  [0],
  [0],
  [0],
  [#strong[1]],
  [],
  [0],
  [0],
  [#strong[1]],
  [],
  [0],
  [0],
  [#strong[1]],
  [0],
  [0],
  [1],
  [#strong[0]],
  [],
  [0],
  [1],
  [#strong[1]],
  [],
  [0],
  [1],
  [#strong[0]],
  [0],
  [1],
  [0],
  [#strong[0]],
  [],
  [1],
  [0],
  [#strong[1]],
  [],
  [1],
  [0],
  [#strong[0]],
  [0],
  [1],
  [1],
  [#strong[0]],
  [],
  [1],
  [1],
  [#strong[0]],
  [],
  [1],
  [1],
  [#strong[1]],
  [1],
  [0],
  [0],
  [#strong[0]],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [1],
  [0],
  [1],
  [#strong[0]],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [1],
  [1],
  [0],
  [#strong[0]],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [1],
  [1],
  [1],
  [#strong[0]],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
)
]

#figure(image("myndir/mynd-60.png", width: 202pt), caption: [Mynd 60: Útgangsjöfnur hliðanna í verkefni 2\.], numbering: none)
#strong[2\.] $Y eq overline(A) B C plus A B overline(C) plus A overline(B) C$, því samkvæmt reglu De Morgans er $overline(overline(A) plus B plus overline(C)) eq A overline(B) C$.

#align(center)[#table(
  columns: 7,
  align: (col, row) => (center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [C], [$overline(A) B C$], [$A B overline(C)$], [$A overline(B) C$], [$Y$],
  [0],
  [0],
  [0],
  [0],
  [0],
  [0],
  [#strong[0]],
  [0],
  [0],
  [1],
  [0],
  [0],
  [0],
  [#strong[0]],
  [0],
  [1],
  [0],
  [0],
  [0],
  [0],
  [#strong[0]],
  [0],
  [1],
  [1],
  [#strong[1]],
  [0],
  [0],
  [#strong[1]],
  [1],
  [0],
  [0],
  [0],
  [0],
  [0],
  [#strong[0]],
  [1],
  [0],
  [1],
  [0],
  [0],
  [#strong[1]],
  [#strong[1]],
  [1],
  [1],
  [0],
  [0],
  [#strong[1]],
  [0],
  [#strong[1]],
  [1],
  [1],
  [1],
  [0],
  [0],
  [0],
  [#strong[0]],
)
]

#strong[3\.] Öll gildi útgangsins Y víxlast, 0 verður 1 og 1 verður 0\.

#strong[4\.] Vinstri rásin hefur útgangsjöfnuna $overline(A) B C$ og hægri rásin $overline(A plus overline(B) plus overline(C))$. Ef við beitum reglu De Morgans á hægri rásina fæst

$ overline(A plus overline(B) plus overline(C)) eq overline(A) dot.op overline(overline(B)) dot.op overline(overline(C)) eq overline(A) B C $

sem er sama útkoma og hjá rásinni vinstra megin. Þessar rásir gera því það sama.

#strong[5\.] Tökum sem dæmi þriggja innganga AND-hlið. Ef við setjum neitun á alla innganga verður útgangurinn $Y eq overline(A) thin overline(B) thin overline(C)$. Ef við setjum bara neitun á útganginn verður útgangsjafnan $Y eq overline(A B C)$ sem er útgangsjafna NAND-hliðs. Er þetta sama virknin? Prófum að beita reglu De Morgans á seinni jöfnuna:

$ overline(A B C) eq overline(A) plus overline(B) plus overline(C) $

Þetta er því greinilega ekki sama virknin.

#strong[6\.]

#figure(image("myndir/mynd-61.png", width: 258pt), caption: [Mynd 61: NOT, AND, OR og NOR búin til eingöngu úr NAND-hliðum.], numbering: none)
#strong[7\.] $Y eq A overline(B) C plus overline(A) B C$

#figure(image("myndir/mynd-62.png", width: 192pt), caption: [Mynd 62: Lausn á verkefni 7\.], numbering: none)
#strong[8\.] $Y eq overline(A) thin overline(B) C plus A B overline(C) plus A xor B plus overline(B xor C)$

#figure(image("myndir/mynd-63.png", width: 140pt), caption: [Mynd 63: Lausn á verkefni 8\.], numbering: none)
