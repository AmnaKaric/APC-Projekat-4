# APC-Projekat-4

## Projekat 4: GMII prijemni interfejs
Modelirati i implementirati GMII prijemni interfejs koji putem ulaznog GMII interfejsa prima
preambulu, SFD i oktete dolaznog Ethernet okvira, te na izlazni 64-bitni Avalon-ST interfejs
generiše dolazni Ethernet okvir (počinje odredišnom adresom a završava FCS poljem).

<details>
  <summary>TIMELINE AKTIVNOSTI NA PROJEKTU</summary>

  08.12.2024. OPIS SIGNALA I PRIKAZ SIGNALA U WAVEDROM-U  
  10.12.2024. OPIS SIGNALA I PRIKAZ SIGNALA U WAVEDROM-U  
  11.12.2024. MODIFICARNI PRIKAZ SIGNALA U WAVEDROM-U  
  12.12.2024. PREPRAVKA WAVEDROM-A PO UPUTAMA IZ ISSUES

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
  
### **a) Normalni režim rada:**
### Prikaz u Wavedromu za signale tokom prijema:
---

### Napomene:
- **0x55**: Preambula - 7 okteta
- **0xD5**: SFD (Start Frame Delimiter) - 1 oktet

Nakon polja SFD pristižu okteti Ethernet okvira, koji su označeni sa `D1,...,D64`:
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


### **b) Režim rada sa detektovanom greškom:**
### Prikaz u Wavedromu za signale tokom prijema:
---
```json
{ "signal": [
  { "name": "gmii_rx_clk", "wave": "p..............." },
  { "name": "gmii_rxreset_n", "wave": "01.............." },
  { "name": "gmii_rxdv", "wave": "01..0..........." },
  { "name": "gmii_rxer", "wave": "0....10........." },
  { "name": "gmii_rxd", "wave": "x2222222222xxxxx", "data": ["8'h55", "8'hAB", "D1", "D2","D3", "D4", "D5", "D6", "D7", "D8", "x"] },
  { "name": "rx_st_data", "wave": "xxxx22222222x...", "data": ["D1", "D2", "8’h0E", "D4", "D5", "D6", "D7", "D8", "x"] },
  { "name": "rx_st_sop", "wave": "0...10.........." },
  { "name": "rx_st_eop", "wave": "0..........10..." },
  { "name": "rx_st_empty", "wave": "...22.......xx..", "data": ["0"] },
  { "name": "rx_st_valid", "wave": "0...1.01.....0.." },
  { "name": "rx_st_ready", "wave": "0...1.......0..." },
  { "name": "rx_st_err", "wave": "0.....10........" }
]}
```


