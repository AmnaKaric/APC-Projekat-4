# APC-Projekat-4

## Projekat 4: GMII prijemni interfejs
Modelirati i implementirati GMII prijemni interfejs koji putem ulaznog GMII interfejsa prima
preambulu, SFD i oktete dolaznog Ethernet okvira, te na izlazni 64-bitni Avalon-ST interfejs
generiše dolazni Ethernet okvir (počinje odredišnom adresom a završava FCS poljem).

<details>
  <summary>TIMELINE AKTIVNOSTI NA PROJEKTU</summary>

  **08.12.2024.** OPIS SIGNALA I PRIKAZ SIGNALA U WAVEDROM-U  
  **10.12.2024.** OPIS SIGNALA I PRIKAZ SIGNALA U WAVEDROM-U  
  **11.12.2024.** MODIFICARNI PRIKAZ SIGNALA U WAVEDROM-U  
  **12.12.2024.** PREPRAVKA WAVEDROM-A PO UPUTAMA IZ ISSUES <br>
  **15.12.2024.** DRUGI DIO PROJEKTNOG ZADATKA - FSM DIJAGRAM

</details>

#### **Popis potrebnih ulaznih i izlaznih signala:**
- **`gmii_rx_clk`**: Takt signal za sinhronizaciju prijema podataka na GMII interfejsu.
- **`gmii_rxreset_n`**: Reset signal koji inicijalizira prijemni dio GMII interfejsa.
- **`gmii_rxdv`**: Signal koji označava da su podaci u `gmii_rxd` validni i da pripadaju Ethernet okviru.
- **`gmii_rxd[7:0]`**: 8-bitni ulazni signal koji prenosi oktete Ethernet okvira, sukcesivno, bajt po bajt.
- **`rx_st_data[63:0]`**: 64-bitni izlazni signal koji prenosi podatke sa Avalon-ST interfejsa, uključujući cijeli Ethernet okvir, počevši od odredišne adrese pa do FCS polja.
- **`rx_st_sop`**: Signal koji označava početak Ethernet okvira na Avalon-ST interfejsu.
- **`rx_st_eop`**: Signal koji označava kraj Ethernet okvira na Avalon-ST interfejsu.
- **`rx_st_empty`**: Signal koji pokazuje koliko bajtova u posljednjem 64-bitnom segmentu okvira je preostalo.
- **`rx_st_valid`**: Signal koji označava da su podaci na `rx_st_data` trenutno validni i spremni za obradu.
- **`rx_st_ready`**: Ulazni signal kojim prijemnik označava da je spreman da prihvati nove podatke sa Avalon-ST interfejsa.
  
### **a) Prijem okvira čija je dužina (u bajtima) djeljiva bez ostatka sa 8**
### Prikaz koda u Wavedromu za signale tokom prijema:
---

### Napomene:
- **0x55**: Preambula - 7 okteta
- **0xD5**: SFD (Start Frame Delimiter) - 1 oktet

Nakon polja SFD pristižu okteti Ethernet okvira, koji su označeni sa `D0,...,D63`:
- **Destination MAC Address**: 6 okteta.
- **Source MAC Address**: 6 okteta.
- **EtherType/Length**: 2 okteta.
- **Payload (Data)**: 46 okteta (proizvoljno odabrana veličina).
- **FCS (Frame Check Sequence)**: 4 okteta.

---

```json
{ "signal": [
  { "name": "gmii_rx_clk", "wave": "p................." },
  { "name": "gmii_rxreset_n", "wave": "1................." },
  { "name": "gmii_rxdv", "wave": "01.............0.." },
  { "name": "gmii_rxd [7:0]", "wave": "x222222222222|2xxx", "data": ["0x55", "0xD5", "D0", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", " ","D63"] },
  { "name": "rx_st_data [63:0]", "wave": "xxxxxxxxxxx222|2xx", "data": ["D0-D7", "D8-D15 "," ", "D56-D63"] },
  { "name": "rx_st_sop", "wave": "0..........10....." },
  { "name": "rx_st_eop", "wave": "0..............10." },
  { "name": "rx_st_empty", "wave": "..........22....xx", "data": ["0"] },
  { "name": "rx_st_valid", "wave": "0..........1....0." },
  { "name": "rx_st_ready", "wave": "1................." }
],
 "config":{
   "hscale": 2}
}
```


