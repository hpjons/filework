# ERRATA – TNT3: Tölvu- og nettækni, kennsluhefti

Frumrit: `TNT3 Tölvurognettækni útgáfaB2.pdf` (útgáfa B2).
Blaðsíðutöl (Bls.) vísa í síðunúmer í PDF-skrá frumritsins (forsíðan er bls. 1). Atriði merkt **leiðrétt** hafa verið lagfærð í `tnt3.md` og `tnt3.typ`; atriði merkt **athugasemd** eru ábendingar til höfundar sem ekki var breytt efnislega.

Flokkar: **R** = reikningur/tölur, **T** = tæknileg villa, **Ó** = ósamræmi, **M** = málfar, **F** = framsetning.

## Reikningur og tölur

| Bls. | Flokkur | Í frumriti | Leiðrétt / athugasemd |
|:-:|:-:|:--|:--|
| 5 | R | DM7408: $I_{OL}$ max = 15 mA | Gagnablaðið og textinn (kafli 1.5 og *fan out*) nota **16 mA**. Leiðrétt. |
| 8 | F | *Fan out*-jöfnurnar brenglast í umbroti („8,0 mA“, „6,1 mA“). | $I_{OH}/I_{IH} = 0{,}8\,\mathrm{mA}/40\,\mu\mathrm{A} = 20$ og $I_{OL}/I_{IL} = 16\,\mathrm{mA}/1{,}6\,\mathrm{mA} = 10$. Leiðrétt. |
| 63 | R | Klukka: „þrjá MOD10 teljara, tvo MOD6 og einn **MOD2** teljara“ og „Q1 á MOD2 teljaranum“ | Tugir klukkustunda þurfa að ná 0, 1 og 2, þ.e. **MOD3**. MOD2-teljari telur bara 0–1 og hefur ekki útganginn $Q_1$. Leiðrétt. |
| 52 | R | „hvaða MOD teljara sem er **frá 1 til 8**“ með 74192 | Með því að hreinsa 74192 í stöðu $N$ fæst MOD$N$ fyrir $N = 2 \ldots 9$ (MOD10 er teljarinn sjálfur). Leiðrétt í „frá MOD2 til MOD9“. |
| 87 | R | „$2^{16}$ = **65.356** orð“, „65.356 · 32 = 2.097.152 bitar“ | $2^{16} = 65\,536$. Margfeldið 2 097 152 er rétt fyrir 65 536. Leiðrétt. |
| 87 | R/Ó | „(2 Mb eða **262 kB**)“ | Blandað saman tvíundar- og tugaforskeytum: 2 097 152 bitar = 2 Mb (tvíundar) = 262 144 bæti = **256 KB** (tvíundar) ≈ 262 kB (tuga). Leiðrétt í „256 KB“. |
| 94 | R | „Auka parity biti í hverju orði eykur kostnað **um 9/8**“ | Einn aukabiti á hver 8 bita eykur kostnað **um 1/8** (12,5 %), þ.e. kostnaðurinn verður 9/8 af upphaflegum. Leiðrétt. |
| 97 | R/Ó | „Hámarks flutningsgeta DDR1 er 1600MB/s“, „DDR2 … 3200 MB/s“, „DDR3 64 bita minnis er 6400 MB/s“ | Þetta eru gildi fyrir **hægustu** útgáfurnar (DDR-200, DDR2-400, DDR3-800), ekki hámark. Taflan á bls. 93 sýnir sjálf PC-3200, PC2-6400 og PC3-12800 (MB/s). Leiðrétt: DDR1 allt að 3200 MB/s, DDR2 allt að 6400 MB/s, DDR3-1600 12 800 MB/s. |
| 99–100 | R | „Þetta forrit lætur útgang nr.4 … blikka með tíðninni **1Hz**“ | Forritið (mynd 146) er `high 4 / pause 1000 / low 4 / pause 1000`: 1 s kveikt og 1 s slökkt, lota 2 s, tíðni **0,5 Hz**. Leiðrétt. |

## Tæknilegar villur

