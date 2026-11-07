// Sjálfvirkt búið til úr Markdown-skjalinu með pandoc og _verkfaeri/rafbok.lua.
// Breytið frekar .md-skránni og keyrið _verkfaeri/byggja.sh.

#let titill = [Tölvu- og nettækni]
#let undirtitill = [Einföldunaraðferðir]
#let afangi = [TNT2 – 3\. hefti]
#let hofundur = [Eiríkur Guðmundsson]
#let utgafa = [Útgáfa B1]

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

== 1\. Karnaugh-kort (K-kort)
<karnaugh-kort-k-kort>
Góð aðferð til þess að finna rökrásir út frá sannleikstöflu eða einfalda rökrásir er að nota svokallað Karnaugh-kort (K-kort). K-kortið er sett þannig upp að hver reitur í því samsvarar einni línu í sannleikstöflunni. Ef sannleikstaflan inniheldur 8 línur samanstendur K-kortið af 8 reitum.

Reitunum er raðað þannig að aðeins er leyfð ein breyting á inngöngum á milli lína eða dálka. Þetta er kallað Gray-kóði (#emph[Gray code]).

#strong[Dæmi 1:]

#figure(image("myndir/mynd-1.png", width: 345pt), caption: [Mynd 1: Hver lína sannleikstöflunnar á sér einn reit í K-kortinu.], numbering: none)
#strong[Dæmi 2:] Skoðum eftirfarandi K-kort og hvernig það er notað.

#figure(image("myndir/mynd-2.png", width: 120pt), caption: [Mynd 2: K-kort með þremur lykkjum.], numbering: none)
#blockquote[
#strong[Reglur:]

+ Það má lykkja saman 1, 2, 4 eða 8 reiti sem eru samliggjandi lárétt eða lóðrétt og innihalda töluna #strong[1] (mest 16 reiti ef kortið inniheldur 16 reiti).
+ Jaðrar kortsins teljast vera samliggjandi, þ.e. efsta og neðsta línan og vinstri og hægri brún.
+ Sá bókstafur sem breytist innan lykkjunnar (er bæði með neitun og án neitunar) dettur út því hann hefur ekki áhrif á útkomuna.
+ Útgangsjafnan verður summa útkomanna úr hverri lykkju.
+ Reynum að taka eins fáar og eins stórar lykkjur og við getum. Stærri lykkjur þýða að fleiri bókstafir detta út.
+ Það má samnýta reiti eins oft og þarf.
]

Lykkjan í efstu línu inniheldur $overline(A) thin overline(B) thin overline(C)$ og $overline(A) thin overline(B) C$. Sjáum að #strong[C] breytist innan lykkjunnar ($overline(C)$ og $C$) og dettur því út. Eftir stendur $overline(A) thin overline(B)$.

Staka lykkjan í 3\. línu parast ekki með neinum öðrum reit og einfaldast því ekkert. Útkoman úr henni er því $A B overline(C)$.

Lóðrétta lykkjan úr efstu og neðstu línu lykkjar saman $overline(A) thin overline(B) C$ og $A overline(B) C$. Sjáum að #strong[A] breytist og dettur því út. Útkoman úr þessari lykkju er því $overline(B) C$.

Útgangsjafna kortsins er því:

$ Y eq overline(A) thin overline(B) plus A B overline(C) plus overline(B) C $

Rásin er þá:

#figure(image("myndir/mynd-3.png", width: 195pt), caption: [Mynd 3: Rásin fyrir
$Y eq overline(A) thin overline(B) plus A B overline(C) plus overline(B) C$.], numbering: none)
#strong[Dæmi 3:] Skoðum eftirfarandi sannleikstöflu, færum hana inn í K-kort og finnum einföldustu rás sem gefur þessa niðurstöðu. Skoðum bara línur þar sem útgangurinn er 1\.

#figure(image("myndir/mynd-4.png", width: 343pt), caption: [Mynd 4: Sannleikstaflan færð inn í K-kort.], numbering: none)
Sjáum að fyrsti dálkurinn lykkjast allur saman. Eini inngangurinn sem breytist ekkert er $overline(C)$ og niðurstaðan úr lykkjunni er því $overline(C)$.

