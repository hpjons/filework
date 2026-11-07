// Sjálfvirkt búið til úr Markdown-skjalinu með pandoc og _verkfaeri/rafbok.lua.
// Breytið frekar .md-skránni og keyrið _verkfaeri/byggja.sh.

#let titill = [Tölvu- og nettækni]
#let undirtitill = [Kennsluhefti]
#let afangi = [TNT3]
#let hofundur = [Eiríkur Guðmundsson]
#let utgafa = [Útgáfa B2]

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

Höfundur er Eiríkur Guðmundsson. Umbrot: Bára Laxdal Halldórsdóttir.
]

== 1\. TTL- og CMOS-rásir og tengingar við rofa og aflstýringar
<ttl--og-cmos-rásir-og-tengingar-við-rofa-og-aflstýringar>
=== 1.1 TTL-rásir
<ttl-rásir>
TTL-rásir (#emph[Transistor Transistor Logic]) eru rökrásir þar sem nafnið byrjar á 54 eða 74\. 74-rásirnar eru miklu algengari og við munum því einblína á þær. Þær heita TTL vegna þess að bæði rökræni hluti þeirra (AND, OR og NOT) og útgangsstig (mögnunarstig) þeirra eru búin til með transistorum. 54xxx-rásirnar virka eins og 74xxx-rásirnar en eru gerðar samkvæmt hernaðarstaðli (#emph[military standard]) og vinna því betur við erfiðar aðstæður.

Skoðum fyrst tæknilegar upplýsingar um 74xxx-rásirnar (þar sem xxx er tveggja eða þriggja stafa tala) og veljum eina, 7408, sem er með fjórum tveggja innganga AND-hliðum. Aðrar rásir í 74-röðinni hafa mjög svipuð gildi. Gagnablöðin (#emph[data sheets]) má finna á netinu, t.d. með leitarorðunum „7408 data sheet“.

#strong[7408 QUAD DUAL INPUT AND GATE]

#emph[Absolute Maximum Ratings (Note 1)]

#align(center)[#table(
  columns: 2,
  align: (col, row) => (left,left,).at(col),
  inset: 6pt,
  [Parameter], [Value],
  [Supply Voltage],
  [7 V],
  [Input Voltage],
  [5.5 V],
  [Operating Free Air Temperature Range, DM54 and 54],
  [−55 °C to +125 °C],
  [Operating Free Air Temperature Range, DM74],
  [0 °C to +70 °C],
  [Storage Temperature Range],
  [−65 °C to +150 °C],
)
]

#emph[Recommended Operating Conditions]

#align(center)[#table(
  columns: 9,
  align: (col, row) => (center,left,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [Symbol], [Parameter], [DM5408 Min], [Nom], [Max], [DM7408 Min], [Nom], [Max], [Units],
  [$V_(C C)$],
  [Supply Voltage],
  [4.5],
  [5],
  [5.5],
  [4.75],
  [5],
  [5.25],
  [V],
  [$V_(I H)$],
  [High Level Input Voltage],
  [2],
  [],
  [],
  [2],
  [],
  [],
  [V],
  [$V_(I L)$],
  [Low Level Input Voltage],
  [],
  [],
  [0.8],
  [],
  [],
  [0.8],
  [V],
  [$I_(O H)$],
  [High Level Output Current],
  [],
  [],
  [−0.8],
  [],
  [],
  [−0.8],
  [mA],
  [$I_(O L)$],
  [Low Level Output Current],
  [],
  [],
  [16],
  [],
  [],
  [16],
  [mA],
  [$T_A$],
  [Free Air Operating Temperature],
  [−55],
  [],
  [125],
  [0],
  [],
  [70],
  [°C],
)
]

#emph[Note 1: The "Absolute Maximum Ratings" are those values beyond which the safety of the device cannot be guaranteed. The device should not be operated at these limits. The parametric values defined in the "Electrical Characteristics" table are not guaranteed at the absolute maximum ratings. The "Recommended Operating Conditions" table will define the conditions for actual device operation.]

#strong[Fæðispenna] (#emph[supply voltage], $V_(C C)$) er fæðispenna rásarinnar. Fyrir 74xxx-rásirnar á þessi spenna að vera á bilinu $4","75 thin upright(V)$ til $5","25 thin upright(V)$, helst sem næst $5 thin upright(V)$. Því er 7805-spennureglunarrásin mikið notuð með 74xxx-rásunum. Rásin virkar ekki nema hún fái fæðispennu.

#strong[Inngangsspenna.] Samkvæmt gagnablaðinu er $V_(I H)$ (#emph[High Level Input Voltage]) $eq 2 thin upright(V)$ (lágmark). Þetta þýðir að ef rásin á að vinna rétt verður inngangsspennan í hástöðu (rökleg 1) að vera $2 thin upright(V)$ eða hærri.

$V_(I L)$ (#emph[Low Level Input Voltage]) $eq 0","8 thin upright(V)$ (hámark). Þetta þýðir að ef rásin á að vinna rétt verður inngangsspennan í lágstöðu (rökleg 0) að vera $0","8 thin upright(V)$ eða lægri.

Sjáum að þarna á milli er bil frá $0","8 thin upright(V)$ til $2 thin upright(V)$, eins konar grátt svæði.

=== 1.2 Inngangsspenna
<inngangsspenna>
#figure(image("myndir/mynd-1.png", width: 167pt), caption: [Mynd 1: Leyfileg inngangsspenna í lágstöðu og hástöðu og gráa svæðið á
milli.], numbering: none)
Við hönnun rökrásastýringa þarf að gæta þess að inngangsspennan lendi ekki inni á gráa svæðinu. Hún þarf að vera lægri en $0","8 thin upright(V)$ í lágstöðu og hærri en $2 thin upright(V)$ í hástöðu. Lendi hún á gráa svæðinu ábyrgjast framleiðendur ekki rétta virkni. T.d. væri $1","5 thin upright(V)$ rafhlaða ekki góð sem inngangsspenna inn á rökrás.

#emph[Electrical Characteristics – over recommended operating free air temperature range (unless otherwise noted)]

#align(center)[#table(
  columns: 7,
  align: (col, row) => (center,left,left,center,center,center,center,).at(col),
  inset: 6pt,
  [Symbol], [Parameter], [Conditions], [Min], [Typ (Note 2)], [Max], [Units],
  [$V_I$],
  [Input Clamp Voltage],
  [$V_(C C)$ \= Min, $I_I$ \= −12 mA],
  [],
  [],
  [−1.5],
  [V],
  [$V_(O H)$],
  [High Level Output Voltage],
  [$V_(C C)$ \= Min, $I_(O H)$ \= Max, $V_(I L)$ \= Max],
  [2.4],
  [3.4],
  [],
  [V],
  [$V_(O L)$],
  [Low Level Output Voltage],
  [$V_(C C)$ \= Min, $I_(O L)$ \= Max, $V_(I H)$ \= Min],
  [],
  [0.2],
  [0.4],
  [V],
  [$I_I$],
  [Input Current \@ Max Input Voltage],
  [$V_(C C)$ \= Max, $V_I$ \= 5.5 V],
  [],
  [],
  [1],
  [mA],
  [$I_(I H)$],
  [High Level Input Current],
  [$V_(C C)$ \= Max, $V_I$ \= 2.4 V],
  [],
  [],
  [40],
  [µA],
  [$I_(I L)$],
  [Low Level Input Current],
  [$V_(C C)$ \= Max, $V_I$ \= 0.4 V],
  [],
  [],
  [−1.6],
  [mA],
  [$I_(O S)$],
  [Short Circuit Output Current (Note 3)],
  [$V_(C C)$ \= Max, DM54],
  [−20],
  [],
  [−55],
  [mA],
  [],
  [],
  [$V_(C C)$ \= Max, DM74],
  [−18],
  [],
  [−55],
  [mA],
  [$I_(C C H)$],
  [Supply Current with Output High],
  [$V_(C C)$ \= Max],
  [],
  [11],
  [21],
  [mA],
  [$I_(C C L)$],
  [Supply Current with Output Low],
  [$V_(C C)$ \= Max],
  [],
  [20],
  [33],
  [mA],
)
]

#emph[Switching Characteristics at $V_(C C)$ \= 5 V and $T_A$ \= 25 °C]

#align(center)[#table(
  columns: 6,
  align: (col, row) => (center,left,left,center,center,center,).at(col),
  inset: 6pt,
  [Symbol], [Parameter], [Conditions], [Min], [Max], [Units],
  [$t_(P L H)$],
  [Propagation Delay Time, Low to High Level Output],
  [$C_L$ \= 15 pF, $R_L$ \= 400 Ω],
  [],
  [27],
  [ns],
  [$t_(P H L)$],
  [Propagation Delay Time, High to Low Level Output],
  [$C_L$ \= 15 pF, $R_L$ \= 400 Ω],
  [],
  [19],
  [ns],
)
]

#emph[Note 2: All typicals are at $V_(C C)$ \= 5 V, $T_A$ \= 25 °C. Note 3: Not more than one output should be shorted at a time.]

