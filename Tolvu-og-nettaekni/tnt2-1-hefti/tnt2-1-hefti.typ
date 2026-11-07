// Sjálfvirkt búið til úr Markdown-skjalinu með pandoc og _verkfaeri/rafbok.lua.
// Breytið frekar .md-skránni og keyrið _verkfaeri/byggja.sh.

#let titill = [Tölvu- og nettækni]
#let undirtitill = [Talnakerfin, reikniaðgerðir og kóðar]
#let afangi = [TNT2 – 1\. hefti]
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

== 1\. Tugakerfið (decimal)
<tugakerfið-decimal>
Rökrásir og öll lógík í rafmagnsfræði byggjast á tveimur stöðum. Það eru stöðurnar #strong[lokuð straumrás] og #strong[opin straumrás] eða #strong[spenna og ekki spenna]. Til þess að lýsa þessu er notað talnakerfi sem hefur aðeins tvær stöður, 0 og 1, þar sem 0 táknar annaðhvort opna straumrás eða enga spennu og 1 táknar lokaða straumrás eða spennu. Þetta talnakerfi kallast tvíundarkerfi eða #strong[binary numbers] á ensku.

Áður en við hættum okkur í tvíundarkerfið og önnur kerfi skulum við fyrst skoða talnakerfi almennt og uppbyggingu þeirra. Þá liggur beinast við að skoða fyrst það kerfi sem við þekkjum best, #strong[tugakerfið].

Eins og við vitum byggist tugakerfið upp á einingum, tugum, hundruðum, þúsundum o.s.frv. Skoðum einhverja venjulega tugakerfistölu og spáum í uppbyggingu hennar. Tökum sem dæmi töluna #strong[325]. Við vitum að þetta eru #strong[3] hundruð, #strong[2] tugir og #strong[5] einingar. Ef við köllum staðsetningu táknanna í tölunni #emph[sæti] þá er talan #strong[5] í sætinu lengst til hægri, sem ég kalla eftirleiðis 0\. sæti, #strong[2] er þá í 1\. sæti og #strong[3] í 2\. sæti. Við sjáum að tugirnir, sem eru í 1\. sæti, eru 10 sinnum stærri en einingarnar og hundruðin í 2\. sæti eru 10 sinnum stærri en tugirnir. Munurinn á milli sæta er því alltaf tífaldur: 1, 10, 100, 1000, … og þess vegna heitir þetta #strong[tuga]kerfi.

Nú skulum við skilgreina svokallaða margföldunarstuðla. Við segjum að 0\. sætið hafi margföldunarstuðulinn 1 (eining), 1\. sætið hefur margföldunarstuðulinn 10 (tugur), 2\. sætið hefur margföldunarstuðulinn 100 (hundruð) og þannig koll af kolli. Ef við gerumst nú stærðfræðileg þá hefur 0\. sætið stuðulinn $10^0$, 1\. sætið stuðulinn $10^1$ og 2\. sætið stuðulinn $10^2$. Nú er kerfið komið, þ.e. hvert sæti hefur margföldunarstuðulinn $10^(upright("númer sætis"))$. Athugið að tala í 0\. veldi er alltaf 1, sama hver talan er, nema 0\.

#strong[Svona eru öll talnakerfi byggð upp.] Þau hafa öll ákveðna grunntölu sem þau eru nefnd eftir. Tugakerfið hefur grunntöluna #strong[10]. Þau hafa öll ákveðinn fjölda tákna sem er sá sami og grunntalan. Tugakerfið hefur t.d. 10 tákn, tölurnar 0, 1, 2, 3, 4, 5, 6, 7, 8 og 9\. Í hvert sæti má aðeins koma eitt tákn og í tugakerfinu er það einhver af tölunum 0 til 9\. Táknið í sætinu margfaldast síðan með margföldunarstuðli sætisins.

Þetta hljómar flókið en svona eru öll talnakerfi byggð upp. Við erum orðin svo vön því að nota tugakerfið að við leiðum aldrei hugann að uppbyggingu þess. Ef við hins vegar áttum okkur á henni er lítið mál að læra ný talnakerfi.

=== 1.1 Samantekt um tugakerfið
<samantekt-um-tugakerfið>
- Grunntala \= 10
- Fjöldi tákna \= 10 (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)

#strong[Uppbygging tugakerfisins (fjögur fyrstu sætin)]

#align(center)[#table(
  columns: 5,
  align: (col, row) => (left,center,center,center,center,).at(col),
  inset: 6pt,
  [Sæti nr.], [3], [2], [1], [0],
  [#strong[Margföldunarstuðull]],
  [1000 ($10^3$)],
  [100 ($10^2$)],
  [10 ($10^1$)],
  [1 ($10^0$)],
)
]

#strong[Dæmi:]

$ 793 eq 7 dot.op 10^2 plus 9 dot.op 10^1 plus 3 dot.op 10^0 eq 7 dot.op 100 plus 9 dot.op 10 plus 3 dot.op 1 eq 700 plus 90 plus 3 eq 793_10 $

Fótskriftin $""_10$ tilgreinir í hvaða talnakerfi við erum að vinna.

Tugakerfið hefur líka brothluta, þ.e. tölur aftan við kommu. Þær fylgja líka ákveðnu kerfi. Við tölum um $1 / 10$, $1 / 100$, $1 / 1000$ o.s.frv. Sjáum að nefnarinn stækkar tífalt eftir því sem við förum lengra til hægri. Það er vegna þess að við erum í talnakerfi með grunntöluna 10\. Tölur vinstra megin við kommu stækka tífalt við hvert sæti en tölur hægra megin við kommu minnka tífalt við hvert sæti. Uppbyggingin lítur svona út:

#align(center)[#table(
  columns: 9,
  align: (col, row) => (center,center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [1000], [100], [10], [1], [,], [0,1], [0,01], [0,001], [0,0001],
  [$10^3$],
  [$10^2$],
  [$10^1$],
  [$10^0$],
  [,],
  [$10^(minus 1)$],
  [$10^(minus 2)$],
  [$10^(minus 3)$],
  [$10^(minus 4)$],
  [],
  [],
  [],
  [],
  [],
  [$1 / 10$],
  [$1 / 100$],
  [$1 / 1000$],
  [$1 / 10000$],
)
]

Talan 17,53 er því

$ 17","53 eq 1 dot.op 10 plus 7 dot.op 1 #h(0em) lr((plus)) #h(0em) 5 dot.op 0","1 plus 3 dot.op 0","01 $

þar sem $lr((plus))$ táknar viðbótina aftan við kommu.

=== 1.2 Tvíundarkerfið (binary)
<tvíundarkerfið-binary>
Tvíundarkerfið hefur nákvæmlega sömu uppbyggingu og tugakerfið.

- Grunntala \= 2
- Fjöldi tákna \= 2 (0 og 1)
- 0\. sætið hefur margföldunarstuðulinn 1 (eins og reyndar í öllum talnakerfum),
- 1\. sætið hefur stuðulinn 2,
- 2\. sætið hefur stuðulinn 4,
- 3\. sætið hefur stuðulinn 8 o.s.frv.