Neðsta línan lykkjast síðan saman og þar breytist #strong[C] og dettur því út og gefur niðurstöðuna $A overline(B)$.

Útgangsjafna kortsins er því:

$ Y eq overline(C) plus A overline(B) $

Rásin er þá:

#figure(image("myndir/mynd-5.png", width: 198pt), caption: [Mynd 5: Rásin fyrir $Y eq overline(C) plus A overline(B)$.], numbering: none)
#strong[Dæmi 4:] Tökum nú stærra dæmi, með 4 inngöngum. Færum inn línur með 1 í útgangi og fyllum síðan upp með 0\.

#figure(image("myndir/mynd-6.png", width: 357pt), caption: [Mynd 6: Sannleikstafla með fjórum inngöngum færð inn í K-kort með
rauðri, blárri og grænni lykkju.], numbering: none)
Hér höfum við 4 innganga sem gefa $2^4 eq 16$ möguleika. Það eru því 16 reitir í K-kortinu. Munum að jaðrarnir teljast vera samliggjandi; dálkur 1 er því samliggjandi dálki 4 og lína 1 er samliggjandi línu 4\.

Reitirnir í hornunum (merktir með rauðu) eru því samliggjandi og geta lykkjast saman. Sjáum að #strong[A] breytist frá línu 1 til línu 4 og #strong[C] breytist frá dálki 1 til dálks 4 í rauðu lykkjunni. Inngangarnir sem þá verða eftir eru $overline(B) thin overline(D)$.

Bláa lykkjan gefur $overline(A) thin overline(C) thin overline(D)$ og græna lykkjan gefur $A B C$.

Útgangsjafnan verður því:

$ Y eq overline(B) thin overline(D) plus overline(A) thin overline(C) thin overline(D) plus A B C $

K-kort byggjast á summu margfelda (SOP \= #emph[Sum Of Products]). Það þýðir að útgangshliðið er OR-hlið með jafnmörgum inngöngum og lykkjur K-kortsins eru margar.

Hægt er að teikna K-kortið á annan hátt. Þá setjum við inn stöður innganganna sem 0 eða 1 í stað þess að nota bókstafi og bókstafi með yfirstrikun. Þetta finnst mörgum þægilegra og það auðveldar yfirfærslu úr sannleikstöflunni yfir í K-kortið.

#figure(image("myndir/mynd-7.png", width: 200pt), caption: [Mynd 7: K-kortið úr dæmi 4 þar sem stöður innganganna eru skrifaðar bæði
sem bókstafir og sem 0 og 1\.], numbering: none)
Það má segja að það að nota 0 og 1 auðveldi yfirfærsluna úr sannleikstöflunni en bókstafirnir auðveldi að finna útgangsjöfnuna og eins að setja inn í kortið út frá gefinni jöfnu.

== 2\. Boole-algebra
<boole-algebra>
Önnur aðferð til þess að einfalda rásir er að beita svokallaðri #strong[Boole-algebru] (#emph[Boolean algebra]). Skoðum þær reiknireglur sem gilda í þessari algebru.

=== 2.1 Reiknireglur Boole-algebru
<reiknireglur-boole-algebru>
Þær eru 20 talsins og eru paraðar saman tvær og tvær sem eru skyldar. Síðustu tvær eru nefndar reglur De Morgans. Sú fyrri (samlagning) sýnir sambandið á milli NOR-hliðs og AND-hliðs með viðsnúnum inngöngum. Sú seinni (margföldun) sýnir sambandið á milli NAND-hliðs og OR-hliðs með viðsnúnum inngöngum.

#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [Nr.], [a) Samlagning], [b) Margföldun],
  [1],
  [$A plus A eq A$],
  [$A dot.op A eq A$],
  [2],
  [$lr((A plus B)) plus C eq A plus lr((B plus C))$],
  [$lr((A dot.op B)) dot.op C eq A dot.op lr((B dot.op C))$],
  [3],
  [$A plus B eq B plus A$],
  [$A dot.op B eq B dot.op A$],
  [4],
  [$A plus B C eq lr((A plus B)) lr((A plus C))$],
  [$A lr((B plus C)) eq A B plus A C$],
  [5],
  [$A plus 0 eq A$],
  [$A dot.op 1 eq A$],
  [6],
  [$A plus 1 eq 1$],
  [$A dot.op 0 eq 0$],
  [7],
  [$A plus overline(A) eq 1$],
  [$A dot.op overline(A) eq 0$],
  [8],
  [$A plus A B eq A$],
  [$A lr((A plus B)) eq A$],
  [9],
  [$overline(A) plus A B eq overline(A) plus B$],
  [$A plus overline(A) B eq A plus B$],
  [10 (De Morgan)],
  [$overline(A plus B) eq overline(A) dot.op overline(B)$],
  [$overline(A dot.op B) eq overline(A) plus overline(B)$],
)
]