=== 1.3 Inngangsstraumur
<inngangsstraumur>
Inngangsstraumur í hástöðu inngangs kallast $I_(I H)$ (#emph[High Level Input Current]) og er gefinn $40 thin mu upright(A)$ miðað við að $V_(C C)$ sé $5","25 thin upright(V)$ og inngangsspennan sé $2","4 thin upright(V)$.

Inngangsstraumur í lágstöðu inngangs kallast $I_(I L)$ (#emph[Low Level Input Current]) og er gefinn $minus 1","6 thin upright(m A)$ miðað við að $V_(C C)$ sé $5","25 thin upright(V)$ og inngangsspennan sé $0","4 thin upright(V)$.

=== 1.4 Útgangsspenna
<útgangsspenna>
Útgangsspennan í #strong[hástöðu] er kölluð $V_(O H)$ (#emph[Voltage Output High]). Hún er gefin að lágmarki $2","4 thin upright(V)$ en er oftast (#emph[typical]) $3","4 thin upright(V)$. Framleiðandinn ábyrgist sem sagt að við eðlilegar aðstæður sé útgangsspennan aldrei lægri en $2","4 thin upright(V)$ og venjulega $3","4 thin upright(V)$.

Útgangsspennan í #strong[lágstöðu] er kölluð $V_(O L)$ (#emph[Voltage Output Low]). Hún er gefin að hámarki $0","4 thin upright(V)$ en er venjulega (#emph[typical]) $0","2 thin upright(V)$. Framleiðandinn ábyrgist að við eðlilegar aðstæður sé þessi spenna oftast $0","2 thin upright(V)$ en geti farið upp í $0","4 thin upright(V)$. Sjáum að þessar stærðir lenda langt frá „gráa svæðinu“ og eru því vel nothæfar sem inngangsspenna inn á rásir sem á eftir koma. Við þurfum því ekki að hafa áhyggjur af útgangsspennunni ef við pössum upp á inngangsspennuna.

#figure(image("myndir/mynd-2.png", width: 184pt), caption: [Mynd 2: Útgangsspenna 74xxx-rása, $V_(O H)$ og $V_(O L)$.], numbering: none)
=== 1.5 Útgangsstraumur
<útgangsstraumur>
Útgangsstraumurinn í #strong[hástöðu] útgangs (rökleg 1) kallast $I_(O H)$ (#emph[High Level Output Current]) og er gefinn $minus 0","8 thin upright(m A)$.

Útgangsstraumurinn í #strong[lágstöðu] útgangs (rökleg 0) kallast $I_(O L)$ (#emph[Low Level Output Current]) og er gefinn $16 thin upright(m A)$.

=== 1.6 FAN OUT
<fan-out>
#emph[Fan out] er stærð sem segir til um hve marga innganga einn útgangur á rökrás getur drifið. #emph[Fan out] er skilgreint sem hlutfallið á milli útstraums og innstraums, bæði í hástöðu og lágstöðu:

$ upright("Fan out") eq I_(O H) / I_(I H) eq frac(0","8 thin upright(m A), 40 thin mu upright(A)) eq 20 #h(2em) upright("eða") #h(2em) upright("Fan out") eq I_(O L) / I_(I L) eq frac(16 thin upright(m A), 1","6 thin upright(m A)) eq 10 $

Veljum lægra gildið, sem er 10 og er fast gildi fyrir 74xxx-rásirnar. Einn útgangur á 74xxx-rás á því að ráða við að drífa 10 innganga sem koma á eftir honum.

=== 1.7 Seinkun (#emph[propagation delay])
<seinkun-propagation-delay>
Seinkun í 74xxx-rásunum er mjög lítil, frá $19 thin upright(n s)$ (hámark) þegar útgangur breytist úr 1 í 0 upp í $27 thin upright(n s)$ (hámark) þegar útgangur breytist úr 0 í 1\. Þetta eru tímar sem við þurfum yfirleitt ekki að hafa áhyggjur af og yfirleitt eru þeir miklu styttri en þetta. Nanósekúnda er milljarðasti hluti úr sekúndu og tíðni eins og t.d. $10 thin upright(M H z)$ ætti ekki að vera vandamál hvað seinkun varðar.

#figure(image("myndir/mynd-3.png", width: 141pt), caption: [Mynd 3: Pinnamynd (pin out) af 7408-rásinni (4 × AND). Pinni 1 er
yfirleitt merktur með punkti á rásinni. Ef vafi leikur á er hann efst
til vinstri þegar hakið á rásinni snýr upp.], numbering: none)
#figure(image("myndir/mynd-4.png", width: 143pt), caption: [Mynd 4: 7400-rásin (4 × NAND) með amerískum táknum fyrir NAND-hlið.], numbering: none)
#strong[Nánari merkingar 74-raðarinnar (Wikipedia)]

#align(center)[#table(
  columns: 2,
  align: (col, row) => (left,left,).at(col),
  inset: 6pt,
  [Röð], [Lýsing],
  [#strong[74]],
  [Upphaflega 74-rásin (10 mW, 10 ns)],
  [#strong[74L]],
  [#emph[Low Power], 1 mW, 33 ns],
  [#strong[74H]],
  [#emph[High Speed], 22 mW, 6 ns],
  [#strong[74S]],
  [#emph[Schottky] (hraðvirk, Schottky-díóður), 19 mW, 3 ns],
  [#strong[74LS]],
  [#emph[Low Power Schottky], 2 mW, 9,5 ns],
  [#strong[74AS]],
  [#emph[Advanced Schottky], 8 mW, 1,7 ns],
  [#strong[74ALS]],
  [#emph[Advanced Low Power Schottky], 1,2 mW, 4 ns],
  [#strong[74F]],
  [#emph[Fast], 4 mW, 3 ns],
)
]

=== 1.8 CMOS-rásir
<cmos-rásir>
CMOS-rásir þekkjast á því að nafn þeirra byrjar á 40 og venjulega er talað um CD4000-röðina. CMOS-rásirnar taka miklu minna afl en 74-röðin og hafa stærra #emph[fan out]. Hver CMOS-útgangur getur þannig drifið fleiri innganga á eftir sér en 74-rásirnar. Þær eru hins vegar hægari en 74-rásirnar. Annar kostur við CMOS-rásirnar er að þær þola breiðara svið fæðispennu, $V_(D D)$, frá $3 thin upright(V)$ til $15 thin upright(V)$ (B-útgáfur allt að $18 thin upright(V)$). Þær eru hins vegar næmari fyrir stöðurafmagni (ESD) en 74-rásirnar og því þarf að meðhöndla þær varlega. CD4000-rásirnar eru minna notaðar í dag vegna framþróunar í 74-röðinni, sem nú inniheldur líka CMOS-rásir.

#strong[CMOS-raðir innan 74-fjölskyldunnar (Wikipedia)]

#align(center)[#table(
  columns: 2,
  align: (col, row) => (left,left,).at(col),
  inset: 6pt,
  [Röð], [Lýsing],
  [#strong[74C]],
  [CMOS 4–15 V operation similar to buffered 4000 (4000B) series.],
  [#strong[74HC]],
  [High-speed CMOS, similar performance to LS, 12 ns. 2.0–6.0 V.],
  [#strong[74HCT]],
  [High speed, compatible logic levels to bipolar parts.],
  [#strong[74AC]],
  [Advanced CMOS, performance generally between S and F.],
  [#strong[74ACQ]],
  [Advanced CMOS with Quiet outputs.],
  [#strong[74AHC]],
  [Advanced high-speed CMOS, three times as fast as HC.],
  [#strong[74ALVC]],
  [Low-voltage – 1.8–3.3 V, propagation delay (TPD) \< 3 ns at 3.3 V.],
  [#strong[74ALVT]],
  [Low-voltage – 2.5–3.3 V, 5 V tolerant inputs, high current ≤ 64 mA, TPD \< 3 ns at 2.5 V.],
  [#strong[74AUC]],
  [Low-voltage – 0.8–2.5 V, TPD \< 2.5 ns at 1.8 V.],
  [#strong[74AUP]],
  [Low-voltage – 0.8–3.6 V (3.3 V typically), TPD 15.6/8.2/4.3 ns at 1.2/1.8/3.3 V, partial power-down specified (IOFF), inputs protected.],
  [#strong[74AVC]],
  [Low-voltage – 1.8–3.3 V, TPD \< 3.2 ns at 1.8 V, bus hold, IOFF.],
  [#strong[74FC]],
  [Fast CMOS, performance similar to F.],
  [#strong[74LCX]],
  [CMOS with 3 V supply and 5 V tolerant inputs.],
  [#strong[74LV]],
  [Low-voltage CMOS – 2.0–5.5 V supply and 5 V tolerant inputs.],
  [#strong[74LVC]],
  [Low voltage – 1.65–3.3 V and 5 V tolerant inputs, TPD \< 5.5 ns at 3.3 V, TPD \< 9 ns at 2.5 V.],
  [#strong[74LV-A]],
  [2.5–5 V, 5 V tolerant inputs, TPD \< 10 ns at 3.3 V, bus hold, IOFF, low noise.],
  [#strong[74LVT]],
  [Low-voltage – 3.3 V supply, 5 V tolerant inputs, high output current \< 64 mA, TPD \< 3.5 ns at 3.3 V, IOFF, low noise.],
  [#strong[74LVQ]],
  [Low-voltage – 3.3 V.],
  [#strong[74LVX]],
  [Low-voltage – 3.3 V with 5 V tolerant inputs.],
  [#strong[74VHC]],
  [Very-high-speed CMOS.],
)
]

#emph[Dynamic Electrical Characteristics at $T_A$ \= 25 °C, input $t_r$, $t_f$ \= 20 ns, $C_L$ \= 50 pF, $R_L$ \= 200 kΩ (CD4000-teljari)]

#align(center)[#table(
  columns: 6,
  align: (col, row) => (left,center,center,center,center,center,).at(col),
  inset: 6pt,
  [Characteristic], [$V_(D D)$ (V)], [Min], [Typ], [Max], [Units],
  [#strong[Input-pulse operation]],
  [],
  [],
  [],
  [],
  [],
  [Propagation Delay Time Φ to $Q_1$ Out; $t_(P H L)$, $t_(P L H)$],
  [5 / 10 / 15],
  [–],
  [180 / 80 / 65],
  [360 / 160 / 130],
  [ns],
  [$Q_n$ to $Q_(n plus 1)$; $t_(P H L)$, $t_(P L H)$],
  [5 / 10 / 15],
  [–],
  [100 / 40 / 30],
  [330 / 80 / 60],
  [ns],
  [Transition Time, $t_(T H L)$, $t_(T L H)$],
  [5 / 10 / 15],
  [–],
  [100 / 50 / 40],
  [200 / 100 / 80],
  [ns],
  [Minimum Input-Pulse Width, $t_W$],
  [5 / 10 / 15],
  [–],
  [70 / 30 / 20],
  [140 / 60 / 40],
  [ns],
  [Input-Pulse Rise or Fall Time, $t_(r Phi)$, $t_(f Phi)$],
  [5 / 10 / 15],
  [],
  [Unlimited],
  [],
  [µs],
  [Maximum Input-Pulse Frequency, $f_Phi$],
  [5 / 10 / 15],
  [3.5 / 8 / 12],
  [7 / 16 / 24],
  [–],
  [MHz],
  [Input Capacitance, $C_I$],
  [Any input],
  [–],
  [5],
  [7.5],
  [pF],
  [#strong[Reset operation]],
  [],
  [],
  [],
  [],
  [],
  [Propagation Delay Time, $t_(P H L)$],
  [5 / 10 / 15],
  [–],
  [140 / 60 / 50],
  [280 / 120 / 100],
  [ns],
  [Minimum Reset Pulse Width, $t_W$],
  [5 / 10 / 15],
  [–],
  [100 / 40 / 30],
  [200 / 80 / 60],
  [ns],
  [Reset Removal Time, $t_(R E M)$],
  [5 / 10 / 15],
  [–],
  [175 / 75 / 50],
  [350 / 150 / 100],
  [ns],
)
]

Gagnablað fyrir CD4000-rás. Gefnar eru upp stærðir miðað við $V_(D D) eq 5 thin upright(V)$, $10 thin upright(V)$ og $15 thin upright(V)$. CD4000-rásirnar hafa því breytilega getu eftir því hver fæðispennan er.

=== 1.9 Afskoppunarrásir (#emph[debouncing])
<afskoppunarrásir-debouncing>
Almennt séð er ekki hægt að nota rofa beint á inngang rökrása. T.d. ef búa á til teljara þar sem á að hækka eða lækka gildið með rofa mun rofinn ekki senda einn púls heldur marga inn á teljarann. Ástæðan fyrir þessu er svokallað snertuskopp (#emph[contact bouncing]). Venjuleg snerta nær ekki strax sambandi heldur skoppar hún vegna gormvirkni rofans. Ef við skoðum merki frá rofa í sveiflusjá lítur það einhvern veginn svona út:

#figure(image("myndir/mynd-5.png", width: 441pt), caption: [Mynd 5: Merki frá rofa með snertuskoppi.], numbering: none)
Merkið sem við viljum hins vegar fá lítur svona út:

#figure(image("myndir/mynd-6.png", width: 441pt), caption: [Mynd 6: Hreinn púls.], numbering: none)
Þessu má redda með svokallaðri afskoppunarrás (#emph[debouncer]). Algeng leið til að gera þetta er að nota svokallaðan NAND-lás. Hann er búinn til úr tveimur tveggja innganga NAND-hliðum. Viðnámin á myndinni eru til að koma í veg fyrir að inngangarnir verði fljótandi (sambandslausir) þegar snertan er ekki tengd við þá. Sem dæmi heldur neðra $10 thin upright(k Omega)$ viðnámið fastri $plus 5 thin upright(V)$ spennu á inngangi 5 miðað við þessa stöðu snertunnar. Ef snertan skiptir um stöðu mun hún á einhverjum tímapunkti lenda mitt á milli inngangs 1 og inngangs 5\. Þá sjá viðnámin til þess að inngangar 1 og 5 hafi $plus 5 thin upright(V)$ spennu en verði ekki fljótandi. Um leið og snertan tengist við inngang 5 verður spennan á þeim inngangi $0 thin upright(V)$ en inngangur 1 verður fastur í $plus 5 thin upright(V)$.

#figure(image("myndir/mynd-7.png", width: 216pt), caption: [Mynd 7: Afskoppunarrás með NAND-lás.], numbering: none)
Ef við skoðum sannleikstöflu tveggja innganga NAND-hliðs skýrist virknin betur.

#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [A], [B], [$Y eq overline(A dot.op B)$],
  [0],
  [0],
  [1],
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

Ef annar hvor eða báðir inngangar NAND-hliðs eru #strong[0] er útgangurinn #strong[1]. Útgangurinn er bara #strong[0] þegar báðir inngangar eru #strong[1]. Skoðum einn púls á rofanum, þ.e. þrýst er á hann og honum síðan sleppt.

#align(center)[#table(
  columns: 2,
  align: (col, row) => (center,center,).at(col),
  inset: 6pt,
  [#box(image("myndir/mynd-8.png", width: 156pt))], [#box(image("myndir/mynd-9.png", width: 154pt))],
  [Mynd 8: 1\. Upphafsstaða.],
  [Mynd 9: 2\. Miðstaða snertu á leið niður.],
  [#box(image("myndir/mynd-10.png", width: 156pt))],
  [#box(image("myndir/mynd-11.png", width: 154pt))],
  [Mynd 10: 3\. Neðsta staða.],
  [Mynd 11: 4\. Miðstaða snertu á leið upp.],
  [#box(image("myndir/mynd-12.png", width: 165pt))],
  [$Q eq 11001$ og $overline(Q) eq 00110$ frá stöðu 1 til stöðu 5\. Sjáum hvernig Q-útgangarnir mynda hreinan púls.],
  [Mynd 12: 5\. Upphafsstaða.],
  [],
)
]

#figure(image("myndir/mynd-13.png", width: 354pt), caption: [Mynd 13: Tvöfaldur NAND-lás með 7400 QUAD DUAL INPUT NAND GATE-rásinni.], numbering: none)
#figure(image("myndir/mynd-14.png", width: 183pt), caption: [Mynd 14: Prent fyrir tvöfaldan NAND-lás.], numbering: none)
#figure(image("myndir/mynd-15.png", width: 193pt), caption: [Mynd 15: Íhlutamynd fyrir tvöfaldan NAND-lás.], numbering: none)
Önnur leið til að búa til hreina púlsa er að nota svokallaðan Schmitt-gikk (#emph[Schmitt trigger]). Rásin 74HC14 inniheldur sex Schmitt-gikki með viðsnúnum (#emph[inverted]) útgangi. Hana má því nota til að hreinsa púlsa frá sex snertum. Kosturinn við að nota Schmitt-gikk er að við þurfum ekki víxlsnertu (NC og NO) eins og í NAND-lásnum.

#figure(image("myndir/mynd-16.png", width: 147pt), caption: [Mynd 16: 74HC14 HEX SCHMITT TRIGGER INVERTERS.], numbering: none)
#figure(image("myndir/mynd-17.png", width: 192pt), caption: [Mynd 17: Afskoppunarrás sem notar eitt af sex hliðum 74HC14-rásarinnar.], numbering: none)
#figure(image("myndir/mynd-18.png", width: 192pt), caption: [Mynd 18: Prentplata fyrir sexfalda Schmitt-gikks-afskoppunarrás.], numbering: none)
#figure(image("myndir/mynd-19.png", width: 210pt), caption: [Mynd 19: Íhlutamynd fyrir sexfalda Schmitt-gikks-afskoppunarrás.], numbering: none)
=== 1.10 Samtenging hliða ef fleiri innganga er þörf (fjölgun innganga)
<samtenging-hliða-ef-fleiri-innganga-er-þörf-fjölgun-innganga>
Ef við þurfum fleiri innganga en í boði eru á einu hliði má tengja saman tvö eða fleiri hlið til að fjölga þeim. Hugsum okkur að við þurfum fjögurra innganga AND-hlið en eigum bara 7408-rásina sem er með fjórum tveggja innganga AND-hliðum.

#figure(image("myndir/mynd-20.png", width: 351pt), caption: [Mynd 20: Fjögurra innganga AND-hlið búið til úr þremur tveggja innganga
AND-hliðum.], numbering: none)
Tengjum inngangana fjóra inn á tvö AND-hlið. Tökum útganga þeirra inn á þriðja AND-hliðið og þá höfum við fjögurra innganga AND-hlið búið til úr þremur tveggja innganga AND-hliðum. Það er auðvelt að sanna með Boole-algebru að þetta gefur sömu niðurstöðu og ef við værum með eitt fjögurra innganga AND-hlið.

Sama gildir um OR-hlið. Við getum búið til fjögurra innganga OR-hlið úr þremur tveggja innganga OR-hliðum. 7432-rásin inniheldur fjögur tveggja innganga OR-hlið.

#figure(image("myndir/mynd-21.png", width: 363pt), caption: [Mynd 21: Fjögurra innganga OR-hlið búið til úr þremur tveggja innganga
OR-hliðum.], numbering: none)
=== 1.11 Verkefni 1
<verkefni-1>
Skoðið dæmið hér að framan. Gildir þetta líka um NAND og NOR? Það er best að sanna eða afsanna með því að búa til tengimynd og nota síðan Boole-algebru.

=== 1.12 Ónotaðir inngangar (fækkun innganga)
<ónotaðir-inngangar-fækkun-innganga>
Aldrei má skilja eftir ótengda innganga á rökrásum. Þá eru þeir það sem kallað er „fljótandi“ og óvíst hvort spennan á þeim er í lágstöðu eða hástöðu. Það þarf því að gera eitthvað við þessa innganga. Það eru tveir möguleikar í boði:

+ Tengja ónotaða innganginn við næsta samliggjandi inngang.
+ Tengja ónotaða innganginn við „hlutlausa“ stöðu.

#strong[Dæmi 1:] Okkur vantar tveggja innganga AND-hlið en höfum bara þriggja innganga. Tengjum neðsta innganginn við miðjuinnganginn. Þá er hliðið orðið tveggja innganga.

#figure(image("myndir/mynd-22.png", width: 188pt), caption: [Mynd 22: $Y eq A dot.op B dot.op B eq A dot.op B$ samkvæmt
Boole-algebru.], numbering: none)
#strong[Dæmi 2:] Okkur vantar tveggja innganga AND-hlið en höfum bara þriggja innganga. Tengjum neðsta innganginn í hástöðu (1, $5 thin upright(V)$) því 1 er hlutleysa margföldunar og AND-hliðið er margföldunarrás.

#figure(image("myndir/mynd-23.png", width: 188pt), caption: [Mynd 23: $Y eq A dot.op B dot.op 1 eq A dot.op B$ samkvæmt
Boole-algebru.], numbering: none)
#strong[Dæmi 3:] Okkur vantar tveggja innganga OR-hlið en höfum bara þriggja innganga. Tengjum neðsta innganginn við miðjuinnganginn. Þá er hliðið orðið tveggja innganga.

#figure(image("myndir/mynd-24.png", width: 186pt), caption: [Mynd 24: $Y eq A plus B plus B eq A plus B$ samkvæmt Boole-algebru.], numbering: none)
#strong[Dæmi 4:] Okkur vantar tveggja innganga OR-hlið en höfum bara þriggja innganga. Tengjum neðsta innganginn í lágstöðu (0, $0 thin upright(V)$) því 0 er hlutleysa samlagningar og OR-hliðið er samlagningarrás.

#figure(image("myndir/mynd-25.png", width: 191pt), caption: [Mynd 25: $Y eq A plus B plus 0 eq A plus B$ samkvæmt Boole-algebru.], numbering: none)
=== 1.13 Verkefni 2
<verkefni-2>
Gilda aðferðirnar í dæmum 1–4 líka fyrir NAND og NOR? Hver er hlutlausa staðan fyrir NAND og hver er hlutlausa staðan fyrir NOR?

=== 1.14 Útgangsmögnun
<útgangsmögnun>
Venjulegur útgangur á rökrás getur ekki drifið straumfreka innganga á eftir sér og því þurfum við að setja mögnunarstig á milli. Við getum í raun látið útgang á rökrás stýra hvaða álagi sem er með réttu mögnunarstigi eða -stigum.

=== 1.15 Transistorar
<transistorar>
Hugsum okkur að við viljum láta rökrásarútgang kveikja á $24 thin upright(V)$ DC segulliða. Það er ljóst að við tengjum segulliðann ekki beint á útganginn því hann hefur hvorki spennu né straumgetu til að drífa hann. En við getum t.d. sett transistor á milli, t.d. BD139 (eða Darlington-transistor ef þörf er á meiri straummögnun), og látið útganginn á rökrásinni stýra basa (#emph[base]) transistorsins.

#figure(image("myndir/mynd-26.png", width: 257pt), caption: [Mynd 26: Transistor sem mögnunarstig.], numbering: none)
#figure(image("myndir/mynd-27.png", width: 428pt), caption: [Mynd 27: 7432 OR-hlið stýrir $24 thin upright(V)$ DC segulliða.], numbering: none)
=== 1.16 ULN2003
<uln2003>
#figure(image("myndir/mynd-28.png", width: 100pt), caption: [Mynd 28: ULN2003-rásin.], numbering: none)
ULN2003-rásin er sjöfaldur Darlington-rekill (#emph[driver]). Hún hefur sjö innganga og sjö útganga ásamt $V_(C C)$\- og $0 thin upright(V)$-tengjum. $V_(C C)$ er fæðispenna hlutarins sem stýra á.

#figure(image("myndir/mynd-29.png", width: 372pt), caption: [Mynd 29: AND- og OR-hlið stýra $24 thin upright(V)$ DC segulliðunum K1
og K2 í gegnum ULN2003.], numbering: none)
Á myndinni stýra AND- og OR-hlið $24 thin upright(V)$ DC segulliðunum K1 og K2. Díóðurnar fyrir álagið eru innbyggðar í ULN2003-rásina og því þarf ekki að setja þær sérstaklega.

ULN2003-rásin hentar sérstaklega vel til að stýra stórum sjö ráka LED-stöfum vegna fjölda útganga. Stafirnir eru þá tengdir með sameiginlegu skauti, CA (sameiginlegur +), og ULN2003-rásin sér um að tengja hverja rák við $0 thin upright(V)$ og kveikja þannig á henni.

=== 1.17 Ljóshlið (#emph[optocoupler])
<ljóshlið-optocoupler>
Ljóshlið aðskilur algerlega straumrás merkjagjafans og álagsins. Ljósdíóða í inngangsstigi ljóshliðsins sendir ljóspúls inn á basa transistors í útgangsstigi ljóshliðsins. Með þessu móti fer enginn straumur á milli inngangs og útgangs, bara ljós. Það eina sem útgangur rökrásarinnar þarf að gera er að kveikja á ljósdíóðu.

#figure(image("myndir/mynd-30.png", width: 198pt), caption: [Mynd 30: 4N25-ljóshliðsrásin. Hún er með aukatengingu við basa
transistorsins svo að hægt er að nota transistorinn í útganginum
sjálfstætt. Annars er pinni 6 skilinn eftir ótengdur.], numbering: none)
#figure(image("myndir/mynd-31.png", width: 364pt), caption: [Mynd 31: Tvö rökrásahlið stýra tveimur segulliðum, K1 og K2, í gegnum
ljóshlið. Enginn straumur fer á milli rásanna.], numbering: none)
== 2\. Leit að bilunum í rökrásum með mælitækjum og hermiforritum
<leit-að-bilunum-í-rökrásum-með-mælitækjum-og-hermiforritum>
=== 2.1 Hermiforrit
<hermiforrit>
Það getur verið gott við hönnun rökrásastýringa að setja rásina upp í hermiforriti eins og Multisim eða Electronics Workbench. Þá er hægt að prófa rásina á tölvuskjá og skoða hvað gerist ef settar eru inn bilanir. Til þess að fá raunhæfar niðurstöður má samt ekki nota „hugsjónarásir“ (#emph[ideal]). T.d. á ekki að vera leyfilegt að skilja eftir ótengdan inngang á rökrás.

=== 2.2 Sveiflusjár
<sveiflusjár>
Til þess að leita að bilunum í raunverulegum rásum er algengast að nota stafrænar sveiflusjár eða svokallaðar prófur (#emph[probes]).

#figure(image("myndir/mynd-32.png", width: 272pt), numbering: none)
#figure(image("myndir/mynd-33.png", width: 312pt), caption: [Mynd 32 og 33: Uppsetning til kennslu og prófana á rökrásum.], numbering: none)
Myndirnar hér að neðan sýna hvað við ættum að sjá á sveiflusjá ef hliðin eru í lagi.

#figure(image("myndir/mynd-34.png", width: 390pt), caption: [Mynd 34: Það sem sést á sveiflusjá ef hliðin eru í lagi.], numbering: none)
#figure(image("myndir/mynd-35.png", width: 419pt), caption: [Mynd 35: Mæling á OR-hliði 7432\. Skjámynd af stafrænni sveiflusjá.], numbering: none)
Sjáum að skjámyndinni ber saman við myndirnar tvær í þriðju röð á mynd 34\. Annar inngangurinn er í upphafi festur í lágstöðu, sem er hlutlaus staða fyrir OR-hlið. Útgangurinn á þá að líta út eins og hinn inngangurinn ef rásin er í lagi.

Hinn inngangurinn er tengdur við tíðnigjafa sem gefur út kassapúls, u.þ.b. $1 thin upright(k H z)$ (rauður ferill). Sjáum að útgangurinn hermir eftir innganginum eins og við vildum. Þegar inngangurinn sem var í lágstöðu er tengdur við hástöðu verður hann ráðandi og útgangurinn festist í hástöðu. Þetta hlið er því greinilega í lagi.

=== 2.3 Prófur
<prófur>
Sveiflusjá er ekki alltaf tiltæk svo gott er að hafa eitthvert nettara bilanaleitartæki, t.d. prófu (#emph[logic probe]).

Til eru margar gerðir af prófum og við getum látið þær sýna okkur hvort tengipunktur er í hástöðu, lágstöðu, púlsandi eða fljótandi. Prófur er hægt að kaupa eða einfaldlega smíða sér sjálfur.

#figure(image("myndir/mynd-36.png", width: 175pt), caption: [Mynd 36: Mynd af prófu. Svarta og rauða klemman fara á
$0 thin upright(V)$ og $plus 5 thin upright(V)$. Pinninn er settur á
þann punkt í rásinni sem mæla á.], numbering: none)
#box(image("myndir/mynd-37.png", width: 174pt)) #box(image("myndir/mynd-38.png", width: 202pt))

#emph[Mynd 37 og 38: Prent af prófu sem auðvelt er að smíða og setja í kassa.]

== 3\. Lásar og vippur
<lásar-og-vippur>
=== 3.1 Lásar
<lásar>
RS-lásinn er notaður til þess að geyma stöður. Hann virkar svipað og hin klassíska segulliðastýring með ræsingu, stöðvun og sjálfheldu. Ef S-inngangurinn fær púls fer Q-útgangurinn í 1 og helst þar, og ef R-inngangurinn fær púls fer Q-útgangurinn í 0 og helst þar. Stöðurnar læsast og þaðan kemur nafnið lásar.

Til eru tvær grunngerðir af lásum. Það eru annars vegar NAND-lás og hins vegar NOR-lás.

Á myndinni hér að neðan er NAND-lás, þ.e. hann er búinn til úr tveimur NAND-hliðum. Til þess að setja hann þarf að setja 0 á S-innganginn („active low“) og til þess að hreinsa hann þarf að setja 0 á R-innganginn. NAND-lásinn má ekki fá stöðuna $S eq R eq 0$. Þá fara báðir útgangar hans í stöðuna $Q eq overline(Q) eq 1$ sem er bönnuð staða.

#box(image("myndir/mynd-39.png", width: 183pt)) #box(image("myndir/mynd-40.png", width: 173pt))

#emph[Mynd 39 og 40: NAND-lás (til vinstri) og NOR-lás (til hægri).]

NOR-lásinn er hins vegar settur og hreinsaður með 1 („active high“ inngangar). NOR-lásinn má ekki fá stöðuna $S eq R eq 1$. Þá fara báðir útgangar hans í stöðuna $Q eq overline(Q) eq 0$ sem er bönnuð staða.

=== 3.2 Sannleikstöflur
<sannleikstöflur>
#strong[RS-NAND-lás]

#align(center)[#table(
  columns: 4,
  align: (col, row) => (center,center,center,center,).at(col),
  inset: 6pt,
  [S], [R], [Q], [$overline(Q)$],
  [0],
  [0],
  [1],
  [1 (bannað)],
  [0],
  [1],
  [1],
  [0],
  [1],
  [0],
  [0],
  [1],
  [1],
  [1],
  [óbreytt (#emph[hold])],
  [óbreytt (#emph[hold])],
)
]

#strong[RS-NOR-lás]

#align(center)[#table(
  columns: 4,
  align: (col, row) => (center,center,center,center,).at(col),
  inset: 6pt,
  [S], [R], [Q], [$overline(Q)$],
  [0],
  [0],
  [óbreytt (#emph[hold])],
  [óbreytt (#emph[hold])],
  [0],
  [1],
  [0],
  [1],
  [1],
  [0],
  [1],
  [0],
  [1],
  [1],
  [0],
  [0 (bannað)],
)
]

=== 3.3 NOR- og NAND-lás í Electronics Workbench
<nor--og-nand-lás-í-electronics-workbench>
#align(center)[#table(
  columns: 2,
  align: (col, row) => (center,center,).at(col),
  inset: 6pt,
  [#box(image("myndir/mynd-41.png", width: 240pt))], [#box(image("myndir/mynd-42.png", width: 230pt))],
  [Mynd 41: $S eq 0$, $R eq 0$],
  [Mynd 42: $S eq 0$, $R eq 1$],
  [#box(image("myndir/mynd-43.png", width: 251pt))],
  [#box(image("myndir/mynd-44.png", width: 213pt))],
  [Mynd 43: $S eq 1$, $R eq 0$],
  [Mynd 44: $S eq 1$, $R eq 1$],
)
]

RS-lás hefur táknið:

#figure(image("myndir/mynd-45.png", width: 84pt), caption: [Mynd 45: Tákn RS-láss.], numbering: none)
=== 3.4 RS-vippur
<rs-vippur>
Vippur eru klukkustýrðar. Það þýðir að það er ekki nóg að breyta inngöngum þeirra til þess að fá breytingu á útgangi, eins og á lásum og venjulegum rökrásum, heldur verða þær líka að fá klukkupúls. Þetta kallast samfasa rásir (#emph[synchronous]). Vippur þekkjast á því að þær hafa klukkuinngang. Til eru tvær gerðir af klukkuinngöngum, #emph[active high] og #emph[active low].

#figure(image("myndir/mynd-46.png", width: 214pt), caption: [Mynd 46: Klukkuinngangur, active high (til vinstri) og active low (til
hægri).], numbering: none)
#emph[Active high]-inngangurinn er virkur þegar klukkupúlsinn breytist úr 0 í 1, þ.e. á forkanti. #emph[Active low]-inngangurinn er virkur þegar klukkupúlsinn breytist úr 1 í 0, þ.e. á bakkanti. Þetta er líka kallað randstýrðar rásir. Klukkuinngangar eru auðkenndir með þríhyrningi.

RS-vippa er eins og NAND-lás með klukkuinngangi.

#figure(image("myndir/mynd-47.png", width: 419pt), caption: [Mynd 47: RS-vippa.], numbering: none)
Í samfasa rásum breytast útgangarnir ekki um leið og inngangarnir breytast. Við þurfum því að skilgreina nýja gerð af sannleikstöflu, svokallaða stöðubreytingatöflu (#emph[transition table]). Ný staða á útgangi getur nefnilega verið háð því hvaða staða var á útganginum þegar klukkupúlsinn kom. Núverandi útgangur, táknaður $Q^n$, er því talinn með inngöngunum í stöðubreytingatöflunni. Útgangur töflunnar verður staðan eftir næsta klukkupúls og er táknaður með $Q^(n plus 1)$.

Taflan verður þá:

#align(center)[#table(
  columns: 5,
  align: (col, row) => (center,center,center,center,left,).at(col),
  inset: 6pt,
  [S], [R], [$Q^n$], [$Q^(n plus 1)$], [],
  [0],
  [0],
  [0],
  [0],
  [óbreytt (#emph[hold])],
  [0],
  [0],
  [1],
  [1],
  [óbreytt (#emph[hold])],
  [0],
  [1],
  [0],
  [0],
  [hreinsun (#emph[reset])],
  [0],
  [1],
  [1],
  [0],
  [hreinsun (#emph[reset])],
  [1],
  [0],
  [0],
  [1],
  [setning (#emph[set])],
  [1],
  [0],
  [1],
  [1],
  [setning (#emph[set])],
  [1],
  [1],
  [0],
  [X],
  [bannað],
  [1],
  [1],
  [1],
  [X],
  [bannað],
)
]

Sé þessi tafla sett í K-kort fæst eftirfarandi útgangsjafna fyrir RS-vippu (bönnuðu stöðurnar eru notaðar sem 1):

$ Q^(n plus 1) eq S plus overline(R) Q^n $

Í bönnuðu stöðunni $S eq R eq 1$ fara báðir útgangarnir, Q og $overline(Q)$, í hástöðu.

=== 3.5 T-vippur
<t-vippur>
T-vippa (#emph[toggle flip-flop]) er einföldust allra vippa. Hún skiptir einfaldlega um stöðu við forkant hvers klukkupúls. Hún hefur útgangsjöfnuna

$ Q^(n plus 1) eq overline(Q^n) $

Tákn hennar er:

#figure(image("myndir/mynd-48.png", width: 105pt), caption: [Mynd 48: Tákn T-vippu.], numbering: none)
Púlsaritið er:

#figure(image("myndir/mynd-49.png", width: 428pt), caption: [Mynd 49: Púlsarit T-vippu.], numbering: none)
Það er hægt að nota hana t.d. til að lækka tíðni. Sjáum að Q-útgangurinn hefur helmingi lægri tíðni en T-inngangurinn. Við getum tengt nokkrar T-vippur saman á eftirfarandi hátt til að lækka tíðni.

#figure(image("myndir/mynd-50.png", width: 311pt), caption: [Mynd 50: Tíðnideiling með T-vippum: 1000 Hz → 500 Hz → 250 Hz.], numbering: none)
=== 3.6 D-vippur
<d-vippur>
D-vippa (#emph[data flip-flop]) er notuð í teljara og gistur (koma síðar). Hún hefur einn samfasa inngang (#emph[synchronous]) sem merktur er D. Hún hefur líka oftast tvo ósamfasa (#emph[asynchronous]) innganga, #emph[Set] og #emph[Clear]. Ósamfasa þýðir að þeir inngangar eru ekki háðir klukkupúlsinum. Ef þeir fá merki setja þeir útganginn í 1 eða hreinsa hann í 0 óháð klukkunni. Þeir hafa því forgang fram yfir klukkuinnganginn.

Útgangsjafna D-vippu er

$ Q^(n plus 1) eq D $

þ.e. núverandi staða á D flyst yfir á útganginn við næsta klukkupúls.

Tákn D-vippu er:

#figure(image("myndir/mynd-51.png", width: 224pt), caption: [Mynd 51: Tákn D-vippu, með active low (til vinstri) og active high (til
hægri) ósamfasa inngöngum.], numbering: none)
Ef við viljum ekki nota ósamfasa inngangana S og C verðum við að fasttengja þá í 1 ef þeir eru #emph[active low] (vinstri myndin) eða í 0 ef þeir eru #emph[active high] (hægri myndin).

=== 3.7 JK-vippur
<jk-vippur>
JK-vippa virkar svipað og RS-vippa með $J eq S$ og $K eq R$, nema hún hefur enga „bannaða“ stöðu. Bannaða staðan $R eq S eq 1$ verður víxlun (#emph[toggle]) á JK-vippu ef $J eq K eq 1$.

Stöðubreytingatafla JK-vippu er:

#align(center)[#table(
  columns: 5,
  align: (col, row) => (center,center,center,center,left,).at(col),
  inset: 6pt,
  [J], [K], [$Q^n$], [$Q^(n plus 1)$], [],
  [0],
  [0],
  [0],
  [0],
  [óbreytt (#emph[hold])],
  [0],
  [0],
  [1],
  [1],
  [óbreytt (#emph[hold])],
  [0],
  [1],
  [0],
  [0],
  [hreinsun (#emph[reset])],
  [0],
  [1],
  [1],
  [0],
  [hreinsun (#emph[reset])],
  [1],
  [0],
  [0],
  [1],
  [setning (#emph[set])],
  [1],
  [0],
  [1],
  [1],
  [setning (#emph[set])],
  [1],
  [1],
  [0],
  [1],
  [víxlun (#emph[toggle])],
  [1],
  [1],
  [1],
  [0],
  [víxlun (#emph[toggle])],
)
]

Ef taflan er sett í K-kort sést að JK-vippa hefur útgangsjöfnuna:

$ Q^(n plus 1) eq J overline(Q^n) plus overline(K) Q^n $

Til er einfölduð útgáfa af stöðubreytingatöflunni sem notuð er í teljararásum, þ.e. ef við höfum bara áhuga á stöðunum #emph[hold] og #emph[toggle]:

#align(center)[#table(
  columns: 5,
  align: (col, row) => (center,center,center,center,left,).at(col),
  inset: 6pt,
  [J], [K], [$Q^n$], [$Q^(n plus 1)$], [],
  [0],
  [X],
  [0],
  [0],
  [#emph[hold]],
  [X],
  [0],
  [1],
  [1],
  [#emph[hold]],
  [1],
  [X],
  [0],
  [1],
  [#emph[toggle]],
  [X],
  [1],
  [1],
  [0],
  [#emph[toggle]],
)
]

Tákn JK-vippu er:

#figure(image("myndir/mynd-52.png", width: 233pt), caption: [Mynd 52: Tákn JK-vippu.], numbering: none)
S- og C-inngangarnir eru ósamfasa og hafa því forgang fram yfir J- og K-inngangana sem eru háðir klukkunni.

=== 3.8 Einföldun á sannleikstöflu JK-vippu
<einföldun-á-sannleikstöflu-jk-vippu>
Stöðubreytingatafla JK-vippu er hér til vinstri. Til hægri er henni raðað eftir breytingunni frá $Q^n$ í $Q^(n plus 1)$:

#align(center)[#table(
  columns: 9,
  align: (col, row) => (center,center,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [J], [K], [$Q^n$], [$Q^(n plus 1)$], [→], [J], [K], [$Q^n$], [$Q^(n plus 1)$],
  [#strong[0]],
  [0],
  [#strong[0]],
  [#strong[0]],
  [],
  [#strong[0]],
  [#emph[0]],
  [0],
  [0],
  [0],
  [#strong[0]],
  [#strong[1]],
  [#strong[1]],
  [],
  [#strong[0]],
  [#emph[1]],
  [0],
  [0],
  [#strong[0]],
  [1],
  [#strong[0]],
  [#strong[0]],
  [],
  [#strong[1]],
  [#emph[0]],
  [0],
  [1],
  [0],
  [#strong[1]],
  [#strong[1]],
  [#strong[0]],
  [],
  [#strong[1]],
  [#emph[1]],
  [0],
  [1],
  [#strong[1]],
  [0],
  [#strong[0]],
  [#strong[1]],
  [],
  [#emph[0]],
  [#strong[1]],
  [1],
  [0],
  [1],
  [#strong[0]],
  [#strong[1]],
  [#strong[1]],
  [],
  [#emph[1]],
  [#strong[1]],
  [1],
  [0],
  [#strong[1]],
  [1],
  [#strong[0]],
  [#strong[1]],
  [],
  [#emph[0]],
  [#strong[0]],
  [1],
  [1],
  [1],
  [#strong[1]],
  [#strong[1]],
  [#strong[0]],
  [],
  [#emph[1]],
  [#strong[0]],
  [1],
  [1],
)
]

Ef við skoðum línur í sannleikstöflunni þar sem breytingin frá $Q^n$ í $Q^(n plus 1)$ er eins, þ.e. $0 arrow.r 0$, $0 arrow.r 1$, $1 arrow.r 0$ og $1 arrow.r 1$, sést að stundum skiptir ekki máli hvað J er og stundum ekki hvað K er.

#strong[Það sem skiptir máli er feitletrað í töflunni að ofan.]

T.d. í breytingunni $0 arrow.r 0$ skiptir ekki máli hvað K er svo við getum táknað það með x (#emph[don’t care]). Þannig er hægt að fara í gegnum allar stöður. Einfaldaða sannleikstaflan verður þá:

#align(center)[#table(
  columns: 5,
  align: (col, row) => (center,center,center,center,center,).at(col),
  inset: 6pt,
  [J], [K], [$Q^n$ (núverandi)], [Breyting], [$Q^(n plus 1)$ (næsta)],
  [#strong[0]],
  [x],
  [#strong[0]],
  [→],
  [#strong[0]],
  [x],
  [#strong[0]],
  [#strong[1]],
  [→],
  [#strong[1]],
  [#strong[1]],
  [x],
  [#strong[0]],
  [→],
  [#strong[1]],
  [x],
  [#strong[1]],
  [#strong[1]],
  [→],
  [#strong[0]],
)
]

=== 3.9 Master–slave-vippur
<masterslave-vippur>
Master–slave-vippur eru búnar til með því að raðtengja tvær D-vippur (D-lása) og snúa klukkuinnganginum á seinni vippunni við með NOT-hliði.

#figure(image("myndir/mynd-53.png", width: 281pt), caption: [Mynd 53: Master–slave-vippa.], numbering: none)
Fyrri vippan (#emph[master]) stýrir þeirri seinni (#emph[slave]). Breytingin frá inngangi út á útgang tekur heilan klukkupúls í master–slave-vippu en ekki bara forkant eða bakkant eins og í venjulegri D-vippu. Á forkantinum les fyrri vippan stöðuna inn og geymir hana. Á bakkantinum er hún lesin út á Q-útganginn á seinni vippunni.

=== 3.10 Breyting úr einni vippugerð í aðra
<breyting-úr-einni-vippugerð-í-aðra>
Hægt er að breyta einni vippugerð í aðra einfaldari með því að nota útgangsjöfnur þeirra:

- #strong[T-vippa:] $Q^(n plus 1) eq overline(Q^n)$
- #strong[D-vippa:] $Q^(n plus 1) eq D$
- #strong[JK-vippa:] $Q^(n plus 1) eq J overline(Q^n) plus overline(K) Q^n$

Búum til T-vippu úr D-vippu: Setjum \= á milli útgangsjafna þeirra.

$ Q^(n plus 1) eq overline(Q^n) #h(0em) upright(" og ") #h(0em) Q^(n plus 1) eq D #h(0em) arrow.r.double #h(0em) D eq overline(Q^n) $

#figure(image("myndir/mynd-54.png", width: 303pt), caption: [Mynd 54: T-vippa búin til úr D-vippu.], numbering: none)
Búum til T-vippu úr JK-vippu: Setjum \= á milli útgangsjafna þeirra.

$ overline(Q^n) eq J overline(Q^n) plus overline(K) Q^n $

Þetta gefur að $J eq K eq 1$ setur JK-vippuna í víxlstöðu (#emph[toggle]).

#figure(image("myndir/mynd-55.png", width: 304pt), caption: [Mynd 55: T-vippa búin til úr JK-vippu.], numbering: none)
== 4\. Ósamfasa og samfasa teljarar
<ósamfasa-og-samfasa-teljarar>
=== 4.1 Ósamfasa teljarar
<ósamfasa-teljarar>
Til eru tvær gerðir af teljurum, ósamfasa (#emph[asynchronous]) og samfasa (#emph[synchronous]). Ósamfasa teljarar eru þannig að klukkupúlsinn kemur bara inn á fyrstu vippuna og útgangur fyrstu vippunnar er síðan klukkuinngangur vippu númer 2 o.s.frv.

Skoðum eftirfarandi ósamfasa teljara:

#figure(image("myndir/mynd-56.png", width: 413pt), caption: [Mynd 56: Þriggja bita ósamfasa teljari með D-vippum og púlsarit hans.], numbering: none)
Sjáum að D-vippurnar eru tengdar í víxltengingu (#emph[toggle]). Fyrsta vippan víxlar á hverjum klukkupúlsi, önnur á öðrum hverjum og sú þriðja á fjórða hverjum. Q-útgangarnir mynda því rununa 111, 110, 101, 100, 011, 010, 001, 000, 111, … eða 7, 6, 5, 4, 3, 2, 1, 0, 7, … Þetta er því þriggja bita niðurteljari.

$overline(Q)$-útgangarnir búa hins vegar til öfuga runu við Q, þ.e. þeir mynda rununa 000, 001, 010, 011, 100, 101, 110, 111, 000, …, eða 0, 1, 2, 3, 4, 5, 6, 7, 0, … Þeir mynda því þriggja bita uppteljara.

Gallinn við ósamfasa teljara er að það er seinkun í hverri vippu og ef tíðni klukkupúlsins er há er ekki víst að þær nái allar að fylgja eftir.

=== 4.2 Hönnun ósamfasa teljara
<hönnun-ósamfasa-teljara>
Prófum að hanna 3 bita ósamfasa teljara sem telur 7, 6, 5, 4, 3, 7, 6, … Við þurfum því að „setja“ teljarann í stöðunni 2, þ.e. þvinga alla útgangana í 1 svo að hann byrji aftur í 7 (7 \= 111). Staðan 2 er 010\. Þegar hún kemur upp þurfum við að fá 1 inn á #emph[Set]-inngangana (gerum ráð fyrir að þeir séu #emph[active high]).

#figure(image("myndir/mynd-57.png", width: 91pt), caption: [Mynd 57: Rás sem gefur út 1 í stöðunni $Q_2 Q_1 Q_0 eq 010$.], numbering: none)
Rásin á mynd 57 gefur út 1 í stöðunni 010 en 0 annars. Við getum því notað hana til þess að setja vippurnar í 111\.

#figure(image("myndir/mynd-58.png", width: 312pt), caption: [Mynd 58: Teljari sem telur 7, 6, 5, 4, 3, 7, 6, …], numbering: none)
Þessi teljari telur því 7, 6, 5, 4, 3, 7, 6, …

Ef við viljum hanna uppteljara þarf að breyta tengingunum í rásinni á eftirfarandi hátt:

#figure(image("myndir/mynd-59.png", width: 312pt), caption: [Mynd 59: Breyttar tengingar fyrir uppteljara.], numbering: none)
eða nota $overline(Q)$-útgangana inn á skjáinn.

#figure(image("myndir/mynd-60.png", width: 419pt), caption: [Mynd 60: JK 4 bita ósamfasa niðurteljari í Electronics Workbench.], numbering: none)
#figure(image("myndir/mynd-61.png", width: 419pt), caption: [Mynd 61: JK 4 bita ósamfasa uppteljari í Electronics Workbench.], numbering: none)
=== 4.3 Hönnun samfasa teljara
<hönnun-samfasa-teljara>
Hönnun samfasa teljara fer fram í 6 skrefum:

+ Stöðurit (#emph[state diagram])
+ Stöðutafla (#emph[state table])
+ Stöðubreytingatafla (#emph[transition table])
+ Örvunarkort (#emph[excitation maps])
+ Örvunarjöfnur (#emph[excitation equations])
+ Rásin teiknuð

==== Dæmi 1
<dæmi-1>
Hönnum samfasa teljara sem telur 0-1-2-3-0-1-2-3 …

#strong[Stöðurit]

#figure(image("myndir/mynd-62.png", width: 283pt), caption: [Mynd 62: Stöðurit teljara sem telur 0, 1, 2, 3, 0, …], numbering: none)
#strong[Stöðutafla]

$S^n$ er núverandi staða og $S^(n plus 1)$ er næsta staða.

#align(center)[#table(
  columns: 2,
  align: (col, row) => (center,center,).at(col),
  inset: 6pt,
  [$S^n$], [$S^(n plus 1)$],
  [S0],
  [S1],
  [S1],
  [S2],
  [S2],
  [S3],
  [S3],
  [S0],
)
]

#strong[Stöðubreytingatafla]

Hér tengjum við hverja stöðu í stöðutöflunni við útganga vippanna. Þetta er tveggja bita teljari svo við notum tvær vippur og köllum útgangana $Q_0$ (LSB) og $Q_1$ (MSB). Skref 1 til 3 eru óháð vippugerð.

#align(center)[#table(
  columns: 5,
  align: (col, row) => (center,center,center,center,center,).at(col),
  inset: 6pt,
  [Staða], [$Q_1^n$], [$Q_0^n$], [$Q_1^(n plus 1)$], [$Q_0^(n plus 1)$],
  [S0],
  [0],
  [0],
  [0],
  [1],
  [S1],
  [0],
  [1],
  [1],
  [0],
  [S2],
  [1],
  [0],
  [1],
  [1],
  [S3],
  [1],
  [1],
  [0],
  [0],
)
]

#strong[Örvunarkort]

Hér þurfum við að ákveða hvaða vippugerð við notum. Notum D-vippur. Það er einfaldara að hanna með D-vippum en rásirnar vilja verða flóknari en ef við notum JK-vippur. Örvunarkortið er eins konar K-kort þar sem hver reitur inniheldur gildið á D-innganginum sem þarf til þess að vippan skipti úr stöðu $n$ yfir í stöðu $n plus 1$ við næsta klukkupúls. Við erum með tvo innganga, $D_0$ og $D_1$, og þurfum að búa til sitt kortið fyrir hvorn.

#figure(image("myndir/mynd-63.png", width: 418pt), caption: [Mynd 63: Örvunarkort fyrir $D_0$ og $D_1$.], numbering: none)
Sjáum að í fyrra kortinu höfum við bara áhuga á seinni bitanum. Það er vegna þess að $D_0$-inngangurinn getur bara breytt honum; hann er $Q_0$. Til þess að breyta $Q_0$ úr 0 í 1 þarf $D_0$ að vera 1 þegar klukkupúlsinn kemur. Útgangsjafna D-vippu er $Q^(n plus 1) eq D$.

Næst hópum við saman reiti sem innihalda 1, lóðrétt eða lárétt.

Í fyrra kortinu getum við hópað saman tvo reiti lóðrétt. Þeir innihalda stöðurnar 00 og 10\. Sjáum að $Q_1$ breytist (er 0 og 1) og dettur því út. $Q_0$-útgangurinn er hins vegar 0 í báðum reitum og verður því $D_0 eq overline(Q_0)$ í jöfnunni.

Í seinna kortinu náum við ekki að hópa neitt saman og reitirnir sem innihalda 1 verða því stakir. Sá sem er efst til hægri inniheldur 01 og verður því $overline(Q_1) dot.op Q_0$. Hinn inniheldur 10 og verður því $Q_1 dot.op overline(Q_0)$. Saman mynda þeir jöfnuna:

$ D_1 eq overline(Q_1) dot.op Q_0 plus Q_1 dot.op overline(Q_0) eq Q_1 xor Q_0 $

Þetta er því XOR-hlið.

#strong[Örvunarjöfnur]

Við fundum þær í skrefi 4:

$ D_0 eq overline(Q_0) #h(2em) D_1 eq overline(Q_1) dot.op Q_0 plus Q_1 dot.op overline(Q_0) eq Q_1 xor Q_0 $

#strong[Rásin teiknuð]

#figure(image("myndir/mynd-64.png", width: 418pt), caption: [Mynd 64: Samfasa teljari sem telur 0, 1, 2, 3, 0, …], numbering: none)
Sjáum að fyrri D-vippan er tengd í víxlham (#emph[toggle mode]), þ.e. næsta staða verður öfug við núverandi stöðu.

Þetta er frekar einfaldur teljari. Þegar við höfum náð góðu valdi á þessari hönnun er nóg að byrja í skrefi 4, þ.e. fara beint í örvunarkortið. Fyrstu þrjú skrefin eru frekar einföld.

=== 4.4 Fleiri teljarar
<fleiri-teljarar>
Hönnum nú flóknari teljara: BCD-teljara með JK-vippum. Hann telur frá 0 upp í 9, þ.e. tugakerfistölurnar.

JK-vippa hefur útgangsjöfnuna $Q^(n plus 1) eq J overline(Q^n) plus overline(K) Q^n$. Út frá þessari jöfnu má setja upp stöðubreytingatöfluna (X \= skiptir ekki máli):

#align(center)[#table(
  columns: 5,
  align: (col, row) => (center,center,center,center,left,).at(col),
  inset: 6pt,
  [J], [K], [$Q^n$], [$Q^(n plus 1)$], [],
  [0],
  [X],
  [0],
  [0],
  [#emph[hold]],
  [X],
  [0],
  [1],
  [1],
  [#emph[hold]],
  [1],
  [X],
  [0],
  [1],
  [#emph[toggle]],
  [X],
  [1],
  [1],
  [0],
  [#emph[toggle]],
)
]

Við höfum bara áhuga á stöðunum #emph[toggle] og #emph[hold] og þess vegna getum við notað þessa einfölduðu sannleikstöflu fyrir JK-vippu. Það er nefnilega kostur að fá margar stöður sem skipta ekki máli (X \= #emph[don’t care]) því við getum ráðið því hvort við notum þær sem 1 eða 0 í K-kortinu.

Til þess að telja 0 … 9 þurfum við fjórar JK-vippur. Við þurfum því að búa til átta örvunarkort, þ.e. fyrir $J_0 comma K_0 comma dots.h comma J_3 comma K_3$.

Þær stöður sem við notum ekki, þ.e. tölurnar frá 10 til 15 (1010 til 1111), setjum við inn sem X, eða stöður sem skipta ekki máli (#emph[don’t care]).

#figure(image("myndir/mynd-65.png", width: 419pt), caption: [Mynd 65: Örvunarkort BCD-teljarans.], numbering: none)
Út frá þessum kortum koma jöfnurnar:

$ J_0 eq 1 comma quad K_0 eq 1 comma quad J_1 eq Q_0 dot.op overline(Q_3) comma quad K_1 eq Q_0 comma quad J_2 eq Q_0 dot.op Q_1 comma quad K_2 eq Q_0 dot.op Q_1 comma quad J_3 eq Q_0 dot.op Q_1 dot.op Q_2 comma quad K_3 eq Q_0 $

Þá er hægt að teikna teljarann:

#figure(image("myndir/mynd-66.png", width: 408pt), caption: [Mynd 66: BCD-teljari með JK-vippum.], numbering: none)
Útgangana $Q_0$ til $Q_3$ má síðan tengja inn á skjá. Þetta er líka gott verkefni til þess að stilla upp í Multisim eða Electronics Workbench.

#figure(image("myndir/mynd-67.png", width: 427pt), caption: [Mynd 67: BCD-teljarinn í hermiforriti.], numbering: none)
S- og R-inngangarnir eru #emph[active high] og því þarf að tengja þá í $0 thin upright(V)$. Sjáum líka að klukkuinngangurinn á JK-vippunum er #emph[active low]. Það kemur ekki að sök; þær skipta þá á bakkanti klukkupúlsins.

=== 4.5 Greining samfasa teljara
<greining-samfasa-teljara>
Ef við fáum í hendurnar mynd af samfasa teljara, hvernig getum við séð hvernig hann telur?

Við þurfum að hugsa þetta vandamál sem öfuga hönnun, þ.e. við rekjum okkur frá teikningunni af rásinni að forsendum hönnunarinnar, þ.e. hvernig teljarinn á að telja. Tökum dæmi:

#figure(image("myndir/mynd-68.png", width: 209pt), caption: [Mynd 68: Samfasa teljari sem á að greina.], numbering: none)
#strong[I. Örvunarjöfnur:]

a) $D_0 eq overline(Q_0)$ \
b) $D_1 eq Q_0 xor Q_1$

#strong[II. Stöðubreytingajöfnur.] Útgangsjafna D-vippu er $Q^(n plus 1) eq D$:

a) $Q_0^(n plus 1) eq D_0 eq overline(Q_0) #h(0em) arrow.r.double #h(0em) Q_0^(n plus 1) eq overline(Q_0^n)$ \
b) $Q_1^(n plus 1) eq D_1 eq Q_0 xor Q_1 #h(0em) arrow.r.double #h(0em) Q_1^(n plus 1) eq Q_0^n xor Q_1^n$

#strong[III. Stöðubreytingatafla:]

#align(center)[#table(
  columns: 6,
  align: (col, row) => (center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [Staða$""^n$], [$Q_1^n$], [$Q_0^n$], [$Q_1^(n plus 1) eq Q_0^n xor Q_1^n$], [$Q_0^(n plus 1) eq overline(Q_0^n)$], [Staða$""^(n plus 1)$],
  [S0],
  [0],
  [0],
  [0],
  [1],
  [S1],
  [S1],
  [0],
  [1],
  [1],
  [0],
  [S2],
  [S2],
  [1],
  [0],
  [1],
  [1],
  [S3],
  [S3],
  [1],
  [1],
  [0],
  [0],
  [S0],
)
]

Sjáum hér að talningin er S0 → S1 → S2 → S3 → S0 …, eða 0, 1, 2, 3, 0, …

==== Dæmi 2
<dæmi-2>
#strong[Greinið teljarann á myndinni.]

#figure(image("myndir/mynd-69.png", width: 265pt), caption: [Mynd 69: Teljarinn í dæmi 2\.], numbering: none)
#strong[Lausn:] Útgangsjafna JK-vippu er $Q^(n plus 1) eq J dot.op overline(Q^n) plus overline(K) dot.op Q^n$. Af myndinni lesum við:

$ J_0 eq 1 comma quad K_0 eq 1 comma quad J_1 eq overline(Q_0) comma quad K_1 eq overline(Q_0) $

$ Q_0^(n plus 1) eq J_0 dot.op overline(Q_0^n) plus overline(K_0) dot.op Q_0^n eq 1 dot.op overline(Q_0^n) plus overline(1) dot.op Q_0^n eq overline(Q_0^n) $

$ Q_1^(n plus 1) eq J_1 dot.op overline(Q_1^n) plus overline(K_1) dot.op Q_1^n eq overline(Q_0^n) dot.op overline(Q_1^n) plus Q_0^n dot.op Q_1^n eq overline(Q_0^n xor Q_1^n) quad upright("(XNOR)") $

#align(center)[#table(
  columns: 4,
  align: (col, row) => (center,center,center,center,).at(col),
  inset: 6pt,
  [$Q_1^n$], [$Q_0^n$], [$Q_1^(n plus 1) eq overline(Q_0^n xor Q_1^n)$], [$Q_0^(n plus 1) eq overline(Q_0^n)$],
  [0],
  [0],
  [1],
  [1],
  [0],
  [1],
  [0],
  [0],
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

S0 → S3, S1 → S0, S2 → S1, S3 → S2, þ.e. teljarinn telur 0, 3, 2, 1, 0, 3, … (niðurteljari).

==== Verkefni
<verkefni>
Greinið teljarann á myndinni.

#figure(image("myndir/mynd-70.png", width: 309pt), caption: [Mynd 70: Teljarinn í verkefninu.], numbering: none)
$D_0 eq$ \
$D_1 eq$ \
$D_2 eq$

== 5\. Notkun teljara
<notkun-teljara>
=== 5.1 74192 BCD-teljari
<bcd-teljari>
74192 er tilbúinn MOD10- eða BCD-teljari (0–9). Hann getur talið bæði upp og niður og auðvelt er að tengja nokkra saman ef telja á stærri tölur. Við þurfum einn fyrir 0–9, tvo fyrir 0–99, þrjá fyrir 0–999 o.s.frv. Hann hefur fjóra gagnainnganga (#emph[Input A] til #emph[Input D]) til þess að setja inn fyrir fram ákveðna stöðu (#emph[preset]). Hún er lesin inn með því að setja $0 thin upright(V)$ inn á $overline(upright(L O A D))$-innganginn (#emph[active low]). Ef við ætlum ekki að nota fyrir fram gefnar stöður festum við $overline(upright(L O A D))$-innganginn í $plus 5 thin upright(V)$ og gerum hann þannig óvirkan.

Teljarinn er endursettur með því að setja $plus 5 thin upright(V)$ inn á #emph[Clear]-innganginn (#emph[active high]). Klukkuinngangarnir eru tveir, #emph[Count Down] (niðurtalning) og #emph[Count Up] (upptalning). $overline(upright(B o r r o w))$\- og $overline(upright(C a r r y))$-útgangarnir stýra klukkuinngöngunum á næsta teljara á eftir til að lækka eða hækka gildi hans. Útgangarnir #emph[Output A] til #emph[Output D] eru síðan teknir inn á sjö ráka afkóðunarrás (7447 eða 7448) sem er síðan tengd inn á sjö ráka staf (skjá).

#figure(image("myndir/mynd-71.png", width: 418pt), caption: [Mynd 71: Tenging á einum 74192-teljara við sjö ráka afkóðunarrás og sjö
ráka staf. Stöðurnar á gagnainngöngum teljarans eru x (don’t care) því
þær skipta ekki máli ef $overline(upright(L O A D))$ er í
$plus 5 thin upright(V)$.], numbering: none)
#figure(image("myndir/mynd-72.png", width: 418pt), caption: [Mynd 72: Upp- og niðurteljari sem telur 0–999 eða 999–0.], numbering: none)
Sjáum hvernig $overline(upright(C a r r y))$ og $overline(upright(B o r r o w))$ stýra klukkuinngöngum næsta teljara á eftir. Þegar fyrsti teljarinn skiptir úr 9 í 0 sendir $overline(upright(C a r r y))$-útgangurinn púls inn á næsta teljara og hækkar hann um 1 (hækkun á tug). Þegar teljari nr. 2 skiptir úr 9 í 0 sendir hann púls inn á þriðja teljarann og hækkar hann um 1 (hækkun á hundraði).

=== 5.2 MOD6-teljari búinn til úr 74192 BCD-teljara
<mod6-teljari-búinn-til-úr-74192-bcd-teljara>
Hægt er að búa til MOD6-teljara (0–5) úr 74192 BCD-teljara. Hann endursetur sig (#emph[Clear]) á tölunni CBA \= 110 sem er 6 í tugakerfi. Hann telur því 0-1-2-3-4-5-0-1-2-3-4 …

A-útgangurinn er 0 og þarf því að fara í gegnum NOT-hlið til að fá stöðuna 111 inn á AND-hliðið. Þá gefur AND-hliðið 1 inn á #emph[Clear]-innganginn og endursetur teljarann í stöðuna 0\. AND-hliðið gefur alltaf út 0 nema í stöðunni 110; þá gefur það út 1\.

MOD6-teljarinn ásamt BCD-teljaranum er nauðsynlegur í hönnun á klukku þar sem sekúndur og mínútur endursetja sig eftir stöðuna 59, þ.e. þær fara úr 59 í 00\.

#figure(image("myndir/mynd-73.png", width: 137pt), caption: [Mynd 73: MOD6-teljari búinn til úr 74192\.], numbering: none)
Það er hægt að búa til hvaða MOD-teljara sem er frá MOD2 til MOD9 með þessum teljara. Stöðurnar sem eiga að hreinsa teljarann eru settar inn á AND-hlið sem gefur $plus 5 thin upright(V)$ inn á #emph[Clear] við rétta stöðu. #strong[Athugið:] Teljari sem telur 0–7 endursetur sig í stöðunni 8 \= 1000\. Það er alltaf staðan sem er einum hærri en talan sem við viljum enda lotuna á. Þess vegna heitir teljari sem telur 0–9 MOD10 og teljari sem telur 0–5 MOD6. MOD10 hefur 10 stöður, 0–9, og MOD6 hefur 6 stöður, 0–5.

MOD10 er líka kallaður BCD-teljari (#emph[Binary Coded Decimal]) því hann sýnir bara tugakerfistölustafi.

Einnig er til teljarinn 74193 sem er MOD16- eða HEX-teljari og hefur 16 stöður.

=== 5.3 7447 og 7448 sjö ráka afkóðunarrásir
<og-7448-sjö-ráka-afkóðunarrásir>
#strong[Seven Segment Decoder, CA og CC.]

Sjö ráka afkóðunarrásirnar (#emph[seven segment decoders]) breyta fjögurra bita innmerki í sjö útganga fyrir sjö ráka staf. Inngangarnir heita #emph[Input A] (LSB), #emph[Input B], #emph[Input C] og #emph[Input D] (MSB).

Afkóðunarrásirnar sýna tölustafina 0 til 9 fyrir inngangana DCBA \= 0000 til 1001\. Það er síðan misjafnt eftir gerðum afkóðunarrása hvað þær sýna fyrir inngangana DCBA \= 1010–1111, eða 10–15. Sumar rásir, eins og t.d. 7447 og 7448, sýna einhver tákn fyrir 10–14 og staðan 1111 \= 15 slekkur á stafnum. Aðrar afkóðunarrásir sýna HEX-tölur (sextándukerfi) fyrir ofan 9 (A, b, C, d, E, F).

#figure(image("myndir/mynd-74.png", width: 105pt), caption: [Mynd 74: Sjö ráka afkóðunarrás.], numbering: none)
#strong[Lamp Test-inngangurinn, $overline(upright(L T))$ (stafprófun)]

#emph[Lamp Test]-inngangurinn er #emph[active low] ($overline(upright(L T))$) og verður því virkur í lágstöðu. Sé hann settur í lágstöðu kveikir hann á öllum útgöngum afkóðunarrásarinnar og ef tölustafurinn 8 birtist er stafurinn í lagi. Sé ekki verið að nota #emph[Lamp Test] verður $overline(upright(L T))$-inngangurinn að vera fastur í $5 thin upright(V)$ (1). Þá er hann óvirkur eða hlutlaus.

#figure(image("myndir/mynd-75.png", width: 345pt), caption: [Mynd 75: Notkun á Lamp Test. Stöður sem skiptir ekki máli hvort eru 0
eða 1 (don’t care) eru merktar með x. Setjum $0 thin upright(V)$ inn á
$overline(upright(L T))$-innganginn á öllum rásunum.], numbering: none)
#strong[RBI- og RBO-inngangarnir og núllbæling (#emph[zero suppression])]

Þegar sýna á tölu eins og t.d. 35 á þriggja stafa skjá myndi hann að öllu óbreyttu sýna 035\.

#figure(image("myndir/mynd-76.png", width: 354pt), caption: [Mynd 76: Talan 35 á þriggja stafa skjá án núllbælingar.], numbering: none)
Til þess að sleppa því að sýna óþörf núll, t.d. hundruð í tugatölu eða hundruð og tugi í einingatölu, notum við núllbælingu (#emph[zero suppression]).

#figure(image("myndir/mynd-77.png", width: 355pt), caption: [Mynd 77: Talan 35 með núllbælingu.], numbering: none)
Reglan er sú að ef $overline(upright(B I)) eq 0$ og DCBA \= 0000 slekkur afkóðunarrásin á útgöngum sínum og þá slokknar á stafnum. Hún sendir um leið stöðuna 0 frá $overline(upright(R B O))$-útganginum inn á $overline(upright(B I))$ á næstu afkóðunarrás fyrir neðan í röðinni.

Tökum annað dæmi og skrifum út töluna 7 (007) með núllbælingu.

#figure(image("myndir/mynd-78.png", width: 363pt), caption: [Mynd 78: Talan 7 (007) með núllbælingu.], numbering: none)
Hér fær afkóðunarrásin fyrir hundruð fasta $0 thin upright(V)$ spennu inn á $overline(upright(B I))$-innganginn og núllbæling er því virk á henni. Þegar gagnainngangar hennar verða DCBA \= 0000 slekkur hún á útgöngunum a til g og sendir $0 thin upright(V)$ frá $overline(upright(R B O))$-útganginum inn á $overline(upright(B I))$-innganginn á afkóðunarrásinni fyrir tugi. Þegar gagnainngangar tuganna verða líka DCBA \= 0000 slekkur afkóðunarrásin fyrir tugina á útgöngunum a til g og sendir $0 thin upright(V)$ inn á $overline(upright(B I))$-innganginn á afkóðunarrásinni fyrir einingar. En þar sem gagnainngangar afkóðunarrásarinnar fyrir einingar eru DCBA \= 0111 en ekki 0000 birtir hún töluna 7\.

=== 5.4 Sjö ráka stafur búinn til úr ljósdíóðum
<sjö-ráka-stafur-búinn-til-úr-ljósdíóðum>
Stundum þarf stærri stafi en hægt er að kaupa tilbúna. Þá er hægt að smíða sína eigin sjö ráka stafi úr ljósdíóðum.

#align(center)[#table(
  columns: 2,
  align: (col, row) => (center,center,).at(col),
  inset: 6pt,
  [Útgáfa 1], [Útgáfa 2],
  [#box(image("myndir/mynd-79.png", width: 183pt))],
  [#box(image("myndir/mynd-80.png", width: 135pt))],
  [Mynd 79: 10 mm LED, 2,4 V, 50 mA. Einföld röð, 10 ljósdíóður raðtengdar í hverri rák. Samtals 70 ljósdíóður. Tengt með sameiginlegu skauti, CA (sameiginlegur +).],
  [Mynd 80: 10 mm LED, 2,4 V, 50 mA. Tvöföld röð, 5 ljósdíóður raðtengdar í hvorri grein. Samtals 70 ljósdíóður. Tengt með sameiginlegu skauti, CA (sameiginlegur +).],
)
]

Það er ljóst að 7448-rásin getur ekki drifið svona stóra stafi beint og því þarf að setja Darlington-rekilinn ULN2003 á milli.

=== 5.5 Darlington-rekillinn ULN2003A
<darlington-rekillinn-uln2003a>
#figure(image("myndir/mynd-81.png", width: 104pt), caption: [Mynd 81: ULN2003A.], numbering: none)
Þótt stóru ljósstafirnir séu tengdir með sameiginlegu forskauti (CA) þarf samt 7448-rásina (CC) til að kóða stafina. Það er vegna þess að ULN2003A-rásin er með viðsnúnum (#emph[inverted]) útgangi og 7448 og ULN2003A vinna því saman eins og 7447-rás með margfalda aflgetu.

#figure(image("myndir/mynd-82.png", width: 417pt), caption: [Mynd 82: 7448 og ULN2003A stýra stórum sjö ráka staf.], numbering: none)
$plus V_(C C)$-inngangurinn á ULN2003-rásinni þarf að fá sömu jákvæðu spennu og stafurinn fær, eða $plus 24 thin upright(V)$. ULN2003-rásin tengir síðan hverja rák (#emph[segment]) við $0 thin upright(V)$ og þannig kviknar á rákinni.

#figure(image("myndir/mynd-83.png", width: 355pt), caption: [Mynd 83: Innáskiptispjald fyrir fótbolta. 8 stk. 10 mm LED í hverri rák.], numbering: none)
==== Verkefni: Teljari 0–99
<verkefni-teljari-099>
Hér er prentplata fyrir teljara sem telur 0–99 bæði upp og niður.

#figure(image("myndir/mynd-84.png", width: 239pt), caption: [Mynd 84: Prent fyrir teljararás. Stærri platan er 82 mm × 55 mm og sú
minni 65 mm × 41 mm.], numbering: none)
#figure(image("myndir/mynd-85.png", width: 275pt), caption: [Mynd 85: Tengimynd fyrir teljarann.], numbering: none)
#figure(image("myndir/mynd-86.png", width: 140pt), caption: [Mynd 86: Teljarinn 0–99 tilbúinn.], numbering: none)
Þessa rás er síðan hægt að setja í lítinn kassa. Jafnvel má nota tvær saman og þá er komið stigaborð fyrir spurningakeppni ☺

=== 5.6 Sérstakir teljarar
<sérstakir-teljarar>
==== 5.6.1 Johnson-teljari
<johnson-teljari>
4 bita Johnson-teljari telur:

0000 – 1000 – 1100 – 1110 – 1111 – 0111 – 0011 – 0001 – 0000 …

Hann er búinn til úr fjórum D-vippum sem tengdar eru saman í halarófu en samfasa.

#figure(image("myndir/mynd-87.png", width: 417pt), caption: [Mynd 87: Tengimynd Johnson-teljara.], numbering: none)
#figure(image("myndir/mynd-88.png", width: 419pt), caption: [Mynd 88: Johnson-teljari í hermiforriti.], numbering: none)
==== 5.6.2 Overbeck-teljari (hringteljari)
<overbeck-teljari-hringteljari>
4 bita Overbeck-teljari (oftast kallaður hringteljari, #emph[ring counter]) telur 1000 – 0100 – 0010 – 0001 – 1000 … Það er alltaf bara einn útgangur í stöðunni 1 í einu. Hann þarf þó að fá einn púls inn á D-inngang fyrstu vippu til að fara í gang.

#figure(image("myndir/mynd-89.png", width: 419pt), caption: [Mynd 89: Tengimynd Overbeck-teljara.], numbering: none)
#figure(image("myndir/mynd-90.png", width: 418pt), caption: [Mynd 90: Overbeck-teljari í hermiforriti.], numbering: none)
==== 5.6.3 Klukka
<klukka>
Til að búa til klukku þurfum við þrjá MOD10-teljara, tvo MOD6-teljara og einn MOD3-teljara (tugir klukkustunda, 0–2). Klukkan á að endursetja sig eftir stöðuna 23:59:59 og fara í 00:00:00. Við þurfum því að skoða sérstaklega MOD3- og MOD10-teljarana fyrir klukkustundirnar. Þeir endursetja sig þegar klukkan reynir að fara í 24:00:00. Það er því staðan 24 á klukkustundunum sem við notum til að endursetja þær. Mínútur og sekúndur endursetja sig sjálfar. $24 eq 0010 #h(0em) 0100_(B C D)$. Við getum því notað þá bita sem eru 1 akkúrat í þessari stöðu. Það er $Q_1$ á tugateljaranum og $Q_2$ á MOD10-teljaranum. Í sjálfu sér þarf ekki sérstakan MOD3-teljara fyrir tugi klukkustundanna. Hægt er að nota MOD10-teljara því hann er hvort sem er endursettur í stöðunni 24:00:00.

#figure(image("myndir/mynd-91.png", width: 419pt), caption: [Mynd 91: Klukka búin til með 74192 BCD-teljararásum. Raða þarf stöfunum
í rétta röð.], numbering: none)
Ef við skoðum klukkustundirnar sérstaklega sést að þær endursetja sig þegar 23 breytist í 24\. Breytingin er frá 0010 0011 yfir í 0010 0100\. Við getum því notað bitana sem eru 1 í stöðunni 24 til að endursetja klukkustundirnar. Það er #emph[Output B] á tugunum og #emph[Output C] á einingunum. Tökum þessa útganga inn á AND-hlið sem endursetur síðan tvo öftustu teljarana og staðan fer úr 24:00:00 í 00:00:00.

#figure(image("myndir/mynd-92.png", width: 419pt), caption: [Mynd 92: 24 stunda klukka úr hermiforriti. Hér er 74192-rásin ekki notuð
heldur eru allir teljarar hannaðir sérstaklega með JK-vippum. Þeim er
síðan breytt í undirrásir (Sub Circuit) í forritinu og gefin nöfnin
Mod\_2, Mod\_6 og Mod\_10. Klukkuna má stilla á hærri tíðni en 1 Hz til
að flýta fyrir hermun.], numbering: none)
== 6\. Gistur (#emph[registers])
<gistur-registers>
Gistur eru rásir sem geta geymt eina tvíundartölu, 8, 16, 32 eða 64 bita, og eru því eins konar minni. T.d. ef tölva leggur saman tvær tölur sem geymdar eru í vinnsluminni les hún þær fyrst inn í gistur og sækir þær þangað til þess að leggja þær saman í reiknirás. Gistur eru búin til úr vippum, yfirleitt D-vippum. Gistur tapa innihaldi sínu við straumleysi og eru því hvikult (#emph[volatile]) minni.

#blockquote[
#strong[Vippur] geyma einn bita. \
#strong[Gistur] geyma eina tvíundartölu af ýmsum stærðum. \
#strong[Minni] geyma margar tvíundartölur.
]

Til eru tvær megingerðir af gistrum:

+ #strong[Samhliða gistur] (#emph[parallel register]): Talan er öll lesin inn í einum klukkupúlsi. Eingöngu notuð á stuttum vegalengdum, þ.e. á móðurborði.
+ #strong[Raðgistur] (#emph[serial register]): Talan er lesin inn bita fyrir bita í mörgum klukkupúlsum. Mest notuð fyrir samskipti á löngum vegalengdum, þ.e. á milli tölva.

Síðan er til sambland af þessu tvennu, þ.e. samhliða inn / rað út og rað inn / samhliða út.

=== 6.1 Samhliða inn / samhliða út gistur
<samhliða-inn-samhliða-út-gistur>
Skoðum fyrst samhliða inn / samhliða út gistur. Miðum við 4 bita; hugsunin breytist ekkert þótt bitum (vippum) sé bætt við.

Skoðum þessa rás:

#figure(image("myndir/mynd-93.png", width: 428pt), caption: [Mynd 93: 4 bita samhliða inn / samhliða út gistur.], numbering: none)
#strong[Uppbygging rásarinnar.] Munum að útgangsjafna D-vippu er $Q^(n plus 1) eq D$, þ.e. næsti útgangur Q er staðan sem bíður á D-innganginum. Þegar WR-inngangurinn (#emph[write]) breytist úr 0 í 1 flyst staðan sem bíður á inngöngunum $I_3$ til $I_0$ (1010) yfir á útgangana $O_3$ til $O_0$. Við höfum því lesið töluna 1010 inn í gistrið og þar verður hún þangað til næsti WR-púls kemur og les inn nýja stöðu frá inngöngunum.

#figure(image("myndir/mynd-94.png", width: 428pt), caption: [Mynd 94: Talan 1010 lesin inn í gistrið.], numbering: none)
Við lesum því alla bitana inn í einum púlsi.

#figure(image("myndir/mynd-95.png", width: 189pt), caption: [Mynd 95: Tákn fyrir 4 bita samhliða inn / samhliða út gistur.], numbering: none)
=== 6.2 Samhliða gistur með þrístöðuútgangi (#emph[tristate logic, buffer])
<samhliða-gistur-með-þrístöðuútgangi-tristate-logic-buffer>
Stundum viljum við stjórna því hvenær innihald gisturs verður aðgengilegt á gagnabraut. Það er gert með því að nota svokallaða #strong[þrístöðurás]. Hún er með tvo innganga og einn útgang. Annar inngangurinn er stýriinngangur (#emph[Enable]) og er ýmist #emph[active low] eða #emph[active high]. Hann stýrir því hvort rásin leiðir eða ekki. Ef stýriinngangurinn er virkur leiðir rásin beint á milli inngangs og útgangs. Ef hann er óvirkur er útgangurinn aftengdur rásinni.

#align(center)[#table(
  columns: 3,
  align: (col, row) => (center,center,center,).at(col),
  inset: 6pt,
  [#box(image("myndir/mynd-96.png", width: 97pt))], [#box(image("myndir/mynd-97.png", width: 107pt))], [#box(image("myndir/mynd-98.png", width: 107pt))],
  [Mynd 96: Tákn fyrir þrístöðurás með #emph[active low] Enable-inngang.],
  [Mynd 97: $overline(E) eq 0 arrow.r.double O eq I$; $I eq 1 arrow.r.double O eq 1$, $I eq 0 arrow.r.double O eq 0$.],
  [Mynd 98: $overline(E) eq 1$: O er opin rás, aftengd frá gagnabraut.],
)
]

#figure(image("myndir/mynd-99.png", width: 428pt), caption: [Mynd 99: Gistur með þrístöðurás á útgangi.], numbering: none)
#strong[Uppbygging rásarinnar.] Við skrifum í gistrið með því að setja $overline(upright(W R))$-innganginn í lágstöðu (gefum einn klukkupúls). Eftir það er staðan 1010 komin á innganga þrístöðurásarinnar.

#figure(image("myndir/mynd-100.png", width: 429pt), caption: [Mynd 100: Skrifað í gistrið.], numbering: none)
Ef við viljum lesa innihaldið út er nóg að setja $overline(upright(R D))$-innganginn í lágstöðu og staðan 1010 birtist á útgöngunum $O_3$ til $O_0$.

#figure(image("myndir/mynd-101.png", width: 428pt), caption: [Mynd 101: Lesið úr gistrinu.], numbering: none)
#figure(image("myndir/mynd-102.png", width: 189pt), caption: [Mynd 102: Tákn fyrir samhliða inn/út gistur með þrístöðurás á útgangi.], numbering: none)
=== 6.3 Tvístefnugistur (#emph[bidirectional registers])
<tvístefnugistur-bidirectional-registers>
Tvístefnugistur hafa sameiginlega inn- og útganga. Þeir kallast D (#emph[data]) í stað I og O áður og eru tengdir beint við gagnabrautina. Við notum stýriinnganga til þess að stjórna því hvort þeir virka sem inngangar eða útgangar.

#figure(image("myndir/mynd-103.png", width: 429pt), caption: [Mynd 103: Tvístefnugistur.], numbering: none)
#strong[Uppbygging rásarinnar.] Til þess að lesa inn í gistrið er $overline(upright(W R))$-inngangurinn settur í lágstöðu í augnablik. Þá færast tölurnar af inngöngunum inn á útganga vippanna en stoppa við þrístöðurásina.

#figure(image("myndir/mynd-104.png", width: 429pt), caption: [Mynd 104: Tala lesin inn í gistrið. $overline(upright(W R))$-línan
(write) er virk og $D_3$ til $D_0$ eru lesin inn.], numbering: none)
#figure(image("myndir/mynd-105.png", width: 429pt), caption: [Mynd 105: Lesið út úr tvístefnugistri.], numbering: none)
Til þess að lesa út er $overline(upright(R D))$-inngangurinn (#emph[read]) settur í lágstöðu. Þrístöðurásin verður þá virk og tölurnar verða aðgengilegar á útgöngunum.

#figure(image("myndir/mynd-106.png", width: 189pt), caption: [Mynd 106: Tákn fyrir 4 bita tvístefnt samhliða gistur.], numbering: none)
Oftast eru gistur sett upp sem blokkir og þá þarf að setja upp einhverja stýringu sem stjórnar því í hvaða gistur á að skrifa og úr hvaða gistri á að lesa.

#figure(image("myndir/mynd-107.png", width: 395pt), caption: [Mynd 107: Fjögur 4 bita gistur tengd við sameiginlega 4 bita gagnabraut.], numbering: none)
Hönnum stýringu sem gerir okkur kleift að koma öllum gistrunum fyrir í einni rás með 4 inngöngum og 4 útgöngum. $A_0$ og $A_1$ stýra því hvert af gistrunum fjórum er virkt. $overline(E)$ stjórnar því hvort gistrin sem heild eru virk eða óvirk og $R slash overline(W)$-inngangurinn ákvarðar hvort við lesum gögn út ($R slash overline(W) eq 1$) eða skrifum þau inn ($R slash overline(W) eq 0$).

#figure(image("myndir/mynd-108.png", width: 211pt), caption: [Mynd 108: Tákn fyrir 4 × 4 gisturblokk (register file).], numbering: none)
Hönnum rásina sem ákveður hvaða gistur er virkt. Sannleikstafla hennar lítur svona út:

#align(center)[#table(
  columns: 8,
  align: (col, row) => (left,center,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [Gistur], [$overline(E)$], [$A_1$], [$A_0$], [$O_0$], [$O_1$], [$O_2$], [$O_3$],
  [#strong[Gistur 0]],
  [0],
  [0],
  [0],
  [1],
  [0],
  [0],
  [0],
  [#strong[Gistur 1]],
  [0],
  [0],
  [1],
  [0],
  [1],
  [0],
  [0],
  [#strong[Gistur 2]],
  [0],
  [1],
  [0],
  [0],
  [0],
  [1],
  [0],
  [#strong[Gistur 3]],
  [0],
  [1],
  [1],
  [0],
  [0],
  [0],
  [1],
  [#strong[Ekkert]],
  [1],
  [x],
  [x],
  [0],
  [0],
  [0],
  [0],
)
]

$ O_0 eq overline(overline(E)) dot.op overline(A_1) dot.op overline(A_0) #h(2em) O_1 eq overline(overline(E)) dot.op overline(A_1) dot.op A_0 #h(2em) O_2 eq overline(overline(E)) dot.op A_1 dot.op overline(A_0) #h(2em) O_3 eq overline(overline(E)) dot.op A_1 dot.op A_0 $

#figure(image("myndir/mynd-109.png", width: 219pt), caption: [Mynd 109: „1 af 4“-rás (afkóðari).], numbering: none)
#figure(image("myndir/mynd-110.png", width: 453pt), caption: [Mynd 110: Uppsetning úr Electronics Workbench.], numbering: none)
=== 6.4 Rað inn / rað út gistur
<rað-inn-rað-út-gistur>
Skoðum þessa rás:

#figure(image("myndir/mynd-111.png", width: 428pt), caption: [Mynd 111: 4 bita rað inn / rað út gistur.], numbering: none)
Sjáum að vippurnar eru raðtengdar, þ.e. útgangur vippu nr. $n$ tengist inngangi vippu nr. $n minus 1$. Skoðum hvað þarf til þess að koma stöðunni #strong[1101] inn í svona gistur. Við viljum enda með #strong[1] á $Q_0$, #strong[0] á $Q_1$, #strong[1] á $Q_2$ og #strong[1] á $Q_3$.

#align(center)[#table(
  columns: 1,
  align: (col, row) => (center,).at(col),
  inset: 6pt,
  [#box(image("myndir/mynd-112.png", width: 428pt))],
  [Mynd 112: Upphafsstaða #strong[0000]; staðan eftir 1 klukkupúls: #strong[1000].],
  [#box(image("myndir/mynd-113.png", width: 428pt))],
  [Mynd 113: Staðan eftir 2 klukkupúlsa: #strong[0100]; staðan eftir 3 klukkupúlsa: #strong[1010].],
  [#box(image("myndir/mynd-114.png", width: 428pt))],
  [Mynd 114: Staðan eftir 4 klukkupúlsa: #strong[1101]; lokastaða: #strong[1101].],
)
]

Það þurfti fjóra klukkupúlsa til þess að lesa inn 4 bita tölu í stað eins klukkupúls áður. Gistrið tekur inn nýja tölu með því að lesa inn bitana frá vinstri til hægri (#emph[shift right register]).

En það er vandamál sem þarf að skoða, en það er sú staðreynd að útgangar eru tengdir við innganga. Kemur ekki upp sú staða að sama línan vilji vera bæði 0 og 1 á sama tíma?

#figure(image("myndir/mynd-115.png", width: 246pt), caption: [Mynd 115: Útgangur einnar vippu tengdur við inngang þeirrar næstu.], numbering: none)
#strong[Hvaða stöðu sér vippan þegar klukkupúlsinn kemur, 0 eða 1?]

#figure(image("myndir/mynd-116.png", width: 361pt), caption: [Mynd 116: Hvort svarið er rétt, $Q_C$ eða $Q_W$?], numbering: none)
Hvort svarið er rétt, $Q_C$ eða $Q_W$? Þegar púlsinn kom við tímann $t_1$ var staðan á D \= 0\. En við $t_2$ er hún orðin 1 og vippan skiptir þá úr 0 í 1\. $Q_C$ er því rétta svarið.

Einfaldasta svarið er að vippan sér stöðuna á D-innganginum áður en klukkupúlsinn kom. Sú staða er flutt yfir á útganginn við tímann $t_1$. D-vippan seinkar því öllum gögnum um einn klukkupúls en heldur réttu bylgjuformi á gögnunum.

#figure(image("myndir/mynd-117.png", width: 412pt), caption: [Mynd 117: D-vippan seinkar gögnunum um einn klukkupúls.], numbering: none)
#figure(image("myndir/mynd-118.png", width: 279pt), caption: [Mynd 118: Uppsetningartími, haldtími og seinkun.], numbering: none)
#blockquote[
$t_s eq 100 thin upright(n s)$ (uppsetningartími, #emph[setup time]) \
$t_h eq 60 thin upright(n s)$ (haldtími, #emph[hold time]) \
$t_p eq 200$–$400 thin upright(n s)$ (flutningsseinkun, #emph[propagation delay]) (dæmigerð gildi)
]

Gögnin verða að vera tilbúin tímanum $t_s$ áður en klukkupúlsinn skiptir í hástöðu og haldast tímann $t_h$ eftir að klukkupúlsinn skipti í hástöðu. Seinkunartíminn frá D til Q er $t_p$.

#figure(image("myndir/mynd-119.png", width: 324pt), caption: [Mynd 119: CD4031, 64 bita rað inn / rað út hliðrunargistur.], numbering: none)
=== 6.5 Jöfnunarbiti (#emph[parity])
<jöfnunarbiti-parity>
Til þess að tryggja að gögn skili sér rétt á áfangastað í raðsamskiptum er sendur einn aukabiti með gögnunum, svokallaður jöfnunarbiti (#emph[parity bit]). Möguleikarnir eru tveir:

+ Sent er með sléttri jöfnun (#emph[even parity]). Þá er heildarfjöldi þeirra #strong[1] sem send eru slétt tala. Ef við viljum t.d. senda gögnin #strong[1101] með #emph[even parity] verður jöfnunarbitinn að vera #strong[1] til þess að gera fjöldann af #strong[1] að sléttri tölu. Gögnin verða því #strong[1]1101 þar sem fremsti bitinn er jöfnunarbitinn.
+ Sent er með oddri jöfnun (#emph[odd parity]). Þá er heildarfjöldi þeirra #strong[1] sem send eru oddatala. Ef við sendum gögnin #strong[1101] með #emph[odd parity] er jöfnunarbitinn #strong[0] því það er oddatölufjöldi af #strong[1] í gögnunum. Gögnin verða því #strong[0]1101\.

Á móttökuenda er síðan skoðað hvort gögnin hafi skilað sér rétt. Ef svo er ekki er send beiðni til baka til sendanda og hann beðinn um að senda þau aftur. Gallinn við jöfnunarbita er sá að ef tveir bitar breytast á leiðinni skynjar móttökuendinn það ekki sem villu. Í dag eru notaðar öflugri stærðfræðilegar aðferðir til þess að villuleita samskipti.

Hvernig verður jöfnunarbitinn til? Ef við köllum #emph[even parity]-bitann $P_e$ og #emph[odd parity]-bitann $P_o$ er ljóst að $P_o eq overline(P_e)$.

#align(center)[#table(
  columns: 6,
  align: (col, row) => (center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [Fjöldi af 1], [$D_3$], [$D_2$], [$D_1$], [$D_0$], [$P_e$],
  [0],
  [0],
  [0],
  [0],
  [0],
  [#strong[0]],
  [1],
  [0],
  [0],
  [0],
  [1],
  [#strong[1]],
  [1],
  [0],
  [0],
  [1],
  [0],
  [#strong[1]],
  [2],
  [0],
  [0],
  [1],
  [1],
  [#strong[0]],
  [1],
  [0],
  [1],
  [0],
  [0],
  [#strong[1]],
  [2],
  [0],
  [1],
  [0],
  [1],
  [#strong[0]],
  [2],
  [0],
  [1],
  [1],
  [0],
  [#strong[0]],
  [3],
  [0],
  [1],
  [1],
  [1],
  [#strong[1]],
  [1],
  [1],
  [0],
  [0],
  [0],
  [#strong[1]],
  [2],
  [1],
  [0],
  [0],
  [1],
  [#strong[0]],
  [2],
  [1],
  [0],
  [1],
  [0],
  [#strong[0]],
  [3],
  [1],
  [0],
  [1],
  [1],
  [#strong[1]],
  [2],
  [1],
  [1],
  [0],
  [0],
  [#strong[0]],
  [3],
  [1],
  [1],
  [0],
  [1],
  [#strong[1]],
  [3],
  [1],
  [1],
  [1],
  [0],
  [#strong[1]],
  [4],
  [1],
  [1],
  [1],
  [1],
  [#strong[0]],
)
]

Ef við setjum niðurstöðuna í K-kort fæst:

#align(center)[#table(
  columns: 5,
  align: (col, row) => (center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [$overline(D_1) thin overline(D_0)$], [$overline(D_1) D_0$], [$D_1 D_0$], [$D_1 overline(D_0)$],
  [$overline(D_3) thin overline(D_2)$],
  [0],
  [1],
  [0],
  [1],
  [$overline(D_3) D_2$],
  [1],
  [0],
  [1],
  [0],
  [$D_3 D_2$],
  [0],
  [1],
  [0],
  [1],
  [$D_3 overline(D_2)$],
  [1],
  [0],
  [1],
  [0],
)
]

Við getum ekkert lykkjað saman. Útkoman verður (eftir mikla Boole-algebru ☺):

$ P_e eq lr((D_1 xor D_0)) xor lr((D_3 xor D_2)) $

Jöfnunarrásin lítur þá svona út (4 bita #emph[parity generator]):

#figure(image("myndir/mynd-120.png", width: 333pt), caption: [Mynd 120: 4 bita jöfnunarbitarás (parity generator).], numbering: none)
#figure(image("myndir/mynd-121.png", width: 427pt), caption: [Mynd 121: Uppsetning í Workbench. Raðsamskipti með even parity. Staðan
#strong[1011] skrifuð inn með even parity-bitanum #strong[1] og flutt
yfir í annað gistur á móttökuenda þar sem jöfnunin er könnuð.], numbering: none)
#figure(image("myndir/mynd-122.png", width: 427pt), caption: [Mynd 122: Odd parity-gaumljós á móttökuenda sýnir okkur að talan sem var
flutt hafði oddatölufjölda af 1 og þess vegna var even parity-bitinn
#strong[1].], numbering: none)
#figure(image("myndir/mynd-123.png", width: 427pt), caption: [Mynd 123: Hér var sett inn bilun þannig að bitanum $D_1$, sem átti að
vera #strong[1], var breytt í #strong[0]. Þá skilar staðan #strong[1001]
sér á áfangastað í stað #strong[1011] og við fáum ekki grænt OK-ljós á
móttökuenda.], numbering: none)
== 7\. Minni
<minni>
Minni má skipta í tvo flokka:

#strong[A.] Hraðvirkt vinnsluminni, #strong[RAM], og hraðvirkt lesminni, #strong[ROM]. \
#strong[B.] Geymsluminni, stórt og hægvirkt, t.d. harðir diskar, geisladiskar og segulbönd.

#strong[RAM]-minni (#emph[Random Access Memory]) er minni sem hægt er að lesa úr og skrifa í í rauntíma (meðan tölvan vinnur). Þess vegna er vinnsluminni í tölvu alltaf RAM. Stundum er þó búið til sýndarminni (#emph[virtual memory]) á harða diskinum.

Ein minniseining (#emph[cell]) getur geymt einn bita, #strong[0] eða #strong[1]. Ein röð getur geymt eina tölu (#emph[word], orð). Þessi tala er yfirleitt 8 bitar (1 bæti), 16 bitar, 32 bitar eða 64 bitar. Alltaf er ein röð (tala) lesin inn eða út í einu.

4 × 4 minni gæti litið svona út:

#align(center)[#table(
  columns: 5,
  align: (col, row) => (center,center,center,center,center,).at(col),
  inset: 6pt,
  [Vistfang], [], [], [], [],
  [#strong[0]],
  [0],
  [1],
  [1],
  [0],
  [#strong[1]],
  [1],
  [1],
  [1],
  [0],
  [#strong[2]],
  [0],
  [1],
  [0],
  [1],
  [#strong[3]],
  [1],
  [1],
  [1],
  [1],
)
]

Hægt er að skipta um fjóra bita (eina röð) í einu. Minni sem er 1024 × 8 geymir 1024 bæti eða 1 KB. Til þess að geta farið inn í hvaða röð sem er þarf 1024 vistföng (#emph[addresses]) eða 10 bita (línu) vistfangsbraut (#emph[address bus]) því $2^10 eq 1024$. Í minninu á myndinni að ofan þarf 2 línu vistfangsbraut því við erum með fjögur vistföng og $2^2 eq 4$.

#blockquote[
#strong[Athugið:] \
$1024 eq 1 thin upright(K)$, $1024 dot.op 1024 eq 1 thin 048 thin 576 eq 1 thin upright(M)$ og $1024 dot.op 1024 dot.op 1024 eq 1 thin 073 thin 741 thin 824 eq 1 thin upright(G)$. \
Veldi af 2 passa ekki nákvæmlega við veldi af 10 (t.d. er $2^10 eq 1024$ en ekki 1000). Þess vegna kemur þessi skekkja fram.
]

Minnið á myndinni hér að framan er einvítt, þ.e. línur. Einnig er hægt að skipuleggja minni í tvívídd, þ.e. línur og dálka, og í þrívídd, þ.e. línur, dálka og plön.

#align(center)[#table(
  columns: 5,
  align: (col, row) => (center,center,center,center,center,).at(col),
  inset: 6pt,
  [Lína \\ dálkur], [#strong[11]], [#strong[10]], [#strong[01]], [#strong[00]],
  [#strong[00]],
  [3],
  [2],
  [1],
  [0],
  [#strong[01]],
  [7],
  [6],
  [5],
  [4],
  [#strong[10]],
  [B],
  [A],
  [9],
  [8],
  [#strong[11]],
  [F],
  [E],
  [D],
  [C],
)
]

Til þess að breyta bitanum í hólfi D er staðan #strong[1101] sett á vistfangsbrautina. Tveir fyrstu bitarnir eru línan og seinni tveir eru dálkurinn. Þetta minni geymir 16 bita eða 2 bæti.

Ef við viljum að hvert vistfang geymi meira en einn bita búum við til plön og förum í þrívídd. Átta bita tala, 1 bæti, er þá geymd í átta plönum.

#figure(image("myndir/mynd-124.png", width: 281pt), caption: [Mynd 124: Þrívítt minni með fjórum plönum.], numbering: none)
Í þessu minni er 4 bita talan 1101 geymd í vistfangi 0000 á fjórum plönum. Minnið geymir 16 × 4 bita eða samtals 8 bæti.

#figure(image("myndir/mynd-125.png", width: 374pt), caption: [Mynd 125: Þetta minni geymir 256 ($2^8$) 16 bita tölur á 16 plönum, eða
samtals 512 bæti.], numbering: none)
#strong[Sóknartími (#emph[access time])]

Sóknartími er sá tími sem líður frá því að vistfangið kemur á vistfangsbrautina þar til innihald minnishólfsins er komið á gagnabrautina. Þessi tími er fastur fyrir þrívítt minni og yfirleitt mældur í ns. Þegar við getum farið inn í hvaða vistfang sem er í minninu og lesið út eða skrifað inn á föstum tíma er það kallað „random accessing“.

=== 7.1 Högun minnis
<högun-minnis>
#strong[FIFO (#emph[First In First Out])]

FIFO-minni eru kvik, þ.e. gögnin eru á hreyfingu innan þeirra.

#figure(image("myndir/mynd-126.png", width: 453pt), numbering: none)
#figure(image("myndir/mynd-127.png", width: 453pt), caption: [Mynd 126 og 127: FIFO-minni.], numbering: none)
FIFO-minni eru byggð upp sem hliðrunargistur (#emph[shift register]). Inngangur þeirra er samhliða gistur (#emph[parallel register]) sem geymir næstu stöðu sem lesa á inn. Útgangurinn er líka samhliða gistur sem geymir síðustu stöðu sem lesin var út. Ef minnið er fullt og við þurfum að bæta við tölu er elstu tölunni ýtt út (#emph[push]). FIFO-minni er t.d. notað sem biðminni (#emph[buffer]) fyrir prentara.

#strong[LIFO (#emph[Last In First Out])]

LIFO-minni er byggt upp sem tvístefnugistur, þ.e. það hefur sameiginlegt inn- og útgangsstig. Þess vegna er síðasta tala inn fyrst út.

#figure(image("myndir/mynd-128.png", width: 453pt), numbering: none)
#figure(image("myndir/mynd-129.png", width: 453pt), caption: [Mynd 128 og 129: LIFO-minni.], numbering: none)
Ef LIFO-minni yfirfyllist týnast neðstu tölurnar („út um botninn“, #emph[bit bucket]). Því verður að fylgjast vel með hve mikið er komið í minnið (vandamál forritara).

#strong[R/W-minni]

R/W-minni er samheiti yfir minni sem hægt er að skrifa í og lesa úr á meðan forrit keyrir. Undir þetta flokkast bæði FIFO og LIFO. En R/W-minni eru samt ekki RAM-minni í strangasta skilningi því í RAM-nafninu felst „random access“-tæknin, þ.e. að sóknartíminn sé fastur fyrir gögn hvar sem þau eru í minninu. Það gildir ekki fyrir FIFO og LIFO. Þau eru samt kölluð RAM-minni þótt það sé ekki „rétt“.

#strong[Óstöðugleiki minnis (#emph[memory volatility])]

Minni sem tapa innihaldi sínu við rafmagnsleysi eru kölluð hvikul (#emph[volatile]). Minni sem halda innihaldi sínu við rafmagnsleysi kallast óhvikul (#emph[non-volatile]). Hægt er að gera RAM-minni óhvikult með því að nota rafhlöðu. Það er t.d. gert á móðurborðum tölva til þess að viðhalda innihaldi CMOS-minnisins sem geymir stillingar BIOS tölvunnar.

Minni sem heldur innihaldi sínu svo lengi sem rafmagn er til staðar kallast stöðugt (#emph[static]). Þetta eru svokölluð SRAM-minni (#emph[Static RAM]).

Til eru RAM-minni sem eru ekki stöðug þótt þau hafi rafmagn. Þetta eru svokölluð kvik minni (#emph[Dynamic RAM] eða DRAM). Þau eru hraðvirk og ódýr en gallinn við þau er að þau þurfa að fá „hressingu“ (#emph[refresh]) reglulega, a.m.k. á 64 ms fresti, til þess að viðhalda innihaldi sínu. Hver minniseining er örsmár þéttir sem heldur hleðslu sinni aðeins í stutta stund.

=== 7.2 SRAM (#emph[Static Random Access Memory])
<sram-static-random-access-memory>
#strong[Static random access memory] (SRAM) er hálfleiðaraminni þar sem orðið „static“ (stöðugt) vísar til þess að ekki þarf að endurnýja (#emph[refresh]) innihald þess reglulega eins og í DRAM-minni. SRAM notar vippur (#emph[bistable latching]) til þess að geyma hvern bita. SRAM-minni eru hvikul (#emph[volatile]) sem þýðir að þau glata innihaldi sínu við straumleysi.

#strong[Hugtakið SDRAM, sem stendur fyrir „synchronous DRAM“, hefur ekkert með SRAM að gera en þessu tvennu er oft ruglað saman.]

#strong[Hönnun]

#figure(image("myndir/mynd-130.png", width: 246pt), caption: [Mynd 130: Sex-transistora CMOS SRAM-minnissella.], numbering: none)
Hver biti í SRAM er geymdur í fjórum transistorum (M1–M4) sem mynda tvo krosstengda invertera (Q og $overline(Q)$). Þessi geymslueining hefur tvær stöður sem við köllum #strong[0] og #strong[1]. Síðan eru tveir aukatransistorar (M5 og M6) sem eru notaðir við innskrift og útlestur. Til eru SRAM-sellur með fleiri transistorum sem gera þeim kleift að vinna með fleiri inn- og útganga í einu (#emph[multi-port]). Til þess að ná sambandi við minnisröðina (orðið) er WL-inngangurinn (#emph[word line]) notaður. Hann stýrir transistorunum M5 og M6 sem tengja eininguna við BL- og $overline(upright(B L))$-línurnar (#emph[bit lines]). Þær eru notaðar til þess að flytja gögn bæði við skrift og lestur. Þó að í rauninni sé óþarfi að nota $overline(upright(B L))$-línuna er það yfirleitt gert til þess að minnka suð með því að nota balanseruð samskipti.

Þetta eykur bandvídd samskiptanna miðað við DRAM því balanseruð samskipti eru lítt næm fyrir suði. Einnig gerir tilkoma transistoranna kleift að dæla út meiri straumi en í DRAM-minni.

Stærð SRAM-minnis með $m$ vistfangalínum og $n$ gagnalínum er $2^m$ orð (#emph[words]), eða $2^m dot.op n$ bitar.

#blockquote[
#strong[Athugið:] Orð (#emph[word]) þýðir nokkrir bitar. 8 bita orð er sama og 1 bæti. Algengar stærðir eru 8 bita orð, 16 bita orð, 32 bita orð og 64 bita orð.
]

SRAM með 16 vistfangalínum og 32 gagnalínum (32 línu gagnabraut) geymir því $2^16 eq 65 thin 536$ orð. Í bitafjölda er þetta $65 thin 536 dot.op 32 eq 2 thin 097 thin 152$ bitar ($2 thin upright(M b)$, eða $262 thin 144$ bæti $eq 256 thin upright(K B)$).

#strong[Virkni SRAM]

SRAM-minniseining hefur þrjár stöður: biðstöðu (#emph[standby]), útlestur (#emph[reading]) og innskrift (#emph[writing]).

#strong[Biðstaða (#emph[standby]).] Ef orðlínan er spennulaus aftengja M5 og M6 eininguna frá gagnabrautinni. M1 til M4 halda innihaldi sínu á meðan spenna er á rásinni.

#strong[Útlestur.] Gerum ráð fyrir að innihald minnissellunnar sé #strong[1] og geymt á Q-útgangi. Útlestrarferlið hefst á því að báðar bitalínurnar eru settar í hástöðu #strong[1]. Síðan er WL-línan gerð virk þannig að bæði M5 og M6 leiða (ON). Næst er gildið #strong[1] (Q og $overline(Q)$) flutt yfir á bitalínurnar þannig að BL helst í hástöðu og $overline(upright(B L))$ fer í lágstöðu. Það gerist með því að $overline(upright(B L))$ afhleðst til jarðar í gegnum M1 og M5 en BL tengist $V_(D D)$ (rökleg #strong[1]) í gegnum M4 og M6. Ef innihald einingarinnar hefði verið #strong[0] gerðist akkúrat öfugt, þ.e. BL afhlæðist en $overline(upright(B L))$ héldist í hástöðu.

#figure(image("myndir/mynd-131.png", width: 379pt), caption: [Mynd 131: Útlestur. 1\. $W L eq 0$, $B L eq overline(B L) eq 1$. 2\.
$W L eq 1$, $overline(B L) eq 0$, $B L eq 1$.], numbering: none)
#strong[Innskrift.] Innskriftarferlið hefst á því að bitarnir sem skrifa á inn eru settir á bitalínurnar. Ef við viljum skrifa inn #strong[0] setjum við #strong[0] á BL-línuna og #strong[1] á $overline(upright(B L))$-línuna. Síðan er WL-línan gerð virk og bitarnir skrifaðir inn. Ef við ætlum að skrifa inn #strong[1] setjum við #strong[1] á BL og #strong[0] á $overline(upright(B L))$. Inngangstransistorarnir (M5 og M6) eru miklu sterkari en geymslutransistorarnir (M1–M4) og geta því auðveldlega þvingað inn nýja stöðu.

#figure(image("myndir/mynd-132.png", width: 379pt), caption: [Mynd 132: Innskrift. 1\. $B L eq 0$, $overline(B L) eq 1$. 2\.
$W L eq 1$ og stöðurnar skrifaðar inn.], numbering: none)
#strong[Hegðun brautar]

RAM-minni með sóknartíma (#emph[access time]) 70 ns skilar af sér gögnum í síðasta lagi 70 ns eftir að vistfangsbrautin (#emph[address bus]) varð virk. Gögnin eru líka aðgengileg í smástund, 5–10 ns (#emph[hold time]), eftir að þau voru lesin út eða skrifuð inn.

SRAM er miklu dýrara og hraðvirkara en DRAM og eyðir minna afli í biðstöðu. Það er því mest notað þar sem þörf er á mikilli bandvídd eða lítilli aflnotkun. T.d. er flýtiminni (#emph[cache]) örgjörva alltaf SRAM. Auðveldara er að stýra SRAM-minni en DRAM og SRAM er meira „random access“-minni en DRAM. DRAM-minnið er hins vegar miklu ódýrara og því mest notað sem vinnsluminni í tölvum í dag.

=== 7.3 ROM-minni (#emph[Read Only Memory])
<rom-minni-read-only-memory>
Til eru fjórar gerðir af ROM-minni:

+ Grímuforritað ROM (#emph[Mask ROM], MROM)
+ Bræðitengja-ROM (#emph[PROM, fuse link])
+ ROM hreinsanlegt með útfjólubláu ljósi (EPROM)
+ ROM breytanlegt með rafmagni (EEPROM eða E²PROM)

#strong[1\. Mask ROM] er forritað með filmugrímu í framleiðslu og er óbreytanlegt. Framleiðslan getur tekið vikur og þetta er í raun úrelt tækni.

#strong[2\. PROM] er hægt að forrita með forritunartæki, svokölluðum PROM-forritara (#emph[PROM programmer]). PROM kemur frá verksmiðjunni með öll bræðitengi heil, þ.e. sama gildi (yfirleitt 1) í öllum minniseiningum. Til þess að breyta gildi minniseiningar er sendur straumur á réttan stað í rásinni til þess að bræða tenginguna. Þessi aðgerð er endanleg og rásin ónýt ef hún mistekst.

#strong[3\. EPROM] er minni sem hægt er að hreinsa með útfjólubláu ljósi og endurforrita. EPROM er forritað með EPROM-forritara þar sem forritið er flutt frá PC-tölvu yfir í forritunartækið. EPROM-minni má auðveldlega þekkja á glugganum ofan á því. Þegar búið er að forrita verður að hylja þennan glugga með ógagnsæju efni, t.d. límmiða.

#strong[4\. EEPROM] er ROM-minni sem hægt er að breyta á meðan unnið er í tölvunni. Það er þó of hægvirkt til þess að geta kallast RAM. Til eru minni (NVSRAM) sem byggð eru upp sem tvö lög: efra lagið er venjulegt R/W-minni (SRAM) en neðra lagið hægvirkt EEPROM. Ef örgjörvinn skynjar rafmagnsvandræði getur hann skipað svo fyrir að efra lagið sé afritað í neðra lagið og geymt þar sem afrit. Hægt er að afrita í báðar áttir. BIOS er geymt í EEPROM-minni (Flash). Flash-minni er sérstök gerð af EEPROM.

#strong[Lestur úr og ritun í minni]

Til þess að lesa úr og skrifa í minni þarf þrennt að gerast:

+ Finna þarf vistfang minnishólfsins og koma því á vistfangsbrautina.
+ Ákveða þarf hvort lesa á út eða skrifa inn.
+ Stýra þarf nákvæmlega hvenær þetta á að gerast.

Örgjörvinn stýrir þessum atburðum. Hann sendir fyrst vistfangið á vistfangsbrautina. Minnið inniheldur vistfangsafkóðara (#emph[address decoder]) sem sér um aðgang að réttum minniseiningum. Stuttu síðar sendir örgjörvinn annaðhvort #emph[Read]\- eða #emph[Write]-skipun og lesið er út á gagnabrautina eða skrifað inn af gagnabrautinni. Örgjörvinn sér síðan um að koma upplýsingunum af gagnabrautinni á rétta staði. Hann getur t.d. sent þær út á prentara eða skjá, eða tekið þær inn í reikningseininguna (ALU) og framkvæmt einhverja útreikninga á þeim.

#strong[Notkun minnis]

Í tölvum eru fimm gerðir af minni:

+ Flýtiminni (#emph[scratch pad memory])
+ Biðminni (#emph[buffer])
+ Staflaminni (#emph[stack])
+ Raðminni (#emph[queue])
+ Uppflettiminni (#emph[look-up table])

#strong[1\. Flýtiminni] (#emph[scratch pad]) er lítið minni sem notað er til þess að geyma gögn í stuttan tíma, t.d. í reiknivélum. Öll vinnsla í reiknivélum fer fram í flýtiminni en hægt er að geyma niðurstöðurnar í öðru minni. Í PC-tölvum er þetta minni yfirleitt innbyggt í örgjörvann sem skyndiminni (#emph[cache]). Reiknieiningin (ALU) notar flýtiminni til þess að geyma þær tölur sem hún er að nota í útreikningum. Flýtiminnið er, eins og nafnið bendir til, hraðvirkara en venjulegt vinnsluminni. Það er líka miklu dýrara og því framleitt frekar lítið, oft á bilinu nokkur hundruð KB til nokkurra MB. Vegna þess að flýtiminnið er innbyggt í örgjörvann teppir það engar brautir svo að tölvan getur unnið í flýtiminninu samhliða því sem hún framkvæmir eitthvað annað á móðurborðinu.

#strong[2\. Biðminni] (#emph[buffer]) virkar sem stuðpúði á milli hraðvirks örgjörva og hægvirks jaðartækis, t.d. prentara. Biðminni er nær undantekningarlaust FIFO. Þannig getur örgjörvinn fyllt öðru hverju á biðminnið og haldið síðan áfram við annað. Prentarinn mjatlar síðan úr biðminninu á sínum hraða en teppir ekki vinnu örgjörvans.

#strong[3\. Staflaminni] (#emph[stack]) er frátekinn hluti af vinnsluminni tölvunnar. Örgjörvinn notar staflann til þess að geyma öll gögn sem hann er að vinna með ef hann fær beiðni (rof) um að gera eitthvað annað strax (#emph[Interrupt Request], IRQ). Þetta er nær undantekningarlaust LIFO-minni því það hentar vel að síðasta skipun sem fer inn sé sú sem þarf að framkvæma fyrst eftir að rofinu er lokið. Í staflann fer líka afrit af innihaldi flýtiminnisins svo að það glatist ekki. Til þess að fylgjast með stærð staflans er notaður svokallaður staflabendir (#emph[stack pointer]). Til þess að fylgjast með vistföngum vinnsluminnisins er notaður svokallaður forritsteljari (#emph[program counter]). Ef vistfangsbrautin er 32 bitar þurfa staflabendirinn og forritsteljarinn báðir að vera 32 bita.

Skoðum hvað gerist þegar örgjörvinn fær skipun um að hætta í forriti til þess að sinna jaðartæki. Gerum ráð fyrir að staflinn sé hluti af vinnsluminninu en settur upp eins og LIFO. Segjum að forritsteljarinn sé staddur í vistfangi $upright(0500)_H$ og staflabendirinn bendi á $upright(F F F F)_H$ (16 bita vistfangsbraut). Örgjörvinn er þá að ná í skipun úr minnishólfi $upright(0500)_H$ ($1280_10$) og staflabendirinn bendir á næsta lausa minnishólf sem er efst á staflanum. Örgjörvinn klárar að framkvæma skipunina úr $upright(0500)_H$, hækkar síðan forritsteljarann um 1 ($upright(0501)_H$) og flytur það gildi í staflann. Síðan flytur hann allt úr flýtiminninu í staflann. Þegar hann er búinn að afgreiða rofið flytur hann innihaldið úr staflanum í flýtiminnið og síðan gildi næsta vistfangs ($upright(0501)_H$) inn í forritsteljarann og getur þá haldið áfram að framkvæma næstu skipun í forritinu sem hann var að vinna í fyrir rofið.

#strong[4\. Raðminni] (#emph[queue]). Örgjörvinn færir allar skipanir sem framkvæma á inn í biðminni þaðan sem þær eru lesnar ein og ein inn í skipanagistrið (#emph[Instruction Register], IR). Hann fyllir á minnið eftir þörfum og getur notað lausan tíma til þess að framkvæma skipanir innan örgjörvans sem ekki útheimta notkun á vistfanga- eða gagnabrautinni.

#strong[5\. Uppflettiminni] (#emph[look-up table memory]) er minni sem hefur fast innihald og við getum litið á sem uppflettitöflu. Ef við myndum t.d. brenna sannleikstöflu einhverrar rökrásar með 4 inngöngum myndi minnið geyma $2^4$ uppflettilínur þar sem hver lína geymdi stöðu útganganna fyrir þá línu. Dæmi um þetta væri t.d. sjö ráka afkóðunarrás sem hefði þá 4 innganga og 7 útganga. Inngangurinn #strong[0000] gæfi okkur þá útganginn #strong[1111110] sem myndar töluna #strong[0] á skjánum.

=== 7.4 DRAM (#emph[Dynamic Random Access Memory])
<dram-dynamic-random-access-memory>
DRAM geymir hvern bita í litlum þétti. Vegna þess að þéttar hafa tilhneigingu til að missa hleðslu (leka) þarf reglulega að hressa upp á hleðsluna. Það fer þannig fram að sömu gögnin eru skrifuð inn aftur reglulega án breytinga. #emph[Dynamic]-hluti nafnsins vísar til þessa: minnið er stöðugt endurskrifað aftur og aftur.

Kostur DRAM er einfaldleikinn í uppbyggingunni. Aðeins þarf einn transistor og einn þétti til að geyma einn bita í stað sex transistora í SRAM. Þetta þýðir að DRAM-minni geta orðið mjög stór og þau eru í reynd mest notuðu vinnsluminnin í dag.

#figure(image("myndir/mynd-133.png", width: 290pt), caption: [Mynd 133: Uppbygging DRAM-minnis.], numbering: none)
#strong[Virkni]

DRAM er venjulega sett upp sem ferningslaga fylki (tafla) með einn transistor og einn þétti í hverri minniseiningu. Á myndinni hér að framan er dæmi um 4 × 4 fylki (16 bitar) en í raunveruleikanum erum við kannski með þúsundir eininga í röðum og dálkum.

Langa línan sem tengir einingarnar í hverri röð kallast WL (#emph[word line]). Hver dálkur hefur venjulega tvær bitalínur (BL og $overline(upright(B L))$) en til einföldunar er bara BL sýnd. Þær eru venjulega kallaðar \+ og − bitalínan. Þetta er gert til þess að halda minninu stöðugu með jákvæðri afturverkun (#emph[positive feedback]).

Venjulega gera framleiðendur ráð fyrir að minnið sé hresst við með að minnsta kosti 64 ms millibili. Þetta gerir rásina flóknari (útheimtir #emph[refresh logic]) en er samt miklu ódýrara en að nota SRAM. Sumar DRAM-tegundir hressa allt minnið í einu á 64 ms fresti en aðrar taka eina röð í einu. Sem dæmi má taka minni með $2^13 eq 8192$ raðir. Þá er hver röð hresst við á $7","8 thin mu upright(s)$ fresti ($64 thin upright(m s) slash 8192$).

#strong[Tímar]

#align(center)[#table(
  columns: 7,
  align: (col, row) => (left,center,center,center,center,center,center,).at(col),
  inset: 6pt,
  [], [PC-3200 (DDR-400) dæmigert], [hratt], [PC2-6400 (DDR2-800) dæmigert], [hratt], [PC3-12800 (DDR3-1600) dæmigert], [hratt],
  [$t_(C L)$],
  [3 (15 ns)],
  [2 (10 ns)],
  [5 (12,5 ns)],
  [4 (10 ns)],
  [9 (11,25 ns)],
  [8 (10 ns)],
  [$t_(R C D)$],
  [4 (20 ns)],
  [2 (10 ns)],
  [5 (12,5 ns)],
  [4 (10 ns)],
  [9 (11,25 ns)],
  [8 (10 ns)],
  [$t_(R P)$],
  [4 (20 ns)],
  [2 (10 ns)],
  [5 (12,5 ns)],
  [4 (10 ns)],
  [9 (11,25 ns)],
  [8 (10 ns)],
  [$t_(R A S)$],
  [8 (40 ns)],
  [5 (25 ns)],
  [16 (40 ns)],
  [12 (30 ns)],
  [27 (33,75 ns)],
  [24 (30 ns)],
)
]

#emph[Gildin eru gefin sem fjöldi klukkupúlsa (tími í sviga).]

Þessi tafla spannar nokkurra ára tímabil og framfarirnar í biðtímum eru ekki stórkostlegar. Þó má benda á að DDR3-tæknin hefur 32 sinnum meiri bandvídd en eldra EDO-minni og getur sent út tvö orð á hverjum 1,25 ns klukkupúlsi (1600 Mword/s) á meðan EDO RAM getur skilað af sér einu orði á 20 ns (50 Mword/s).

#strong[Villur og villuleiðréttingar]

Raf- og segultruflanir innan tölvu geta valdið því að einn biti í DRAM-minni skipti úr réttri stöðu í andhverfa stöðu. Þetta er vegna þess að DRAM-minnin eru að minnka að ummáli, meira af gögnum er troðið í þau og vinnsluspennan lækkuð. Það þýðir að lágorkuagnir geta breytt innihaldi einnar eða fleiri minniseininga.

Þetta vandamál má leysa með því að nota t.d. jöfnunarbita og/eða villuleiðréttingu (#emph[Error Correcting Code], #strong[ECC]). Gallinn við jöfnunarbita er að hann skynjar bara breytingu á einum (eða oddatölufjölda) bita. Algengasta villuleiðréttingin er að nota Hamming-kóða. Hann getur leiðrétt einn rangan bita og, ef hann er notaður með jöfnunarbita, fundið út hvort villa er í tveimur bitum í sama orði.

Ekki styðja öll móðurborð villuleiðréttingu. Hún er fyrst og fremst notuð í dýrum og mikilvægum tölvum eins og þjónum. Sum móðurborð hafa þá tækni að BIOS þeirra lærir að þekkja veilur í minni og forðast að nota þær raðir.

Ástæðurnar fyrir því að nota ekki villuleiðréttingu (ECC) eru:

- Aukajöfnunarbiti í hverju bæti eykur kostnað um 1/8 (12,5 %), þ.e. 9 bitar í stað 8\. Í harðri verðsamkeppni er það mikið.
- Móðurborð sem styðja ECC eru dýrari.
- ECC hefur þau áhrif að erfiðara er að yfirklukka örgjörvann.
- ECC-minnisrás þarf aukatíma til þess að framkvæma villuleiðréttinguna, sem getur þýtt töf upp á 0,5 % til 2 %.

Nýlegar rannsóknir sýna að tíðni villna í minni er frá einum bita á klukkustund á hvert GB af minni til eins bita á öld á hvert GB af minni. Í öllum tölvum sem notaðar eru í vísindalegum og fjármálalegum tilgangi er reglan að nota ECC frekar en undantekning.

#strong[DRAM-pakkningar]

#align(center)[#table(
  columns: 2,
  align: (col, row) => (center,center,).at(col),
  inset: 6pt,
  [#box(image("myndir/mynd-134.png", width: 90pt))],
  [#box(image("myndir/mynd-135.png", width: 200pt))],
  [Mynd 134: DIP, 16 pinna],
  [Mynd 135: SIPP, 30 pinna],
  [#box(image("myndir/mynd-136.png", width: 198pt))],
  [#box(image("myndir/mynd-137.png", width: 228pt))],
  [Mynd 136: SIMM, 30 pinna],
  [Mynd 137: SIMM, 72 pinna],
  [#box(image("myndir/mynd-138.png", width: 192pt))],
  [#box(image("myndir/mynd-139.png", width: 186pt))],
  [Mynd 138: SDRAM, 168 pinna DIMM],
  [Mynd 139: DDR1, 184 pinna DIMM],
  [#box(image("myndir/mynd-140.png", width: 180pt))],
  [#box(image("myndir/mynd-141.png", width: 204pt))],
  [Mynd 140: EDO RAM, 72 pinna (SIMM)],
  [Mynd 141: RAMBUS, 184 pinna (RIMM)],
  [#box(image("myndir/mynd-142.png", width: 145pt))],
  [#box(image("myndir/mynd-143.png", width: 160pt))],
  [Mynd 142: DDR2, 240 pinna DIMM],
  [Mynd 143: DDR3, 240 pinna DIMM],
)
]

DIP \= #emph[Dual Inline Package], SIPP \= #emph[Single Inline Pin Package], SIMM \= #emph[Single Inline Memory Module], DIMM \= #emph[Dual Inline Memory Module].

#strong[Ósamfasa DRAM (#emph[asynchronous DRAM])]

Þetta er grundvallargerðin sem allar gerðir DRAM eru hannaðar út frá. Hún hefur yfirleitt 12 vistfangalínur og 4 tvístefndar gagnalínur. Einnig hefur hún fjóra #emph[active low]-innganga:

- $overline(upright(R A S))$ kveikir á valinni röð. Röð er valin svo lengi sem $overline(upright(R A S))$-inngangurinn er lágur.
- $overline(upright(C A S))$ kveikir á völdum dálki. Dálkur er valinn svo lengi sem $overline(upright(C A S))$-inngangurinn er lágur.
- $overline(upright(W E))$ (#emph[Write Enable]): Rásin skrifar inn gögn svo lengi sem $overline(upright(W E))$ er lágur; þegar hann er hár eru gögn lesin út.
- $overline(upright(O E))$ (#emph[Output Enable]): Aukainngangur sem stýrir aðgangi að I/O-pinnunum.

#strong[EDO RAM, #emph[Extended Data Out] (EDO) DRAM]

#figure(image("myndir/mynd-144.png", width: 139pt), caption: [Mynd 144: EDO DRAM-minnisrásir.], numbering: none)
EDO DRAM er hannað þannig að hægt er að byrja að sækja ný gögn eða skrifa ný gögn inn um leið og fyrri gögn eru geymd í I/O-einingu.

#strong[Double Data Rate (DDR) SDRAM]

DDR-minni kom á markað í byrjun ársins 2000\. #emph[Double]-hluti nafnsins þýðir að það vinnur bæði á forkanti og bakkanti klukkupúlsins.

#strong[DDR eða DDR1 (2000–2002)]

Miðað við SDR SDRAM (#emph[single data rate]) er DDR miklu hraðvirkara, bæði vegna betri gagnastýringar og vegna þess að það vinnur á báðum köntum klukkupúlsins. Miðað við sömu klukkutíðni er það því u.þ.b. tvisvar sinnum hraðvirkara. Hámarksflutningsgeta DDR1 er frá 1600 MB/s (DDR-200) upp í 3200 MB/s (DDR-400).

DDR1-minni keyrir á 2,5 V miðað við 3,3 V á SDRAM. Hækkun á þessari spennu getur aukið hraðann en á kostnað meiri orkunotkunar og jafnvel hættu á skemmdum.

Venjulegt DDR1-minni hefur 8 minnisrásir ($8 dot.op 8 eq 64$ bitar). Ef ECC er bætt við bætist níunda minnisrásin við.

#strong[DDR2 (2003–2004)]

#emph[Ávinningur fram yfir DDR1:] Hámarksflutningsgeta allt að 6400 MB/s (DDR2-800) á móti 3200 MB/s (DDR-400). DDR2 keyrir á 1,8 V miðað við 2,5 V hjá DDR1. DDR2 leyfir hærri brautarhraða með því að lækka innri klukkuhraða niður í helming brautarhraða. DDR2 hefur tvöfalt stærra forsóknarbiðminni (#emph[prefetch buffer]) en DDR1.

DDR2 er hvorki samhæft við DDR1 né DDR3.

#strong[DDR3 (2007–2008)]

#emph[Ávinningur fram yfir DDR2:] Gagnaflutningur er tvisvar sinnum hraðari en hjá DDR2. Flutningsgeta 64 bita DDR3-minnis er t.d. 12 800 MB/s fyrir DDR3-1600 (PC3-12800). DDR3 notar 30 % minna afl en DDR2. DDR3 keyrir á 1,35 V til 1,5 V á móti 1,8 V hjá DDR2. Minniskubbarnir eru jafnlangir og hafa jafnmarga pinna en hakið í tengibrúninni er á öðrum stað svo að sökklarnir eru ekki eins. DDR3 hefur tvöfalt stærra forsóknarbiðminni (#emph[prefetch buffer]) en DDR2 sem flýtir fyrir inn- og útlestri.

GDDR3 er stundum ruglað saman við DDR3 en það er sérstök útgáfa af DDR2 fyrir myndvinnslu.

DDR3 er hvorki samhæft við DDR2 né DDR4.

#strong[DDR4 (2013–2014)]

#figure(image("myndir/mynd-145.png", width: 300pt), caption: [Mynd 145: DDR4, 288 pinna DIMM. Sama lengd og DDR3, 240 pinna DIMM.], numbering: none)
#emph[Ávinningur fram yfir DDR3:] Þéttari pökkun á minniseiningum og þannig er hægt að búa til stærri minni, jafnvel tvöfalt stærri. DDR4 notar minna afl en DDR3 og er hraðvirkara. DDR4 keyrir á 1,2 V og býður upp á gagnahraða frá 1600 til 3200 MT/s. Lágspennu-DDR4 keyrir á 1,05 V.

Netheimar halda því þó fram að DDR4 hafi ekkert stórkostlegt forskot á DDR3. Það henti aðallega stórum tölvuþjónum vegna aflsparnaðar. Byltingin úr DDR2 í DDR3 hafi verið miklu stærri.

== 8\. Forritun stýriörgjörva
<forritun-stýriörgjörva>
#strong[Picaxe]

Picaxe eru stýriörgjörvar sem mjög auðvelt er að forrita. Þeir eru góðir sem fyrsta val í stýriörgjörvum og forritin eru mjög gagnsæ. Fyrir lengra komna er hægt að fara í Arduino eða Raspberry Pi en þar er forritunarumhverfið flóknara.

Picaxe-örgjörvinn er forritaður með forriti sem heitir #emph[Picaxe Programming Editor] og hægt er að sækja ókeypis. Forritið er notað til þess að tengjast örgjörvanum en einnig er hægt að herma forritin í því og athuga hvort þau virka. Hægt er að kaupa mikið af tilbúnum búnaði frá Picaxe til að leika sér með, en einnig er hægt að útbúa eigin raðtengda upphalsrás og nota örgjörvann á eigin prentplötum.

Sem dæmi um lítið forrit er t.d.:

#figure(image("myndir/mynd-146.png", width: 409pt), caption: [Mynd 146: Forrit sem lætur útgang nr. 4 á Picaxe 8M2-örgjörvanum blikka.], numbering: none)
Þetta forrit lætur útgang nr. 4 á Picaxe 8M2-örgjörvanum blikka: hann logar í 1 s og er slökktur í 1 s, þ.e. lotan er 2 s og tíðnin $0","5 thin upright(H z)$.

Fyrst veljum við #emph[Syntax] til að kanna hvort forritið sé villulaust. Græni textinn eru athugasemdir sem eru ekki hluti af forritinu heldur hjálpartæki fyrir forritarann. Athugasemdir eru gerðar með því að slá inn ’ á undan (’ er á sama lykli og spurningarmerkið). Þá verður athugasemdatextinn grænn.

Ef forritið er villulaust birtist gluggi með textanum #emph[Success!]

Næst hermum við forritið. Við smellum á hnappinn #emph[Simulate] og þá birtist þessi mynd. Græna ljósið á útgangi 4 blikkar eins og til stóð (1 s kveikt, 1 s slökkt).

#figure(image("myndir/mynd-147.png", width: 274pt), caption: [Mynd 147: Hermun forritsins í Picaxe Programming Editor.], numbering: none)