#strong[Gildið á milli sæta tvöfaldast:] 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, …

#strong[Uppbygging tvíundarkerfisins (fjögur fyrstu sætin)]

#align(center)[#table(
  columns: 5,
  align: (col, row) => (left,center,center,center,center,).at(col),
  inset: 6pt,
  [Sæti nr.], [3], [2], [1], [0],
  [#strong[Margföldunarstuðull]],
  [8 ($2^3$)],
  [4 ($2^2$)],
  [2 ($2^1$)],
  [1 ($2^0$)],
)
]

Hvert tákn kallast einn #strong[biti] í tvíundarkerfi. Tala eins og 1011 kallast fjögurra bita tala.

Skoðum tvíundarkerfistöluna $1101_2$. Hér eftir nota ég fótskrift (#emph[subscript]) til þess að tákna talnakerfið sem talan er skrifuð í. Fótskriftin $""_2$ þýðir þá tvíundarkerfi.

#align(center)[#table(
  columns: 5,
  align: (col, row) => (left,center,center,center,center,).at(col),
  inset: 6pt,
  [Sæti nr.], [3], [2], [1], [0],
  [#strong[Tala]],
  [#strong[1]],
  [#strong[1]],
  [#strong[0]],
  [#strong[1]],
  [#strong[Margföldunarstuðull]],
  [8 ($2^3$)],
  [4 ($2^2$)],
  [2 ($2^1$)],
  [1 ($2^0$)],
)
]

Ef við umbreytum nú tvíundarkerfistölunni $1101_2$ í tugakerfistölu verður útkoman:

$ 1 dot.op 8 plus 1 dot.op 4 plus 0 dot.op 2 plus 1 dot.op 1 eq 8 plus 4 plus 0 plus 1 eq 13_10 $

Við höfum því fundið leið til þess að geyma tugakerfistöluna 13 sem runu af 0 og 1, eða sem rununa: spenna – spenna – ekki spenna – spenna \= 1101\.

#strong[Á þessu byggist tölvutæknin og öll stafræn tækni.]

Sjáum líka að allar oddatölur í tvíundarkerfi enda á 1 og sléttar tölur á 0 því aftasta sætið er eina sætið sem hefur oddatölu (1) sem margföldunarstuðul.

Hvernig getum við vitað fyrir fram hve marga bita við þurfum til þess að tákna einhverja ákveðna tugakerfistölu?

Með einum bita getum við bara táknað 0 og 1\. Stærsta tala sem við getum táknað með tveimur bitum er talan 11 sem jafngildir 3 í tugakerfi, stærsta þriggja bita talan er 111 sem jafngildir 7 í tugakerfi. Ef þessar tugakerfistölur eru bornar saman við margföldunarstuðla tvíundarkerfisins sést að þær eru jafnar næsta margföldunarstuðli fyrir ofan, mínus 1\. Út frá þessu kemur regla:

#blockquote[
Stærsta tugakerfistala sem hægt er að skrifa með $n$ bitum er $2^n minus 1$.
]

#strong[Dæmi:] Hver er stærsta tala sem hægt er að skrifa með 8 bitum?

$ 2^8 minus 1 eq 256 minus 1 eq 255 $

8 bitar (1 bæti) geta því táknað 256 ólíkar stöður (0 til 255 eða 00000000 til 11111111).

Eins og í tugakerfinu eru líka til kommutölur í tvíundarkerfinu. Þær fylgja nákvæmlega sömu reglum og í tugakerfinu. Tölur vinstra megin við kommu tvöfaldast við hvert sæti en tölur hægra megin við kommu minnka um helming við hvert sæti. Uppbyggingin er þessi:

#align(center)[#table(
  columns: 9,
  align: (col, row) => (center,center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [8], [4], [2], [1], [,], [0,5], [0,25], [0,125], [0,0625],
  [$2^3$],
  [$2^2$],
  [$2^1$],
  [$2^0$],
  [,],
  [$2^(minus 1)$],
  [$2^(minus 2)$],
  [$2^(minus 3)$],
  [$2^(minus 4)$],
  [],
  [],
  [],
  [],
  [],
  [$1 / 2$],
  [$1 / 4$],
  [$1 / 8$],
  [$1 / 16$],
)
]

Talan $1011","1010_2$ er því:

$ 1 dot.op 8 plus 0 dot.op 4 plus 1 dot.op 2 plus 1 dot.op 1 #h(0em) lr((plus)) #h(0em) 1 dot.op 0","5 plus 0 dot.op 0","25 plus 1 dot.op 0","125 plus 0 dot.op 0","0625 eq 11","625_10 $

þar sem $lr((plus))$ táknar viðbótina aftan við kommu.

=== 1.3 Sextándukerfið (hexadecimal)
<sextándukerfið-hexadecimal>
Síðasta talnakerfið sem við skoðum er sextándukerfið. Það er hannað í kringum tvíundarkerfið og notað til þess að birta fjögurra bita tvíundartölu með einu tákni. En tugakerfið hefur bara 10 tákn og sextándukerfið þarf 16 tákn. Við verðum því að grípa til þess að fá að láni sex bókstafi, stafina A, B, C, D, E og F.

Sextándukerfistala getur því verið sambland af tölustöfum og bókstöfum. A táknar þá 10, B \= 11, C \= 12, D \= 13, E \= 14 og F \= 15\.

Eins og venjulega hefur 0\. sætið margföldunarstuðulinn 1\. Grunntalan er 16 svo að 1\. sætið hefur margföldunarstuðulinn 16, 2\. sætið stuðulinn $16^2 eq 256$ o.s.frv. Margföldunarstuðlarnir #strong[sextánfaldast] á milli sæta: 1, 16, 256, 4096, …

Tökum sem dæmi sextándukerfistöluna $upright(13 A C)_16$.

#align(center)[#table(
  columns: 5,
  align: (col, row) => (left,center,center,center,center,).at(col),
  inset: 6pt,
  [Sæti nr.], [3], [2], [1], [0],
  [#strong[Tala]],
  [1],
  [3],
  [A],
  [C],
  [#strong[Margföldunarstuðull]],
  [4096 ($16^3$)],
  [256 ($16^2$)],
  [16 ($16^1$)],
  [1 ($16^0$)],
)
]

$ upright(13 A C)_16 & eq 1 dot.op 4096 plus 3 dot.op 256 plus upright(A) thin lr((10)) dot.op 16 plus upright(C) thin lr((12)) dot.op 1\
 & eq 1 dot.op 4096 plus 3 dot.op 256 plus 10 dot.op 16 plus 12 dot.op 1\
 & eq 4096 plus 768 plus 160 plus 12 eq 5036_10 $

Við eigum eftir að sjá síðar að það er mjög þægilegt að breyta á milli tvíundarkerfis og sextándukerfis. Eina kerfið sem veldur okkur vandræðum er tugakerfið.

Sextándukerfið hefur líka kommutölur eins og tugakerfið og tvíundarkerfið. Það er líka byggt eins upp. Tölur vinstra megin við kommu sextánfaldast við hvert sæti en tölur hægra megin við kommu minnka sextánfalt við hvert sæti.

#strong[Sextán fyrstu tölurnar í þremur talnakerfum]

#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [Tugakerfi], [Tvíundarkerfi], [Sextándukerfi],
  [0],
  [0000],
  [0],
  [1],
  [0001],
  [1],
  [2],
  [0010],
  [2],
  [3],
  [0011],
  [3],
  [4],
  [0100],
  [4],
  [5],
  [0101],
  [5],
  [6],
  [0110],
  [6],
  [7],
  [0111],
  [7],
  [8],
  [1000],
  [8],
  [9],
  [1001],
  [9],
  [10],
  [1010],
  [A],
  [11],
  [1011],
  [B],
  [12],
  [1100],
  [C],
  [13],
  [1101],
  [D],
  [14],
  [1110],
  [E],
  [15],
  [1111],
  [F],
)
]

=== 1.4 Farið á milli talnakerfa
<farið-á-milli-talnakerfa>
Það er nauðsynlegt að kunna að umreikna á milli talnakerfa. Yfirleitt er þetta ekkert mál nema þegar tugakerfið kemur við sögu. Við skulum byrja á því að skoða hvernig við breytum úr og í tugakerfi.

==== Úr tugakerfi í tvíundarkerfi
<úr-tugakerfi-í-tvíundarkerfi>
Hér er hægt að nota tvær aðferðir. Í fyrsta lagi ágiskunaraðferðina (raðað í sæti) þegar um litlar tölur er að ræða. Þá reynum við að mynda summu úr margföldunarstuðlum tvíundarkerfisins.

#strong[Tökum dæmi:] Við ætlum að tákna tugakerfistöluna 25 í tvíundarkerfi. Við sjáum að $25 eq 16 plus 8 plus 0 plus 0 plus 1$. Af þessu leiðir að $25_10 eq 11001_2$.

Sú aðferð sem meira er notuð, því hún hefur þann kost að virka alltaf, líka fyrir stórar tölur, auk þess sem hún er forritanleg, er endurtekin deiling með 2\.

Hún virkar þannig að við deilum tugakerfistölunni með 2\. Við fáum þá heiltölu fyrir framan kommu og brothluta fyrir aftan kommu. Þessi brothluti er alltaf 0,0 eða 0,5. Við tökum brothlutann og margföldum hann með 2 og fáum þá annaðhvort 0 eða 1\. Heiltöluhlutinn færist niður og aftur er deilt með 2\. Þessu höldum við áfram þangað til heiltalan er 1 en þá færist hún sjálfkrafa niður enda ekki hægt að deila 1 með 2\. Þetta er auðveldara að skýra með dæmi.

Breytum $25_10$ í tvíundarkerfistölu:

#figure(image("myndir/mynd-1.png", width: 181pt), caption: [Mynd 1: Endurtekin deiling með 2\. Útkoman er lesin neðan frá og upp.], numbering: none)
Útkoman er síðan lesin neðan frá og upp og er $11001_2$, eða $25_10 eq 11001_2$.

==== Úr tvíundarkerfi í tugakerfi
<úr-tvíundarkerfi-í-tugakerfi>
Leggjum saman margföldunarstuðla þeirra sæta sem innihalda töluna 1\. $10110110_2$ er átta bita tala (eitt bæti). Hún hefur margföldunarstuðlana, talið frá vinstri til hægri:

#align(center)[#table(
  columns: 8,
  align: (col, row) => (center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [128], [64], [32], [16], [8], [4], [2], [1],
  [1],
  [0],
  [1],
  [1],
  [0],
  [1],
  [1],
  [0],
)
]