Þessar reglur er best að sanna með því að búa til sannleikstöflur fyrir báðar hliðar #strong[\=]-merkisins.

Tökum sem dæmi reglu 9a: $overline(A) plus A B eq overline(A) plus B$. Búum til sannleikstöflu:

#align(center)[#table(
  columns: 4,
  align: (col, row) => (center,center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [$overline(A) plus A B$], [$overline(A) plus B$],
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
  [0],
  [0],
  [1],
  [1],
  [1],
  [1],
)
]

Sannleikstaflan skilar tveimur eins útgöngum og regla 9a er því rétt.

#strong[Dæmi 1:]

$ overline(A) B overline(C) plus overline(A) B C $

Byrjum á að taka sameiginlegar stærðir út fyrir sviga eins og um venjulega algebru væri að ræða (sjá reglu 4b). Þá fáum við:

$ overline(A) B lr((overline(C) plus C)) $

Samkvæmt reglu 7a er $overline(C) plus C eq 1$ og við erum því að margfalda $overline(A) B$ með #strong[1] sem gefur $overline(A) B$ samkvæmt reglu 5b. Því er:

$ overline(A) B overline(C) plus overline(A) B C eq overline(A) B $

#strong[Dæmi 2:]

$ overline(A) B overline(C) plus overline(A) B C plus overline(A) thin overline(B) C $

Samkvæmt reglu 1a megum við bæta við stærð sem fyrir er í dæminu eins oft og okkur hentar. Þetta samsvarar því að samnýta reit í K-korti. Bætum t.d. $overline(A) B C$ við og fáum

$ overline(A) B overline(C) plus overline(A) B C plus overline(A) thin overline(B) C plus overline(A) B C $

Við höfum ekki eyðilagt neitt með þessu. Núna getum við tekið $overline(A) B$ út fyrir sviga í fyrstu tveimur liðunum og $overline(A) C$ út fyrir sviga í tveimur seinni liðunum. Þá fæst:

$ overline(A) B lr((overline(C) plus C)) plus overline(A) C lr((overline(B) plus B)) eq overline(A) B plus overline(A) C eq overline(A) lr((B plus C)) $

#strong[Dæmi 3:]

$ lr((A plus B plus overline(C))) lr((overline(A) plus B plus overline(C))) $

Margföldum upp úr svigunum á hefðbundinn hátt (skýringar til hægri):