| Bls. | Flokkur | Í frumriti | Leiðrétt / athugasemd |
|:-:|:-:|:--|:--|
| 6 | T | *Switching Characteristics*: báðar línur merktar „ʈ<sub>PLH</sub>“ | Seinni línan (High to Low) er $t_{PHL}$. **Leiðrétt.** |
| 9 | T | 74-röðin: „74L Low Power 1mW, **10ns**“ | 74L: 1 mW, **33 ns**. **Leiðrétt.** |
| 9 | T | „74LS **Low Speed**, Schottky díóða í útgangi“ | 74LS = ***Low Power Schottky***, 2 mW, 9,5 ns. **Leiðrétt.** |
| 9 | T | „74F **Fast Low Power 1,2mW, 4ns**“ (sömu tölur og 74ALS) | 74F = *Fast*, u.þ.b. 4 mW, 3 ns. **Leiðrétt.** |
| 9 | T | „Þær eru **ekki eins næmar** fyrir static (ESD) eins og 74 rásirnar“ | CMOS-rásir eru **næmari** fyrir stöðurafmagni en TTL. **Leiðrétt.** |
| 9 | T | „vídd í fæðispennu eða **V<sub>CC</sub>** frá 3V til 15V“ | Fæðispenna CMOS heitir yfirleitt $V_{DD}$; B-röðin þolir allt að 18 V. **Leiðrétt.** |
| 10 | T | „Nánari merkingar **CD4000** seríunnar“: 40C, 40HC, 40HCT … | Þetta eru CMOS-raðir **74-fjölskyldunnar**: 74C, 74HC, 74HCT … (tekið úr Wikipediu þar sem þær heita 74xx). **Leiðrétt.** |
| 11 | T | CD4000-gagnablað: „t<sub>PHL</sub>, t<sub>PHL</sub>“ og „t<sub>THL</sub>, t<sub>THL</sub>“ | $t_{PHL}, t_{PLH}$ og $t_{THL}, t_{TLH}$. **Leiðrétt.** |
| 20 | T | „Darlington transistor t.d. **BD139**“ | BD139 er venjulegur NPN-afltransistor, ekki Darlington (Darlington-dæmi: TIP120, BD679). Textinn umorðaður: „transistor, t.d. BD139 (eða Darlington-transistor …)“. **Leiðrétt.** |
| 26 | T | „NOR lásinn er **líka** settur og hreinsaður með **0** („active low“ inngangar)“ | NOR-lás er settur og hreinsaður með **1** (*active high*). Það er líka í samræmi við bönnuðu stöðuna $S = R = 1$ sem nefnd er í næstu setningu. **Leiðrétt.** |
| 27 | T | Sannleikstafla RS-NOR-láss: S=0, R=1 → Q=1 og S=1, R=0 → Q=0 | Öfugt: S=0, R=1 → Q=0, $\overline{Q}$=1 (hreinsun); S=1, R=0 → Q=1, $\overline{Q}$=0 (setning). Línurnar voru afritaðar úr NAND-töflunni. **Leiðrétt.** |
| 29 | T | Stöðubreytingatafla RS-vippu: S=0, R=1, $Q^n$=1 → $Q^{n+1}$ = **1** (Reset) | $Q^{n+1}$ = **0**. Það sést líka af útgangsjöfnunni $Q^{n+1} = S + \overline{R}Q^{n}$. **Leiðrétt.** Bönnuðu línurnar eru merktar X (gildi 1 notað í K-kortinu). |
| 32 | T | Stöðubreytingatafla JK-vippu: J=0, K=1, $Q^n$=1 → $Q^{n+1}$ = **1** (Reset) | $Q^{n+1}$ = **0** (rétt í töflunni í kafla 3.8 á bls. 34). **Leiðrétt.** |
| 66 | T | „flyst staðan á inngöngum I3 til I0 (1010) yfir á útgangana O3 til **O1**“ | … til **O0**. **Leiðrétt.** |
| 72 | T | „hvort við skrifum inn gögn ($R/\overline{W}$ = 1) eða lesum þau út ($R/\overline{W}$ = 0)“ | Öfugt, bæði samkvæmt venju ($R/\overline{W}$: 1 = lesa, 0 = skrifa) og samkvæmt rásinni á mynd 107 þar sem $R/\overline{W}$ fer beint á RD-hliðin og í gegnum NOT á WR-hliðin. **Leiðrétt.** |
| 85 | T | „viðhalda innihaldi CMOS rásarinnar sem **geymir BIOS** tölvunnar“ | CMOS-minnið geymir **stillingar** BIOS; BIOS-forritið sjálft er í Flash/EEPROM (eins og segir réttilega á bls. 90). **Leiðrétt.** |
| 85 | T/Ó | DRAM þarf „hressingu á c.a. **3 ms** fresti“ | Á bls. 94 segir réttilega **64 ms**, sem er staðallinn fyrir nútíma DRAM. Samræmt í 64 ms. **Leiðrétt.** |
| 86 | T | „**SDRAM** er til með fleiri transistorum … (Multi Access)“ | Á við **SRAM** (fjöltengja/*multi-port* SRAM-sellur). Stangast á við feitletruðu setninguna rétt á undan um að SDRAM hafi ekkert með SRAM að gera. **Leiðrétt.** |
| 88 | T | Innskrift í SRAM: „Síðan er **WR** línan gerð virk“ | **WL**-línan (*word line*). **Leiðrétt.** |
| 88 | T | „SRAM … eyðir minna afli en DRAM. Það er því mest notað þegar **bandvídd er léleg** eða lítið afl til staðar.“ | SRAM er notað þar sem þörf er á **mikilli** bandvídd eða lágri aflnotkun (í biðstöðu). **Leiðrétt.** |
| 89 | T | „PROM kemur frá verksmiðjunni með **0** í öllum minniseiningum. Til þess að skrifa **1** …“ | Algengast er að öll bræðitengi séu heil og lesist sem **1**; að bræða tengi gefur **0**. Umorðað á hlutlausari hátt („sama gildi (yfirleitt 1) í öllum minniseiningum“). **Leiðrétt.** |
| 89 | T | „EEPROM er byggt upp sem tvö lög af minni. Efra lagið er venjulegt R/W minni …“ | Þessi lýsing á við **NVSRAM** (SRAM með EEPROM-afriti), ekki EEPROM almennt. Umorðað. Einnig: Flash er ákveðin gerð af EEPROM, ekki annað nafn á því. **Leiðrétt.** |
| 92 | T/Ó | DRAM: „einn transistor og einn þétti … í stað **fjögurra** transistora í SRAM“ | SRAM-sellan á mynd 130 er **sex** transistora (4 til geymslu + 2 aðgangstransistorar). **Leiðrétt.** |
| 95 | T | „RAMBUS **168** pinna (RIMM)“ | RDRAM-RIMM-einingar eru **184** pinna. **Leiðrétt.** |
| 95 | F | „**IP** 16 pinna“ | **DIP** 16 pinna (sbr. skýringu „DIP = Dual Inline Package“ neðst á síðunni). **Leiðrétt.** |
| 96 | T | „WE, (Write Enable) rásin er tilbúin til að **skrifa inn gögn og lesa út gögn** svo lengi sem WE er lágur.“ | Lágt $\overline{\mathrm{WE}}$ = skrifa; hátt = lesa. **Leiðrétt.** RAS, CAS, WE og OE eru nú rituð með yfirstriki þar sem þau eru *active low*. |
| 97 | T | „DDR2 keyrir á **1,8 – 2,5V**“ | DDR2 keyrir á 1,8 V. **Leiðrétt.** |
| 97 | T | „Minniskubbarnir eru jafnlangir og hafa jafnmarga pinna. Sökklarnir eru þó ekki eins.“ | Skýrt að hakið (*notch*) í tengibrúninni sé á öðrum stað. **Leiðrétt.** |
| 57 | T | Útgáfa 1 af stórum LED-staf: 10 ljósdíóður (2,4 V) raðtengdar á 24 V. | **Athugasemd:** $10 \cdot 2{,}4\,\mathrm{V} = 24\,\mathrm{V}$ skilur ekkert spennufall eftir fyrir straumtakmörkunarviðnám eða mettunarspennu ULN2003 (u.þ.b. 1 V). Rásin virkar varla eins og henni er lýst; höfundur ætti að yfirfara fjölda díóða eða fæðispennu. Einnig er 50 mA óvenju mikill straumur fyrir 10 mm LED. |
| 62 | Ó | „Overbeck teljari“ | **Athugasemd:** Þessi teljari er yfirleitt kallaður hringteljari (*ring counter*). Heitinu „hringteljari“ bætt við í sviga. |
| 90 | T | Flýtiminni „framleitt sem frekar lítið eða **512k til 1M**“ | **Athugasemd/leiðrétt:** Úrelt; skyndiminni nútímaörgjörva er frá nokkrum hundruðum KB upp í tugi MB. Umorðað á almennari hátt. |

## Ósamræmi

| Bls. | Í frumriti | Leiðrétt / athugasemd |
|:-:|:--|:--|
| 1–4 | Titill „Tölvur og nettækni“, en TNT2-heftin heita „Tölvu og nettækni“. | Samræmt: „Tölvu- og nettækni“. |
| 26, 38, 39, 46, 74 | „Electronic Workbench“ og „Electronics Workbench“ á víxl. | Samræmt: *Electronics Workbench* (rétt heiti forritsins). |
| 67 | „6.2 **Samsíða** gistur“ en annars staðar „**Samhliða** gistur“. | Samræmt: „Samhliða“. |
| 65, 84 | „Parallell register“ | *Parallel register* |
| 40 | „Örvunarkort (**exitation** maps)“, „Örvunarjöfnur (**exitation** equations)“ | *excitation* |
| 93 | Tafla DDR-tíma: „Þessi tafla spannar yfir 11 ára tímabil“ og borið saman við EDO RAM sem er ekki í töflunni. | Umorðað („nokkurra ára tímabil“, „en eldra EDO-minni“). |
| 97 | „biðminni (**prefetch que**)“ | „forsóknarbiðminni (*prefetch buffer*)“ |
| 13 | Snertuskopp: sjá mynd 1 til myndar 5 (myndirnar eru ekki tölusettar í frumriti). | Myndirnar eru nú myndir 8–12; vísað í „stöðu 1 til stöðu 5“. |

## Málfar og stafsetning

| Bls. | Í frumriti | Leiðrétt |
|:-:|:--|:--|
| víða | „OR hlið“, „74 rásirnar“, „D vippa“, „RS lás“ o.s.frv. | Með bandstriki: „OR-hlið“, „74-rásirnar“, „D-vippa“, „RS-lás“. |
| víða | Einingar án bils: „5V“, „40µA“, „10MHz“ | Bil á milli tölu og einingar, LaTeX-ritháttur: $5\,\mathrm{V}$, $40\,\mu\mathrm{A}$. |
| 5 | „bæði rökræni hluti þeirra … er búinn til með transistorum og einnig útgangsstig“ | „bæði rökræni hluti þeirra … og útgangsstig … eru búin til með transistorum“ |
| 5 | „Þessi data blöð má „gúggla“ …“ | „Gagnablöðin (*data sheets*) má finna á netinu …“ |
| 5–7 | „(lógískur 1)“, „(lógískt 0)“ | „(rökleg 1)“, „(rökleg 0)“ (samræmt kyn) |
| 8 | „seinkunn“ | „seinkun“ |
| 8 | „Nanósekúndur eru milljörðustu hlutar úr sekúndu og tíðnir …“ | „Nanósekúnda er milljarðasti hluti úr sekúndu og tíðni …“ |
| 11 | „lenda í millibili á milli inngangs 1 og inngangs 5“ | „lenda mitt á milli …“ |
| 13 | „Ef **annarhvor**“ | „annar hvor“ |
| 17 | „þá má tengja **sama** tvö eða fleiri hlið“ | „tengja **saman**“ |
| 17 | „óvíst hvort spennan á þeim **sé í lág eða hástöðu**“ | „… er í lágstöðu eða hástöðu“ |
| 19 | „neðsta **inn ganginn**“ | „innganginn“ |
| 18 | „1 er **margföldunarhlutleysa**“ | „1 er hlutleysa margföldunar“ |
| 18 | „straumþunga innganga“, „með réttu mögnunarstigi eða stigum“ (punkt vantar) | „straumfreka innganga“, „… eða -stigum.“ |
| 21 | „hefur sjö inn og útganga og VCC og 0V innganga“ | „sjö innganga og sjö útganga ásamt $V_{CC}$- og 0 V-tengjum“ |
| 23 | „Til þess að fá **raunverulegar** niðurstöður má samt ekki nota „ideal rásir““ | „raunhæfar niðurstöður … „hugsjónarásir“ (*ideal*)“ |
| 25 | „c.a.“ | „u.þ.b.“ |
| 25 | „smíða sér **þær** sjálfur“ | „smíða sér sjálfur“ |
| 26 | „til **þess hreinsa** hann“ | „til þess **að** hreinsa hann“ |
| 28 | „Þetta kallast **Syncron** rásir“ | „samfasa rásir (*synchronous*)“ |
| 31 | „D vippa ( Data flip flop) er notuð í teljara og **register**“ | „… í teljara og gistur“ |
| 31 | „Þeir hafa því forgang **á** klukkuinnganginn“ | „forgang **fram yfir** …“ |
| 37 | „**seinkun** í hverri vippu og … ekki víst að **þeir** nái allir að fylgja eftir“ | „… að **þær** nái allar …“ (vippur, kvk.) |
| 40 | „Stöðubreytinga tafla“ | „Stöðubreytingatafla“ |
| 42 | „grúppum“, „grúppað“ | „hópum“, „hópað“ |
| 47 | „hvernig getum **séð**“ | „hvernig getum **við** séð“ |
| 50 | „sjö ráka **ákóðunarrás**“ | „afkóðunarrás“ |
| 53 | „(A,b,c,d.E.F)“ | „(A, b, C, d, E, F)“ |
| 55 | „Zero suppression (Núll þvingun)“ | „núllbæling (*zero suppression*)“ |
| 56 | „slekkur hún á útgöngunum a til **f**“ | „a til **g**“ (sjö rákir) |
| 63 | „til **ð** endursetja“, „**sendursetur**“ | „til **að** endursetja“, „endursetur“ |
| 77 | „hald tími“, „flutnings seinkunn“, „Seinkunnartíminn“ | „haldtími“, „flutningsseinkun“, „seinkunartíminn“ |
| 81 | „RAM minni … er minni sem hægt er að **lesa í og skrifa úr**“ | „lesa **úr** og skrifa **í**“ |
| 90 | „tekið **þá inni** í reikningseininguna“ | „tekið **þær inn** í …“ |
| 90 | „nær **undantekningalaust**“ | „undantekningarlaust“ |
| 91 | „innan **örgjörvann**“, „notkun á **vistfanga eða** gagnabrautinni“ | „innan **örgjörvans**“, „vistfanga- eða gagnabrautinni“ |
| 92 | „eru **reynd** mest notuðu“, „uppbyggingunni **Aðeins**“ (punkt vantar) | „eru **í reynd** …“, „uppbyggingunni. Aðeins“ |
| 93 | „minnið sé **endurskoðað**“ | „minnið sé **hresst við**“ |
| 93 | „(50 **Mword(s)**.“ | „(50 Mword/s)“ |
| 94 | „**erfiðarara**“ | „erfiðara“ |
| 97 | „hvorki samhæft við DDR1 **eða** DDR3“ | „… **né** …“ |
| 97 | „Hámarksflutninghraði“ | „Hámarksflutningshraði“ / „flutningsgeta“ |
| 99 | „Picaxe **Progamming** Editor“, „niðurhala“, „serial **upphals rás**“ | „Programming“, „sækja“, „raðtengda upphalsrás“ |