En það er 0 í sumum sætum og þau eru ekki talin með í summunni.

#strong[Dæmi:] $10110110_2 eq 128 plus 32 plus 16 plus 4 plus 2 eq 182_10$.

Við getum séð fyrir fram að útkoman verður slétt tala því $10110110_2$ endar á 0\.

==== Úr tugakerfi í sextándukerfi
<úr-tugakerfi-í-sextándukerfi>
Hér er aðferðin endurtekin deiling með 16 þangað til heiltöluhlutinn er orðinn minni en 16\. Brothlutinn er margfaldaður með 16 í hverju skrefi og sú tala er geymd.

#strong[Dæmi:] Breytum $1736_10$ í sextándukerfi.

#figure(image("myndir/mynd-2.png", width: 228pt), caption: [Mynd 2: Endurtekin deiling með 16\.], numbering: none)
Við fáum tölurnar 6, 12 og 8\. En 12 er táknað með C í sextándukerfi svo svarið verður 6C8, eða $1736_10 eq upright(6 C 8)_16$.

==== Úr sextándukerfi í tugakerfi
<úr-sextándukerfi-í-tugakerfi>
Margföldum hvert tákn í sextándukerfistölunni með margföldunarstuðli sætisins og leggjum síðan saman.

#strong[Dæmi:] $upright(2 F C)_16 eq quest_10$

$ upright(2 F C)_16 eq 2 dot.op 256 plus 15 dot.op 16 plus 12 dot.op 1 eq 512 plus 240 plus 12 eq 764_10 $

#strong[Athugið:] Við verðum að breyta bókstöfunum í tölur áður en við reiknum: #strong[F \= 15] og #strong[C \= 12].

==== Úr sextándukerfi í tvíundarkerfi
<úr-sextándukerfi-í-tvíundarkerfi>
Hvert tákn í sextándukerfi má tákna með fjögurra bita tvíundarkerfistölu. Við tökum einfaldlega hvert tákn tölunnar, breytum því í 4 bita og skeytum saman. Ef það eru eitt eða fleiri núll fremst í tölunni má fjarlægja þau.

#strong[Dæmi:] $upright(2 F C)_16 eq quest_2$: 2 \= 0010, F \= 1111, C \= 1100\. Nú skeytum við þessum tölum saman í réttri röð frá vinstri til hægri:

$ upright(2 F C)_16 eq 0010 thin 1111 thin 1100_2 eq 1011111100_2 $

Við hendum tveimur fremstu núllunum burt því þau hafa enga merkingu. Þetta er einfalt vegna þess að sextándukerfið er sérsniðið að tvíundarkerfinu.

==== Úr tvíundarkerfi í sextándukerfi
<úr-tvíundarkerfi-í-sextándukerfi>
Við byrjum lengst til hægri og tökum fjóra fyrstu bitana, talið frá hægri til vinstri, og breytum þeim í sextándukerfistölu. Síðan tökum við fjóra næstu og svo koll af kolli.

#strong[Dæmi:] $10101101_2 eq quest_16$. Fjórir öftustu bitarnir eru 1101 \= D. Næstu fjórir eru 1010 \= A. Svarið er því $1010 thin 1101_2 eq upright(A D)_16$.

Þetta er einfalt því þessi kerfi eru sniðin hvort að öðru.

En ef bitafjöldinn er ekki margfeldi af 4, t.d. $1011010110_2$ sem er 10 bita tala? Þá er aðferðin sú að bæta tveimur núllum framan við töluna og breyta henni í 12 bita tölu:

$ 1011010110_2 eq bold(00) 10 thin 1101 thin 0110_2 $