### **b) Prijem okvira čija dužina (u bajtima) nije djeljiva bez ostatka sa 8:**
### Prikaz koda u Wavedromu za signale tokom prijema:
---

### Napomene:
- **0x55**: Preambula - 7 okteta
- **0xD5**: SFD (Start Frame Delimiter) - 1 oktet

Nakon polja SFD pristižu okteti Ethernet okvira, koji su označeni sa `D0,...,D83`:
- **Destination MAC Address**: 6 okteta.
- **Source MAC Address**: 6 okteta.
- **EtherType/Length**: 2 okteta.
- **Payload (Data)**: 66 okteta (proizvoljno odabrana veličina).
- **FCS (Frame Check Sequence)**: 4 okteta.

```json
{ "signal": [
  { "name": "gmii_rx_clk", "wave": "p................." },
  { "name": "gmii_rxreset_n", "wave": "1................." },
  { "name": "gmii_rxdv", "wave": "01.............0.." },
  { "name": "gmii_rxd [7:0]", "wave": "x222222222222|2xxx", "data": ["0x55", "0xD5", "D0", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", " ","D83"] },
  { "name": "rx_st_data [63:0]", "wave": "xxxxxxxxxxx222|22x", "data": ["D0-D7", "D8-D15 "," ", "D72-D79","D80-D87"] },
  { "name": "rx_st_sop", "wave": "0..........10....." },
  { "name": "rx_st_eop", "wave": "0...............10" },
  { "name": "rx_st_empty", "wave": "..........22....2x", "data": ["0","4"] },
  { "name": "rx_st_valid", "wave": "0..........1.....0" },
  { "name": "rx_st_ready", "wave": "1................." }
],
 "config":{
   "hscale": 2}
}
```
### **c) Prijem okvira uz backpressure (Avalon-ST sink povremeno deaktivira ready):**

### Napomene:
- **0x55**: Preambula - 7 okteta
- **0xD5**: SFD (Start Frame Delimiter) - 1 oktet

Nakon polja SFD pristižu okteti Ethernet okvira, koji su označeni sa `D0,...,D63`:
- **Destination MAC Address**: 6 okteta.
- **Source MAC Address**: 6 okteta.
- **EtherType/Length**: 2 okteta.
- **Payload (Data)**: 46 okteta (proizvoljno odabrana veličina).
- **FCS (Frame Check Sequence)**: 4 okteta.

---
```json
{ "signal": [
  { "name": "gmii_rx_clk", "wave": "p......................" },
  { "name": "gmii_rxreset_n", "wave": "1......................" },
  { "name": "gmii_rxdv", "wave": "01.............0......." },
  { "name": "gmii_rxd [7:0]", "wave": "x222222222222|2xxxxxxxx", "data": ["0x55", "0xD5", "D0", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", " ","D63"] },
  { "name": "rx_st_data [63:0]", "wave": "xxxxxxxxxxx22.222..222x", "data": ["D0-D7", "D8-D15 ","D16-D23","D24-D31","D32-D39", "D40-D47","D48-D55", "D56-D63"] },
  { "name": "rx_st_sop", "wave": "0..........10.........." },
  { "name": "rx_st_eop", "wave": "0....................10" },
  { "name": "rx_st_empty", "wave": "..........22..........x", "data": ["0"] },
  { "name": "rx_st_valid", "wave": "0..........1..........0" },
  { "name": "rx_st_ready", "wave": "1...........0.1.0..1..." }
],
 "config":{
   "hscale": 2}
}
```

#### **Dizajnirati konačni automat koji upravlja tokom podataka kroz dati sklop**
Konačni automat se sastoji od 4 stanja: IDLE, RECEIVE, WAIT, SEND.
**`IDLE`**: stanje kada se GMII interfejs nalazi u stanju mirovanja i čeka početak Ethernet okvira.
**`RECIEVE`**: stanje u kom se vrši prijem Ethernet okvira.
**`WAIT`**: stanje uvedeno zbog backpressure mehanizma, koje omogućava pauziranje prijenosa podataka prema Avalon-ST interfejsu.
**`SEND`**: stanje u kome se vrši slanje Ethernet okvira na izlazni Avalon-ST interfejs.
