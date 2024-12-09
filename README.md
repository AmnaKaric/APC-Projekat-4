# APC-Projekat-4

## Projekat 4: GMII prijemni interfejs
Modelirati i implementirati GMII prijemni interfejs koji putem ulaznog GMII interfejsa prima
preambulu, SFD i oktete dolaznog Ethernet okvira, te na izlazni 64-bitni Avalon-ST interfejs
generiše dolazni Ethernet okvir (počinje odredišnom adresom a završava FCS poljem).


### Datum rada 
**08.12.2024.  OPIS SIGNALA I PRIKAZ SIGNALA U WAVEDROM-U**

#### **Popis potrebnih ulaznih i izlaznih signala:**
- **`gmii_rx_clk`**: Takt signal za sinhronizaciju prijema podataka na GMII interfejsu.
- **`gmii_rxreset_n`**: Reset signal koji inicijalizira prijemni dio GMII interfejsa.
- **`gmii_rxdv`**: Signal koji označava da su podaci u `gmii_rxd` validni i da pripadaju Ethernet okviru.
- **`gmii_rxer`**: Signal koji ukazuje na grešku u toku prenosa podataka na GMII interfejsu.
- **`gmii_rxd`**: Ulazni signal koji prenosi oktete Ethernet okvira, sukcesivno, bajt po bajt.
- **`rx_st_sop`**: Signal koji označava početak Ethernet okvira na Avalon-ST interfejsu.
- **`rx_st_eop`**: Signal koji označava kraj Ethernet okvira na Avalon-ST interfejsu.
- **`rx_st_empty`**: Signal koji pokazuje koliko bajtova u posljednjem 64-bitnom segmentu okvira nije validno.
- **`rx_st_valid`**: Signal koji označava da su podaci na `rx_st_data` trenutno validni i spremni za obradu.
- **`rx_st_ready`**: Ulazni signal kojim prijemnik označava da je spreman da prihvati nove podatke sa Avalon-ST interfejsa.
- **`rx_st_err`**: Signal koji ukazuje na grešku u primljenom okviru.
  
### **a) Normalni režim rada:**
Prikaz u Wavedromu za signale tokom prijema:
---

### Napomene:
- **8'h55**: Preambula - `8'h` označava 8-bitnu vrijednost (1 bajt) prikazanu u heksadecimalnom formatu; `55` je heksadecimalna vrijednost.
- **8'hAB**: SFD (Start Frame Delimiter): 1 oktet (fiksna vrijednost `0xAB`).

Nakon polja SFD pristižu okteti Ethernet okvira, koji su označeni sa `D1,...,D8`:
- **Destination MAC Address**: 6 okteta.
- **Source MAC Address**: 6 okteta.
- **EtherType/Length**: 2 okteta.
- **Payload (Data)**: 46 okteta (proizvoljno odabrana veličina).
- **FCS (Frame Check Sequence)**: 4 okteta.

---

```json
{ "signal": [
  { "name": "gmii_rx_clk", "wave": "p......................" },
  { "name": "gmii_rxreset_n", "wave": "01....................." },
  { "name": "gmii_rxdv", "wave": "01.........0..........." },
  { "name": "gmii_rxer", "wave": "0......................" },
  { "name": "gmii_rxd", "wave": "x2222222222xxxxxxxxxxxx", "data": ["8'h55", "8'hAB", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "x"] },
  { "name": "rx_st_data", "wave": "xxxxxxxxxxx22222222x...", "data": ["D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "x"] },
  { "name": "rx_st_sop", "wave": "0..........10.........." },
  { "name": "rx_st_eop", "wave": "0.................10..." },
  { "name": "rx_st_empty", "wave": "..........22.......xx..", "data": ["0"] },
  { "name": "rx_st_valid", "wave": "0..........1.......0..." },
  { "name": "rx_st_ready", "wave": "0..........10.........." },
  { "name": "rx_st_err", "wave": "0......................" }
]}