Öftustu fjórir bitarnir eru þá 0110 \= 6, næstu fjórir eru 1101 \= D og fremstu fjórir eru 0010 \= 2\. Ef við skeytum þessu saman frá vinstri til hægri fæst:

$ 1011010110_2 eq upright(2 D 6)_16 $

Ef við fáum t.d. 15 bita tölu má breyta henni í 16 bita tölu með því að bæta einu núlli framan við hana.

Það er þægilegast að hafa tölurnar 4 bita, 8 bita, 12 bita, 16 bita o.s.frv. en það er ekki nauðsynlegt.

=== 1.5 Samlagning í tvíundarkerfi
<samlagning-í-tvíundarkerfi>
Í samlagningu í tvíundarkerfi gilda eftirfarandi reglur:

$ 0 plus 0 & eq 0\
0 plus 1 & eq 1\
1 plus 0 & eq 1\
1 plus 1 & eq 0 quad upright("og 1 flyst til vinstri")\
1 plus 1 plus 1 & eq 1 quad upright("og 1 flyst til vinstri") $

#strong[Dæmi:] Leggjum saman $5_10 plus 7_10 eq 12_10$ á tvíundarformi.

$5_10 eq 101_2$ og $7_10 eq 111_2$. Svarið á að vera $12_10 eq 1100_2$.