$  & A overline(A) plus A B plus A overline(C) plus B overline(A) plus B B plus B overline(C) plus overline(C) thin overline(A) plus overline(C) B plus overline(C) thin overline(C) &  & \
 & eq 0 plus A B plus A overline(C) plus B overline(A) plus B plus B overline(C) plus overline(C) thin overline(A) plus overline(C) B plus overline(C) &  & lr([A overline(A) eq 0 comma #h(0em) B B eq B comma #h(0em) overline(C) thin overline(C) eq overline(C)])\
 & eq B lr((A plus overline(A))) plus overline(C) lr((A plus overline(A))) plus B overline(C) plus B plus overline(C) &  & lr([B overline(C) plus overline(C) B eq B overline(C)])\
 & eq B plus overline(C) plus B overline(C) plus B plus overline(C) &  & lr([B lr((A plus overline(A))) eq B comma #h(0em) overline(C) lr((A plus overline(A))) eq overline(C)])\
 & eq B plus overline(C) plus B overline(C) &  & lr([B plus B eq B comma #h(0em) overline(C) plus overline(C) eq overline(C)])\
 & eq B plus overline(C) lr((1 plus B)) eq B plus overline(C) &  & lr([1 plus B eq 1]) $

== 3\. Rofarásum breytt í rökrásir
<rofarásum-breytt-í-rökrásir>
Allar rofarásir eiga sér samsvarandi rökrás. Það eru t.d. til stýrivélar sem vinna eingöngu með rökrásatákn og oft þarf að forrita þær með því að breyta segulliðastýringu í AND-, OR- og NOT-skipanir.

Tökum dæmi:

#figure(image("myndir/mynd-8.png", width: 65pt), caption: [Mynd 8: Rofarás.], numbering: none)
Hvernig breytum við þessari rofarás í rökrás? #strong[A] hliðtengt við #strong[B] er búið til með OR-hliði. Útkoman úr því er síðan margfölduð með $overline(C)$ vegna raðtengingar #strong[C] við hliðtenginguna að ofan. Útgangsjafnan verður $lr((A plus B)) dot.op overline(C)$.

Rökrásin verður:

#figure(image("myndir/mynd-9.png", width: 253pt), caption: [Mynd 9: Rökrásin fyrir $Y eq lr((A plus B)) dot.op overline(C)$.], numbering: none)
Tökum annað dæmi um segulliðastýringu.

#figure(image("myndir/mynd-10.png", width: 70pt), caption: [Mynd 10: Stöðvun, ræsing og sjálfhelda.], numbering: none)
Þetta er hin dæmigerða stöðvunar-, ræsingar- og sjálfheldustýring (#emph[stopp, start, sjálfhelda]). Útgangsjafnan er:

$ K 1 eq overline(S 1) dot.op lr((K 1 plus S 2)) $

Rökrásin verður þá:

#figure(image("myndir/mynd-11.png", width: 307pt), caption: [Mynd 11: Rökrásin fyrir sjálfheldustýringuna.], numbering: none)
Sjáum að línan til baka frá K1 inn á OR-hliðið býr til sjálfhelduna. Þið lærið seinna í stýringaáföngum að það skiptir máli hvort S1 er lokuð eða opin snerta, þ.e. hvort neitun kemur á S1 eða ekki.

== 4\. Rökrásum breytt í rofarásir
<rökrásum-breytt-í-rofarásir>
Þegar við breytum rökrásum í rofarásir þurfum við að skoða hvers konar tengingar hliðin búa til og hvernig hliðin tengjast síðan innbyrðis. Tökum dæmi um rökrás sem við höfum skoðað áður.

#figure(image("myndir/mynd-12.png", width: 184pt), caption: [Mynd 12: Rökrás úr dæmi 2 í kafla 1\.], numbering: none)
OR-hliðið lengst til hægri er með þrjá innganga og býr því til þrjár hliðtengingar. Hver leggur fyrir sig í hliðtengingunni er búinn til af AND-hliði með ýmist tvo eða þrjá innganga. Útgangsjafnan er:

$ Y eq overline(A) thin overline(B) plus A B overline(C) plus overline(B) C $

Við þurfum í rauninni bara útgangsjöfnuna til að breyta í rofarás því hún segir allt sem segja þarf.

#figure(image("myndir/mynd-13.png", width: 127pt), caption: [Mynd 13: Rofarásin fyrir
$Y eq overline(A) thin overline(B) plus A B overline(C) plus overline(B) C$.], numbering: none)
== 5\. Verkefni
<verkefni>
#strong[(Ekki nota bara svörin, það er sjálfsblekking.)]

#strong[1\.] Þrír menn, A, B og C, sitja í dómnefnd í hæfileikakeppni. Hver þeirra er með einn rofa sem hann þrýstir á ef hann samþykkir að atriðið komist áfram. Búið til rás með þremur inngöngum, A, B og C, sem kveikir á ljósi ef atriðið fær að minnsta kosti tvö atkvæði og kemst áfram (meirihluti ræður).

#strong[2\.] Finnið jöfnu útgangsins Y með hjálp Karnaugh-korts og teiknið einfölduðu rásina.

#align(center)[#table(
  columns: 4,
  align: (col, row) => (center,center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [C], [Y],
  [0],
  [0],
  [0],
  [#strong[1]],
  [0],
  [0],
  [1],
  [#strong[1]],
  [0],
  [1],
  [0],
  [#strong[0]],
  [0],
  [1],
  [1],
  [#strong[1]],
  [1],
  [0],
  [0],
  [#strong[1]],
  [1],
  [0],
  [1],
  [#strong[1]],
  [1],
  [1],
  [0],
  [#strong[0]],
  [1],
  [1],
  [1],
  [#strong[0]],
)
]

#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [], [$overline(C)$ (0)], [$C$ (1)],
  [$overline(A) thin overline(B)$ (00)],
  [],
  [],
  [$overline(A) B$ (01)],
  [],
  [],
  [$A B$ (11)],
  [],
  [],
  [$A overline(B)$ (10)],
  [],
  [],
)
]

$Y eq$

#strong[3\.] Finnið jöfnu útgangsins Y með hjálp Karnaugh-korts og teiknið einfölduðu rásina.

#align(center)[#table(
  columns: 5,
  align: (col, row) => (center,center,center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [C], [D], [Y],
  [0],
  [0],
  [0],
  [0],
  [#strong[1]],
  [0],
  [0],
  [0],
  [1],
  [#strong[0]],
  [0],
  [0],
  [1],
  [0],
  [#strong[1]],
  [0],
  [0],
  [1],
  [1],
  [#strong[0]],
  [0],
  [1],
  [0],
  [0],
  [#strong[0]],
  [0],
  [1],
  [0],
  [1],
  [#strong[1]],
  [0],
  [1],
  [1],
  [0],
  [#strong[1]],
  [0],
  [1],
  [1],
  [1],
  [#strong[1]],
  [1],
  [0],
  [0],
  [0],
  [#strong[0]],
  [1],
  [0],
  [0],
  [1],
  [#strong[1]],
  [1],
  [0],
  [1],
  [0],
  [#strong[1]],
  [1],
  [0],
  [1],
  [1],
  [#strong[0]],
  [1],
  [1],
  [0],
  [0],
  [#strong[0]],
  [1],
  [1],
  [0],
  [1],
  [#strong[0]],
  [1],
  [1],
  [1],
  [0],
  [#strong[1]],
  [1],
  [1],
  [1],
  [1],
  [#strong[1]],
)
]

#align(center)[#table(
  columns: 5,
  align: (col, row) => (center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [$overline(C) thin overline(D)$ (00)], [$overline(C) D$ (01)], [$C D$ (11)], [$C overline(D)$ (10)],
  [$overline(A) thin overline(B)$ (00)],
  [],
  [],
  [],
  [],
  [$overline(A) B$ (01)],
  [],
  [],
  [],
  [],
  [$A B$ (11)],
  [],
  [],
  [],
  [],
  [$A overline(B)$ (10)],
  [],
  [],
  [],
  [],
)
]

$Y eq$

#strong[4\.] Finnið útgangsjöfnuna út frá K-kortinu og teiknið rásina.

#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [], [$overline(C)$ (0)], [$C$ (1)],
  [$overline(A) thin overline(B)$ (00)],
  [1],
  [1],
  [$overline(A) B$ (01)],
  [0],
  [1],
  [$A B$ (11)],
  [0],
  [0],
  [$A overline(B)$ (10)],
  [0],
  [1],
)
]

$Y eq$

#strong[5\.] Finnið útgangsjöfnuna út frá K-kortinu og teiknið rásina.

#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [], [$overline(C)$ (0)], [$C$ (1)],
  [$overline(A) thin overline(B)$ (00)],
  [0],
  [1],
  [$overline(A) B$ (01)],
  [1],
  [1],
  [$A B$ (11)],
  [0],
  [1],
  [$A overline(B)$ (10)],
  [0],
  [1],
)
]

$Y eq$

#strong[6\.] Finnið útgangsjöfnuna út frá K-kortinu og teiknið rásina.

#align(center)[#table(
  columns: 5,
  align: (col, row) => (center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [$overline(C) thin overline(D)$ (00)], [$overline(C) D$ (01)], [$C D$ (11)], [$C overline(D)$ (10)],
  [$overline(A) thin overline(B)$ (00)],
  [1],
  [0],
  [0],
  [0],
  [$overline(A) B$ (01)],
  [1],
  [0],
  [1],
  [1],
  [$A B$ (11)],
  [1],
  [0],
  [1],
  [1],
  [$A overline(B)$ (10)],
  [0],
  [1],
  [1],
  [0],
)
]

$Y eq$

#strong[7\.] Finnið útgangsjöfnuna út frá K-kortinu og teiknið rásina.

#align(center)[#table(
  columns: 5,
  align: (col, row) => (center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [$overline(C) thin overline(D)$ (00)], [$overline(C) D$ (01)], [$C D$ (11)], [$C overline(D)$ (10)],
  [$overline(A) thin overline(B)$ (00)],
  [1],
  [0],
  [0],
  [1],
  [$overline(A) B$ (01)],
  [0],
  [0],
  [0],
  [1],
  [$A B$ (11)],
  [0],
  [0],
  [1],
  [1],
  [$A overline(B)$ (10)],
  [1],
  [0],
  [1],
  [1],
)
]

$Y eq$

#strong[8\.] Sýnið með Boole-algebru að hægt sé að einfalda

$ overline(A) thin overline(B) thin overline(C) plus overline(A) B overline(C) plus overline(A) B C quad upright("í") quad overline(A) thin overline(C) plus overline(A) B $

#strong[Munið] að þið megið nota stærð sem kemur fyrir í upphaflegu jöfnunni oftar en einu sinni. Það jafngildir því að nota sama reit oft í K-korti.

#strong[9\.] Einfaldið með Boole-algebru: $C plus D overline(C)$

#strong[10\.] Einfaldið $A overline(B) C plus A overline(B) thin overline(C) plus overline(A) thin overline(B) thin overline(C) plus overline(A) B overline(C)$ með:

a) Boole-algebru \
b) K-korti

== 6\. Svör
<svör>
#strong[1\.]

#align(center)[#table(
  columns: 4,
  align: (col, row) => (center,center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [C], [Y],
  [0],
  [0],
  [0],
  [#strong[0]],
  [0],
  [0],
  [1],
  [#strong[0]],
  [0],
  [1],
  [0],
  [#strong[0]],
  [0],
  [1],
  [1],
  [#strong[1]],
  [1],
  [0],
  [0],
  [#strong[0]],
  [1],
  [0],
  [1],
  [#strong[1]],
  [1],
  [1],
  [0],
  [#strong[1]],
  [1],
  [1],
  [1],
  [#strong[1]],
)
]

K-kort gefur:

#figure(image("myndir/mynd-14.png", width: 120pt), caption: [Mynd 14: K-kort fyrir verkefni 1\.], numbering: none)
Lausnin er: $Y eq A B plus A C plus B C$

Rásin er:

#figure(image("myndir/mynd-15.png", width: 188pt), caption: [Mynd 15: Rás fyrir $Y eq A B plus A C plus B C$.], numbering: none)
#strong[2\.]

#figure(image("myndir/mynd-16.png", width: 117pt), caption: [Mynd 16: K-kort fyrir verkefni 2\.], numbering: none)
Stóra lykkjan gefur $overline(B)$; #strong[A] og #strong[C] breytast bæði. Lykkjan uppi hægra megin gefur $overline(A) C$; #strong[B] dettur út. Útgangsjafnan er:

$ Y eq overline(B) plus overline(A) C $

#figure(image("myndir/mynd-17.png", width: 196pt), caption: [Mynd 17: Rás fyrir $Y eq overline(B) plus overline(A) C$.], numbering: none)
#strong[3\.]

#figure(image("myndir/mynd-18.png", width: 152pt), caption: [Mynd 18: K-kort fyrir verkefni 3\.], numbering: none)
- Lykkja nr. 1 parast ekki við neinn reit og einfaldast því ekkert. Útkoman er $A overline(B) thin overline(C) D$.
- Lykkja nr. 2 samanstendur af vinstri og hægri enda línu 1\. Hún gefur $overline(A) thin overline(B) thin overline(D)$.
- Lykkja nr. 3 gefur $overline(A) B D$.
- Lykkja nr. 4 gefur $B C$.
- Lykkja nr. 5 gefur $C overline(D)$.

Útgangsjafnan er:

$ Y eq A overline(B) thin overline(C) D plus overline(A) thin overline(B) thin overline(D) plus overline(A) B D plus B C plus C overline(D) $

#figure(image("myndir/mynd-19.png", width: 249pt), caption: [Mynd 19: Rás fyrir verkefni 3\.], numbering: none)
#strong[4\.]

#figure(image("myndir/mynd-20.png", width: 103pt), caption: [Mynd 20: K-kort fyrir verkefni 4\.], numbering: none)
- Lykkja 1 gefur $overline(A) thin overline(B)$.
- Lykkja 2 gefur $overline(A) C$.
- Lykkja 3 gefur $overline(B) C$.

Útgangsjafnan er $Y eq overline(A) thin overline(B) plus overline(A) C plus overline(B) C$.

#figure(image("myndir/mynd-21.png", width: 211pt), caption: [Mynd 21: Rás fyrir verkefni 4\.], numbering: none)
#strong[5\.]

#figure(image("myndir/mynd-22.png", width: 97pt), caption: [Mynd 22: K-kort fyrir verkefni 5\.], numbering: none)
- Lykkja 1 gefur $C$.
- Lykkja 2 gefur $overline(A) B$.

Útgangsjafnan er $Y eq C plus overline(A) B$.

#figure(image("myndir/mynd-23.png", width: 197pt), caption: [Mynd 23: Rás fyrir verkefni 5\.], numbering: none)
#strong[6\.]

#figure(image("myndir/mynd-24.png", width: 127pt), caption: [Mynd 24: K-kort fyrir verkefni 6\.], numbering: none)
- Lykkja 1 gefur $B overline(D)$.
- Lykkja 2 gefur $B C$.
- Lykkja 3 gefur $overline(A) thin overline(C) thin overline(D)$.
- Lykkja 4 gefur $A overline(B) D$.

Útgangsjafnan er:

$ Y eq B overline(D) plus B C plus overline(A) thin overline(C) thin overline(D) plus A overline(B) D $

#figure(image("myndir/mynd-25.png", width: 210pt), caption: [Mynd 25: Rás fyrir verkefni 6\.], numbering: none)
#strong[7\.]

#figure(image("myndir/mynd-26.png", width: 138pt), caption: [Mynd 26: K-kort fyrir verkefni 7\.], numbering: none)
- Lykkja 1 gefur $overline(B) thin overline(D)$.
- Lykkja 2 gefur $C overline(D)$.
- Lykkja 3 gefur $A C$.

Útgangsjafnan er $Y eq overline(B) thin overline(D) plus C overline(D) plus A C$.

#figure(image("myndir/mynd-27.png", width: 228pt), caption: [Mynd 27: Rás fyrir verkefni 7\.], numbering: none)
#strong[8\.] $overline(A) thin overline(B) thin overline(C) plus overline(A) B overline(C) plus overline(A) B C eq overline(A) thin overline(C) plus overline(A) B$

Bætum $overline(A) B overline(C)$ við vinstri hliðina einu sinni enn. Það má samkvæmt reglu 1a ($A plus A eq A$):

$ overline(A) thin overline(B) thin overline(C) plus overline(A) B overline(C) plus overline(A) B overline(C) plus overline(A) B C eq overline(A) thin overline(C) lr((overline(B) plus B)) plus overline(A) B lr((overline(C) plus C)) eq overline(A) thin overline(C) plus overline(A) B $

#strong[9\.] $C plus D overline(C)$

Regla 9b segir: $A plus overline(A) B eq A plus B$. Samkvæmt henni er

$ C plus D overline(C) eq C plus overline(C) D eq C plus D $

#strong[10\.]

a) Boole-algebra:

$ A overline(B) C plus A overline(B) thin overline(C) plus overline(A) thin overline(B) thin overline(C) plus overline(A) B overline(C) eq A overline(B) lr((C plus overline(C))) plus overline(A) thin overline(C) lr((overline(B) plus B)) eq A overline(B) plus overline(A) thin overline(C) $

b) K-kort:

#figure(image("myndir/mynd-28.png", width: 96pt), caption: [Mynd 28: K-kort fyrir verkefni 10\.], numbering: none)
Efri lykkjan gefur $overline(A) thin overline(C)$ og neðri lykkjan gefur $A overline(B)$. Útgangsjafnan er $A overline(B) plus overline(A) thin overline(C)$ sem er sama og Boole-algebran gaf okkur.