#align(center)[#table(
  columns: 6,
  align: (col, row) => (center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [],
  [#emph[geymt]],
  [#emph[1]],
  [#emph[1]],
  [#emph[1]],
  [],
  [],
  [],
  [],
  [1],
  [0],
  [1],
  [(5)],
  [\+],
  [],
  [1],
  [1],
  [1],
  [(7)],
  [\=],
  [#strong[1]],
  [#strong[1]],
  [#strong[0]],
  [#strong[0]],
  [(12)],
)
]

Línan #emph[geymt] sýnir þá bita sem flytjast til vinstri (í frumritinu eru þeir rauðir).

#strong[Dæmi:] Leggjum saman $14_10 plus 9_10 eq 23_10$ á tvíundarformi.

$14_10 eq 1110_2$ og $9_10 eq 1001_2$. Svarið á að vera $23_10 eq 10111_2$.

#align(center)[#table(
  columns: 7,
  align: (col, row) => (center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [$2^4$], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [],
  [#emph[geymt]],
  [#emph[1]],
  [#emph[0]],
  [#emph[0]],
  [#emph[0]],
  [],
  [],
  [],
  [],
  [1],
  [1],
  [1],
  [0],
  [(14)],
  [\+],
  [],
  [1],
  [0],
  [0],
  [1],
  [(9)],
  [\=],
  [#strong[1]],
  [#strong[0]],
  [#strong[1]],
  [#strong[1]],
  [#strong[1]],
  [(23)],
)
]

Síðar lærum við að búa til rökrás sem framkvæmir samlagningu og frádrátt í tvíundarkerfi.

=== 1.6 Frádráttur í tvíundarkerfi
<frádráttur-í-tvíundarkerfi>
Hugsum okkur að við kunnum enga aðra stærðfræðilega aðgerð en samlagningu. Hvernig förum við þá að því að draga frá, margfalda og deila? Við vitum að í stærðfræði getum við táknað frádráttinn $5 minus 3$ sem samlagninguna $5 plus lr((minus 3))$. Þetta þýðir að ef við getum búið til töluna $minus 3$ getum við notað aðgerðina samlagningu. Við leggjum þá saman en hirðum ekki alla útkomuna, og fremsti bitinn táknar þá formerki útkomunnar en telst ekki með í tölunni.

Til eru sambærileg dæmi fyrir tugakerfi. Það er t.d. það sama að reikna $9 minus 4 eq 5$ og að reikna $9 plus 6 eq 15$ og henda 1\. Þetta gildir vegna þess að $10 minus 4 eq 6$ ($4_10 eq 6_(a 10)$, þ.e. 6 er tugaandhverfa 4).

En hvernig förum við að því að búa til neikvæðar tölur í tvíundarkerfi? Það eru til tvær aðferðir sem heita andhverfuform 1 (#emph[one’s complement]) og andhverfuform 2 (#emph[two’s complement]), táknað a1 og a2.

==== Andhverfuform 1 (einandhverfa)
<andhverfuform-1-einandhverfa>
Andhverfuform 1 er fengið með því að breyta öllum 1 í tvíundarkerfistölunni í 0 og öllum 0 í 1\.

#strong[Dæmi a:] $1001_2$ verður $0110_(a 1)$.

#strong[Dæmi b:] Reiknum $9_10 minus 7_10$ á tvíundarformi. Tugakerfistalan $7_10$ er $0111_2$ (bitafjöldinn miðast við stærri töluna í dæminu, sem er 9, og því notum við 4 bita). Andhverfuform 1 af $0111_2$ er $1000_(a 1)$.

Ef við drögum $7_10$ frá $9_10$ er það gert á eftirfarandi hátt: Breytum $7_10$ í $0111_2$ og þaðan í $1000_(a 1)$. Breytum síðan $9_10$ í $1001_2$. Leggjum síðan þessar tölur saman (línan #emph[geymt] sýnir flutta bita).

#align(center)[#table(
  columns: 8,
  align: (col, row) => (center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [formerki], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [form], [],
  [#emph[geymt]],
  [#emph[1]],
  [#emph[0]],
  [#emph[0]],
  [#emph[0]],
  [],
  [],
  [],
  [],
  [],
  [1],
  [0],
  [0],
  [1],
  [2],
  [(9)],
  [\+],
  [],
  [1],
  [0],
  [0],
  [0],
  [a1],
  [(−7)],
  [\=],
  [#strong[1]],
  [0],
  [0],
  [0],
  [1],
  [a1],
  [(2)],
)
]

Nú vitum við að ef við drögum fjögurra bita tölu frá fjögurra bita tölu getur útkoman ekki orðið fimm bita tala. Bitinn lengst til vinstri (formerkisbitinn, blár í frumritinu) er 1 og táknar að formerkið á útkomunni er +. Svarið kemur á andhverfuformi 1 sem $plus 0001_(a 1)$.

Það sem við þurfum að gera núna til að sannfæra okkur um að rétt hafi verið reiknað er að breyta útkomunni í tvíundarkerfistölu. Það er gert með því að bæta 1 við útkomuna. $0001_(a 1)$ verður $0001_(a 1) plus 1 eq 0010_2 eq 2_10$ sem er rétt svar því $9_10 minus 7_10 eq 2_10$.

#strong[Dæmi c:] Prófum að draga $9_10$ frá $7_10$. Hér ætti útkoman að vera $minus 2_10$.

$9_10 eq 1001_2 eq 0110_(a 1)$ og $7_10 eq 0111_2$.

#align(center)[#table(
  columns: 8,
  align: (col, row) => (center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [formerki], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [form], [],
  [#emph[geymt]],
  [#emph[0]],
  [#emph[1]],
  [#emph[1]],
  [#emph[0]],
  [],
  [],
  [],
  [],
  [],
  [0],
  [1],
  [1],
  [1],
  [2],
  [(7)],
  [\+],
  [],
  [0],
  [1],
  [1],
  [0],
  [a1],
  [(−9)],
  [\=],
  [#strong[0]],
  [1],
  [1],
  [0],
  [1],
  [a1],
  [(−2)],
)
]

Bitinn lengst til vinstri í svarinu er 0 sem þýðir að útkoman er neikvæð tala. Svarið kemur á andhverfuformi 1 sem $minus 1101_(a 1)$. Snúum öllum bitum tölunnar við og fáum $minus 1101_(a 1) eq minus 0010_2 eq minus 2_10$ sem er rétt svar.

#blockquote[
#strong[Túlkun á svari úr frádrætti með andhverfuformi 1]

I. Ef bitinn lengst til vinstri er 1 er svarið jákvæð tala og svarið á tvíundarformi fæst með því að bæta 1 við svarið sem fékkst með andhverfuformi 1\.

II. Ef bitinn lengst til vinstri er 0 er svarið neikvæð tala og svarið á tvíundarformi fæst með því að víxla öllum bitum svarsins sem fékkst með andhverfuformi 1 (0 verður 1 og 1 verður 0).
]

#strong[Dæmi d:] Reiknum $15_10 minus 8_10$ með andhverfuformi 1\.

$15_10 eq 1111_2$ og $8_10 eq 1000_2 eq 0111_(a 1)$.

#align(center)[#table(
  columns: 8,
  align: (col, row) => (center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [formerki], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [form], [],
  [#emph[geymt]],
  [#emph[1]],
  [#emph[1]],
  [#emph[1]],
  [#emph[1]],
  [],
  [],
  [],
  [],
  [],
  [1],
  [1],
  [1],
  [1],
  [2],
  [(15)],
  [\+],
  [],
  [0],
  [1],
  [1],
  [1],
  [a1],
  [(−8)],
  [\=],
  [#strong[1]],
  [0],
  [1],
  [1],
  [0],
  [a1],
  [(7)],
)
]

Samkvæmt túlkun #strong[I] er svarið $plus 0110_(a 1)$ sem verður $0110_(a 1) plus 1 eq plus 0111_2 eq 7_10$.

#strong[Dæmi e:] Reiknum $5_10 minus 12_10$ með andhverfuformi 1\.

$5_10 eq 0101_2$ og $12_10 eq 1100_2 eq 0011_(a 1)$.

#align(center)[#table(
  columns: 8,
  align: (col, row) => (center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [formerki], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [form], [],
  [#emph[geymt]],
  [#emph[0]],
  [#emph[1]],
  [#emph[1]],
  [#emph[1]],
  [],
  [],
  [],
  [],
  [],
  [0],
  [1],
  [0],
  [1],
  [2],
  [(5)],
  [\+],
  [],
  [0],
  [0],
  [1],
  [1],
  [a1],
  [(−12)],
  [\=],
  [#strong[0]],
  [1],
  [0],
  [0],
  [0],
  [a1],
  [(−7)],
)
]

Samkvæmt túlkun #strong[II] er svarið $minus 1000_(a 1) eq minus 0111_2 eq minus 7_10$.

==== Andhverfuform 2 (tvíandhverfa)
<andhverfuform-2-tvíandhverfa>
Andhverfuform 2 er fengið með því að bæta 1 við andhverfuform 1\.

#strong[Dæmi f:] $1001_2 eq 0110_(a 1) eq 0111_(a 2)$

#strong[Dæmi g:] Tugakerfistalan $7_10$ er $0111_2$. Andhverfuform 1 af þessari tölu er $1000_(a 1)$ og andhverfuform 2 er $1001_(a 2)$.

Ef við drögum $7_10$ frá $9_10$ er það gert á eftirfarandi hátt: Breytum $7_10$ í $0111_2$, þaðan í $1000_(a 1)$ og síðan í $1001_(a 2)$. Breytum síðan $9_10$ í $1001_2$. Leggjum síðan þessar tölur saman.

#align(center)[#table(
  columns: 8,
  align: (col, row) => (center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [formerki], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [form], [],
  [#emph[geymt]],
  [#emph[1]],
  [#emph[0]],
  [#emph[0]],
  [#emph[1]],
  [],
  [],
  [],
  [],
  [],
  [1],
  [0],
  [0],
  [1],
  [2],
  [(9)],
  [\+],
  [],
  [1],
  [0],
  [0],
  [1],
  [a2],
  [(−7)],
  [\=],
  [#strong[1]],
  [0],
  [0],
  [1],
  [0],
  [a2],
  [(2)],
)
]

Nú vitum við að ef við drögum fjögurra bita tölu frá fjögurra bita tölu getur útkoman ekki orðið fimm bita tala. Fimmti bitinn (lengst til vinstri) er 1 og táknar að formerkið á útkomunni er +. Við fáum rétta svarið beint: $plus 0010_2 eq plus 2_10$.

#strong[Dæmi h:] Prófum að draga $9_10$ frá $7_10$ ($7 minus 9$). Hér ætti útkoman að vera $minus 2_10$.

$9_10 eq 1001_2 eq 0110_(a 1) eq 0111_(a 2)$ og $7_10 eq 0111_2$.

#align(center)[#table(
  columns: 8,
  align: (col, row) => (center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [formerki], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [form], [],
  [#emph[geymt]],
  [#emph[0]],
  [#emph[1]],
  [#emph[1]],
  [#emph[1]],
  [],
  [],
  [],
  [],
  [],
  [0],
  [1],
  [1],
  [1],
  [2],
  [(7)],
  [\+],
  [],
  [0],
  [1],
  [1],
  [1],
  [a2],
  [(−9)],
  [\=],
  [#strong[0]],
  [1],
  [1],
  [1],
  [0],
  [a2],
  [(−2)],
)
]

Svarið kemur á andhverfuformi 2 sem $minus 1110_(a 2)$. Bitinn lengst til vinstri í svarinu er 0 sem þýðir að útkoman er neikvæð tala. Til að fá svarið á tvíundarformi snúum við öllum bitum svarsins við (0 verður 1 og 1 verður 0) og bætum síðan 1 við:

$ minus 1110_(a 2) #h(0em) arrow.r #h(0em) minus lr((0001 plus 1)) eq minus 0010_2 eq minus 2_10 $

#blockquote[
#strong[Túlkun á svari úr frádrætti með andhverfuformi 2]

I. Ef bitinn lengst til vinstri er 1 er svarið jákvætt og kemur rétt út á tvíundarformi.

II. Ef bitinn lengst til vinstri er 0 er svarið neikvæð tala og svarið á tvíundarformi fæst með því að snúa öllum bitum svarsins sem fékkst á andhverfuformi 2 við (0 verður 1 og 1 verður 0) og bæta síðan 1 við.
]

=== 1.7 Margföldun í tvíundarkerfi
<margföldun-í-tvíundarkerfi>
Margföldun er í raun bara endurtekin samlagning. T.d. er

$ 6 dot.op 5 eq 5 plus 5 plus 5 plus 5 plus 5 plus 5 #h(0em) lr((upright("sex sinnum"))) eq 6 plus 6 plus 6 plus 6 plus 6 #h(0em) lr((upright("fimm sinnum"))) $

$6_10 eq 110_2$. Leggjum saman $110_2$ fimm sinnum:

$ 110 plus 110 & eq 1100 #h(0em) lr((12))\
1100 plus 110 & eq 10010 #h(0em) lr((18))\
10010 plus 110 & eq 11000 #h(0em) lr((24))\
11000 plus 110 & eq 11110 #h(0em) lr((30)) $

Svarið er 30 eins og okkur grunaði.

$5_10 eq 101_2$. Leggjum saman $101_2$ sex sinnum:

$ 101 plus 101 & eq 1010 #h(0em) lr((10))\
1010 plus 101 & eq 1111 #h(0em) lr((15))\
1111 plus 101 & eq 10100 #h(0em) lr((20))\
10100 plus 101 & eq 11001 #h(0em) lr((25))\
11001 plus 101 & eq 11110 #h(0em) lr((30)) $

Sama niðurstaða, 30\.

Þetta má líka framkvæma á hefðbundinn hátt:

#align(center)[#table(
  columns: 7,
  align: (col, row) => (center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [$2^4$], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [],
  [],
  [],
  [],
  [1],
  [1],
  [0],
  [(6)],
  [$dot.op$],
  [],
  [],
  [1],
  [0],
  [1],
  [(5)],
  [\=],
  [],
  [],
  [1],
  [1],
  [0],
  [],
  [\+],
  [],
  [0],
  [0],
  [0],
  [],
  [],
  [\+],
  [1],
  [1],
  [0],
  [],
  [],
  [],
  [\=],
  [#strong[1]],
  [#strong[1]],
  [#strong[1]],
  [#strong[1]],
  [#strong[0]],
  [(30)],
)
]

Margföldunin er einföld því við erum að margfalda töluna 110 (6) ýmist með 0 eða 1: $1 dot.op 110 eq 110$ og $0 dot.op 110 eq 000$.

=== 1.8 Deiling í tvíundarkerfi
<deiling-í-tvíundarkerfi>
Deiling er ekkert annað en endurtekinn frádráttur. Við endurtökum frádráttinn þangað til afgangurinn er orðinn minni en talan sem deilt er með, eða 0 ef deilingin gengur upp. Ef við fáum afgang sem er ekki 0 er svarið kommutala.

#strong[Dæmi a:] $30 / 6 eq 5$. Við drögum 6 frá 30 þangað til við fáum 0 eða afgang sem er minni en 6\. Síðan teljum við hve oft við drógum frá og sú tala er svarið. Prófum að framkvæma þetta með andhverfuformi 2\.

$30_10 eq 11110_2$ og $6_10 eq 00110_2 eq 11001_(a 1) eq 11010_(a 2)$.

#strong[Frádráttur 1]

#align(center)[#table(
  columns: 9,
  align: (col, row) => (center,center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [formerki], [$2^4$], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [form], [],
  [#emph[geymt]],
  [#emph[1]],
  [#emph[1]],
  [#emph[1]],
  [#emph[1]],
  [],
  [],
  [],
  [],
  [],
  [],
  [1],
  [1],
  [1],
  [1],
  [0],
  [2],
  [(+30)],
  [\+],
  [],
  [1],
  [1],
  [0],
  [1],
  [0],
  [a2],
  [(−6)],
  [\=],
  [#strong[1]],
  [1],
  [1],
  [0],
  [0],
  [0],
  [a2],
  [(+24)],
)
]

#strong[Frádráttur 2]

#align(center)[#table(
  columns: 9,
  align: (col, row) => (center,center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [formerki], [$2^4$], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [form], [],
  [#emph[geymt]],
  [#emph[1]],
  [#emph[1]],
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
  [0],
  [0],
  [2],
  [(+24)],
  [\+],
  [],
  [1],
  [1],
  [0],
  [1],
  [0],
  [a2],
  [(−6)],
  [\=],
  [#strong[1]],
  [1],
  [0],
  [0],
  [1],
  [0],
  [a2],
  [(+18)],
)
]

#strong[Frádráttur 3]

#align(center)[#table(
  columns: 9,
  align: (col, row) => (center,center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [formerki], [$2^4$], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [form], [],
  [#emph[geymt]],
  [#emph[1]],
  [],
  [],
  [#emph[1]],
  [],
  [],
  [],
  [],
  [],
  [],
  [1],
  [0],
  [0],
  [1],
  [0],
  [2],
  [(+18)],
  [\+],
  [],
  [1],
  [1],
  [0],
  [1],
  [0],
  [a2],
  [(−6)],
  [\=],
  [#strong[1]],
  [0],
  [1],
  [1],
  [0],
  [0],
  [a2],
  [(+12)],
)
]

#strong[Frádráttur 4]

#align(center)[#table(
  columns: 9,
  align: (col, row) => (center,center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [formerki], [$2^4$], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [form], [],
  [#emph[geymt]],
  [#emph[1]],
  [#emph[1]],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [],
  [0],
  [1],
  [1],
  [0],
  [0],
  [2],
  [(+12)],
  [\+],
  [],
  [1],
  [1],
  [0],
  [1],
  [0],
  [a2],
  [(−6)],
  [\=],
  [#strong[1]],
  [0],
  [0],
  [1],
  [1],
  [0],
  [a2],
  [(+6)],
)
]

#strong[Frádráttur 5]

#align(center)[#table(
  columns: 9,
  align: (col, row) => (center,center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [formerki], [$2^4$], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [form], [],
  [#emph[geymt]],
  [#emph[1]],
  [#emph[1]],
  [#emph[1]],
  [#emph[1]],
  [],
  [],
  [],
  [],
  [],
  [],
  [0],
  [0],
  [1],
  [1],
  [0],
  [2],
  [(+6)],
  [\+],
  [],
  [1],
  [1],
  [0],
  [1],
  [0],
  [a2],
  [(−6)],
  [\=],
  [#strong[1]],
  [0],
  [0],
  [0],
  [0],
  [0],
  [a2],
  [(0)],
)
]

Við drógum 6 fimm sinnum frá 30 svo svarið er 5\. Afgangurinn er 0 svo deilingin gengur upp og svarið er heiltala (sem við vissum reyndar ☺).

#strong[Dæmi b:] Prófum deilingu sem gengur ekki upp, t.d. $12 / 5 eq 2","4$.

$12_10 eq 1100_2$ og $5_10 eq 0101_2 eq 1010_(a 1) eq 1011_(a 2)$.

#strong[Frádráttur 1]

#align(center)[#table(
  columns: 8,
  align: (col, row) => (center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [formerki], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [form], [],
  [#emph[geymt]],
  [#emph[1]],
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
  [0],
  [2],
  [(+12)],
  [\+],
  [],
  [1],
  [0],
  [1],
  [1],
  [a2],
  [(−5)],
  [\=],
  [#strong[1]],
  [0],
  [1],
  [1],
  [1],
  [a2],
  [(+7)],
)
]

#strong[Frádráttur 2]

#align(center)[#table(
  columns: 8,
  align: (col, row) => (center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [formerki], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [form], [],
  [#emph[geymt]],
  [#emph[1]],
  [#emph[1]],
  [#emph[1]],
  [#emph[1]],
  [],
  [],
  [],
  [],
  [],
  [0],
  [1],
  [1],
  [1],
  [2],
  [(+7)],
  [\+],
  [],
  [1],
  [0],
  [1],
  [1],
  [a2],
  [(−5)],
  [\=],
  [#strong[1]],
  [0],
  [0],
  [1],
  [0],
  [a2],
  [(+2)],
)
]

Afgangurinn er 2 og 5 gengur ekki upp í 2\. Við vitum bara að fyrir framan kommu er talan 2 (fjöldi frádrátta). Það sem við þurfum að gera núna er að margfalda afganginn 2 með 10 og skoða hversu oft 5 gengur upp í 20\. Við skulum ekki fara út í þá sálma að svo stöddu en við vitum að svarið er 4 sinnum. Lokasvarið er því

$ 12 / 5 eq 2","4 $

=== 1.9 Kóðun í tvíundarkerfi
<kóðun-í-tvíundarkerfi>
Í tvíundarkerfi eru til nokkrir kóðar. Algengastur er svokallaður 8421-kóði en um hann var fjallað í kafla 1.2 (tvíundarkerfið). Einnig fjölluðum við um andhverfuformin tvö í kafla 1.6. Þeir kóðar sem þá er eftir að fjalla um eru svokallaður BCD-kóði, Gray-kóði og Excess-3-kóði.

#strong[BCD-kóði] (#emph[Binary Coded Decimal]) er nákvæmlega eins og 8421-kóði nema hann kóðar bara tugakerfistölur (tölustafina 0–9) og nær því einungis upp í $9_10$ eða $1001_2$. Hver tölustafur í tugakerfistölunni er þá táknaður sem fjögurra bita tvíundarkerfistala. Sem dæmi um BCD-tölu má taka $1001 thin 0101 thin 0011_(B C D) eq 953_10$.

#strong[Gray-kóði.] Þessi kóði er byggður þannig upp að aðeins einn biti í tölunni má breytast á milli lína. Hann er því notaður t.d. í K-kortum (3. hefti) þar sem einungis ein breyting er leyfð á inngöngum á milli lína. Þetta er best að útskýra með dæmi.

#align(center)[#table(
  columns: 2,
  align: (col, row) => (center,center,).at(col),
  inset: 6pt,
  [Lína], [8421-kóði],
  [1],
  [0 0],
  [2],
  [0 1],
  [3],
  [1 0],
  [4],
  [1 1],
)
]

Þetta er dæmigerður 8421-kóði og við sjáum að frá línu 2 til línu 3 breytast báðir bitarnir. Það er ekki leyfilegt í Gray-kóða. Hann myndi líta svona út:

#align(center)[#table(
  columns: 2,
  align: (col, row) => (center,center,).at(col),
  inset: 6pt,
  [Lína], [Gray-kóði],
  [1],
  [0 0],
  [2],
  [0 1],
  [3],
  [1 1],
  [4],
  [1 0],
)
]

Hér er alltaf bara ein breyting frá línu til línu og frá dálki til dálks. Lína 3 og 4 víxlast. Einnig myndu dálkar 3 og 4 víxlast með stærri tölum (sjá síðar í 3\. hefti í sambandi við K-kort).

#strong[Excess-3-kóði.] Þessi kóði er 8421-kóði að þremur viðbættum. Talan 0 er því $0011_(x 3)$ í Excess-3-kóða.

=== 1.10 Viðauki
<viðauki>
Áttundarkerfið hefur nákvæmlega sömu uppbyggingu og tugakerfið og tvíundarkerfið. Grunntalan er 8 og fjöldi tákna er átta (0, 1, 2, 3, 4, 5, 6, 7). Áttundarkerfið er lítið notað og var hugsað til að birta þriggja bita tvíundartölur með einu tákni.

0\. sætið hefur margföldunarstuðulinn 1 (eins og reyndar í öllum talnakerfum), 1\. sætið stuðulinn 8, 2\. sætið stuðulinn 64, 3\. sætið stuðulinn 512 o.s.frv. Gildið á milli sæta áttfaldast.

Skoðum áttundarkerfistöluna $1537_8$. Fótskriftin $""_8$ þýðir áttundarkerfi.

#align(center)[#table(
  columns: 5,
  align: (col, row) => (left,center,center,center,center,).at(col),
  inset: 6pt,
  [Sæti nr.], [3], [2], [1], [0],
  [#strong[Tala]],
  [#strong[1]],
  [#strong[5]],
  [#strong[3]],
  [#strong[7]],
  [#strong[Margföldunarstuðull]],
  [512 ($8^3$)],
  [64 ($8^2$)],
  [8 ($8^1$)],
  [1 ($8^0$)],
)
]

Ef við umbreytum nú áttundarkerfistölunni $1537_8$ í tugakerfistölu verður útkoman:

$ 1 dot.op 512 plus 5 dot.op 64 plus 3 dot.op 8 plus 7 dot.op 1 eq 512 plus 320 plus 24 plus 7 eq 863_10 $

==== Úr tugakerfi í áttundarkerfi
<úr-tugakerfi-í-áttundarkerfi>
Hér er best að nota þá aðferð að deila með 8 þangað til heiltöluhlutinn er minni en 8\. Brothlutann margföldum við með 8 og hirðum útkomuna. Þetta er nákvæmlega sama aðferð og við notuðum fyrir tvíundarkerfi og sextándukerfi nema þá var deilt með 2 og 16\. Prófum að breyta tugakerfistölunni $325_10$ í áttundarkerfistölu.

#figure(image("myndir/mynd-3.png", width: 216pt), caption: [Mynd 3: Endurtekin deiling með 8\.], numbering: none)
Hér hættum við þegar heiltöluhlutinn er orðinn minni en 8: $325_10 eq 505_8$.

==== Úr áttundarkerfi í tugakerfi
<úr-áttundarkerfi-í-tugakerfi>
Hér margföldum við töluna í hverju sæti með margföldunarstuðli sætisins:

$ 257_8 eq 2 dot.op 64 plus 5 dot.op 8 plus 7 dot.op 1 eq 128 plus 40 plus 7 eq 175_10 $

==== Úr áttundarkerfi í tvíundarkerfi
<úr-áttundarkerfi-í-tvíundarkerfi>
Breytum hverju tákni áttundarkerfistölunnar í þriggja bita tvíundartölu. Hendum síðan núllum fremst í svarinu.

$ 257_8 eq 010 thin 101 thin 111_2 eq 10101111_2 $

==== Úr tvíundarkerfi í áttundarkerfi
<úr-tvíundarkerfi-í-áttundarkerfi>
Tökum saman þrjá og þrjá bita í tvíundartölunni, talið frá hægri, og breytum í áttundarkerfistölu.

$ 10101110101_2 eq 010 thin 101 thin 110 thin 101_2 eq 2 #h(0em) 5 #h(0em) 6 #h(0em) 5 eq 2565_8 $

==== Úr áttundarkerfi í sextándukerfi
<úr-áttundarkerfi-í-sextándukerfi>
Hér er best að breyta áttundartölunni fyrst í tvíundartölu og henni síðan í sextándutölu.

==== Úr sextándukerfi í áttundarkerfi
<úr-sextándukerfi-í-áttundarkerfi>
Hér er best að breyta sextándutölunni fyrst í tvíundartölu og henni síðan í áttundartölu.

=== 1.11 Dæmi
<dæmi>
#strong[(Ekki nota bara svörin, það er sjálfsblekking.)]

#strong[1\. Tvíundarkerfið]

a) Hvaða gildi hafa sæti 4, 5, 6 og 7 í tvíundarkerfi? \
b) Hvert er tugakerfisgildi $10101011_2$? \
c) Hver er stærsta tala sem hægt er að tákna með 4 bitum í tvíundarkerfi?

#strong[2\. Sextándukerfið]

a) Tilgangur sextándukerfisins er:

i) Að tryggja að tölvan skilji tvíundarkerfið? \
ii) Að umbreyta tugakerfi í tvíundarkerfi? \
iii) Að tákna stórar tvíundartölur á einfaldan hátt? \
iv) Að tákna IP-tölur á einfaldan hátt?

b) Hver er grunntalan í sextándukerfi? \
c) Hvaða tákn eru leyfileg í sextándukerfi?

#strong[3\. Farið á milli talnakerfa]

a) $11110000_2 eq quest_10$ \
b) $11110000_2 eq quest_16$ \
c) $upright(37 D)_16 eq quest_10$ \
d) $upright(37 D)_16 eq quest_2$ \
e) $192_10 eq quest_2$ \
f) $168_10 eq quest_16$ \
g) IP-tala er táknuð með 192.168.2.1 í tugakerfi. Skrifið hana sem fjórar 8 bita tvíundartölur með punkti á milli. Skrifið hana líka sem fjórar sextándukerfistölur með punkti á milli. \
h) MAC-vistfang á netkorti er B8:27:EB:C9:5A:B9. Umbreytið því í tugakerfi og tvíundarkerfi með tvípunkti (:) á milli.

#strong[4\. Samlagning í tvíundarkerfi]

a) Leggið saman $12_10$ og $7_10$ á tvíundarformi. \
b) Leggið saman $15_10$ og $15_10$ á tvíundarformi. \
c) Leggið saman $32_10$ og $64_10$ á tvíundarformi.

#strong[5\. Frádráttur í tvíundarkerfi]

a) Dragið 5 frá 10 ($10 minus 5$) í tvíundarkerfi með því að nota andhverfuform 1\. Breytið síðan útkomunni í tvíundarkerfistölu. \
b) Dragið 10 frá 5 ($5 minus 10$) í tvíundarkerfi með því að nota andhverfuform 1\. Breytið síðan útkomunni í tvíundarkerfistölu. \
c) Dragið 7 frá 16 ($16 minus 7$) í tvíundarkerfi með því að nota andhverfuform 2\. Breytið síðan útkomunni í tvíundarkerfistölu. \
d) Dragið 13 frá 7 ($7 minus 13$) í tvíundarkerfi með því að nota andhverfuform 2\. Breytið síðan útkomunni í tvíundarkerfistölu.

#strong[6\. Margföldun í tvíundarkerfi]

a) Margfaldið saman 3 og 7 með endurtekinni samlagningu í tvíundarkerfi. \
b) Margfaldið saman 3 og 7 í tvíundarkerfi með aðferðinni sem þið lærðuð í grunnskóla. Sjá sýnidæmi (margfalda staf fyrir staf og færa til vinstri).

#strong[7\. Deiling í tvíundarkerfi]

a) Deilið 15 með 5 með endurteknum frádrætti (a2) í tvíundarkerfi. Hver verður afgangurinn? \
b) Deilið 16 með 5 með endurteknum frádrætti (a2) í tvíundarkerfi. Hver verður afgangurinn?

#strong[8\. Kóðun í tvíundarkerfi]

Skrifið upp átta fyrstu tölurnar í Gray-kóða.

#strong[9\. Önnur dæmi]

Skrifið $37_10$ í talnakerfi sem hefur grunntöluna 5\.

=== 1.12 Svör
<svör>
#strong[1\.] \
a) 16, 32, 64, 128 \
b) $128 plus 32 plus 8 plus 2 plus 1 eq 171$ \
c) $2^4 minus 1 eq 15$

#strong[2\.] \
a) iii) \
b) Grunntalan er 16\. \
c) Táknin 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E og F.

#strong[3\.] \
a) $240_10$ \
b) $upright(F 0)_16$ \
c) $893_10$ \
d) $0011 thin 0111 thin 1101_2 eq 1101111101_2$ \
e) $11000000_2$ \
f) $upright(A 8)_16$ \
g) 11000000.10101000.00000010.00000001 og C0.A8.02.01 \
h) Tugakerfi: 184:39:235:201:90:185 \
Tvíundarkerfi: 10111000:00100111:11101011:11001001:01011010:10111001

#strong[4\.] \
a) $10011_2$ \
b) $11110_2$ \
c) $1100000_2$

#strong[5\.] \
a) $plus 0100_(a 1) plus 1 eq 0101_2 eq 5_10$ \
b) $minus 1010_(a 1) eq minus 0101_2 eq minus 5_10$ \
c) $plus 01001_2 eq 9_10$ (5 bitar: $10000_2 plus 11001_(a 2) eq 1 thin 01001$) \
d) $minus 1010_(a 2) eq minus 0110_2 eq minus 6_10$ (4 bitar: $0111_2 plus 0011_(a 2) eq 0 thin 1010$)

#strong[6\.] \
a) $10101_2$ (21) \
b)

#align(center)[#table(
  columns: 7,
  align: (col, row) => (center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [$2^4$], [$2^3$], [$2^2$], [$2^1$], [$2^0$], [],
  [],
  [],
  [],
  [1],
  [1],
  [1],
  [(7)],
  [$dot.op$],
  [],
  [],
  [0],
  [1],
  [1],
  [(3)],
  [\=],
  [],
  [],
  [1],
  [1],
  [1],
  [],
  [\+],
  [],
  [1],
  [1],
  [1],
  [],
  [],
  [\+],
  [0],
  [0],
  [0],
  [],
  [],
  [],
  [\=],
  [#strong[1]],
  [#strong[0]],
  [#strong[1]],
  [#strong[0]],
  [#strong[1]],
  [(21)],
)
]

#strong[7\.] \
a) $0011_2$ (3) og afgangur $0000_2$ \
b) $0011_2$ (3) og afgangur $0001_2$

#strong[8\.] 000, 001, 011, 010, 110, 111, 101, 100

#strong[9\.]

$ 37 slash 5 & eq 7","4 & quad 0","4 dot.op 5 & eq 2\
7 slash 5 & eq 1","4 & quad 0","4 dot.op 5 & eq 2\
 &  &  & 1 $

Lesið neðan frá og upp: $37_10 eq 122_5$.
