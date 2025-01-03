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
  **15.12.2024.** DRUGI DIO PROJEKTNOG ZADATKA - FSM DIJAGRAM <br>
  **16.12.2024.** PREPRAVKA WAVEDROM-A PO UPUTAMA IZ ISSUES <br>
  **22.12.2024.** DODAVANJE INTERNIH SIGNALA
  **03.01.2025** RAD NA WAVEDROM-U I FSM DIJAGRAMU

</details>

#### **1. Popis potrebnih ulaznih i izlaznih signala:**
- **`gmii_rx_clk`**: Takt signal za sinhronizaciju prijema podataka na GMII interfejsu.
- **`reset`**: Reset signal koji inicijalizira prijemni dio GMII interfejsa.
- **`gmii_rxdv`**: Signal koji označava da su podaci u `gmii_rxd` validni i da pripadaju Ethernet okviru.
- **`gmii_rxd[7:0]`**: 8-bitni ulazni signal koji prenosi oktete Ethernet okvira, sukcesivno, bajt po bajt.
- **`avalon_clk`**: Takt signal za sinhronizaciju prenosa podataka na Avalon-ST interfejsu (frekvencija osam puta manja od frekvencije ulaznog takta gmii_rx_clk).
- **`clk_counter`**: Brojač koji broji takt signal `avalon_clk`.
- **`rx_st_data[63:0]`**: 64-bitni izlazni signal koji prenosi podatke sa Avalon-ST interfejsa, uključujući cijeli Ethernet okvir, počevši od odredišne adrese pa do FCS polja.
- **`rx_st_sop`**: Signal koji označava početak Ethernet okvira na Avalon-ST interfejsu.
- **`rx_st_eop`**: Signal koji označava kraj Ethernet okvira na Avalon-ST interfejsu.
- **`rx_st_empty`**: Signal koji pokazuje koliko bajtova u posljednjem 64-bitnom segmentu okvira je preostalo.
- **`rx_st_valid`**: Signal koji označava da su podaci na `rx_st_data` trenutno validni i spremni za obradu.
- **`rx_st_ready`**: Ulazni signal kojim prijemnik označava da je spreman da prihvati nove podatke sa Avalon-ST interfejsa.
- **`state_registar`**: Interni signal, koji prati trenutno stanje ulaznih signala.
- **`counter`**: 8-bitni brojač koji broji broj primljenih bita na ulazu.
  
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
{
  "signal": [
    { "name": "gmii_rx_clk", "wave": "p.................................................|................." },
    { "name": "reset", "wave": "10................................................|................." },
    { "name": "gmii_rxdv", "wave": "0............1....................................|........0........" },
    { "name": "gmii_rxd [7:0]", "wave": "xxxxxxxxxxxx.3......422222222222222222222222222222|22222222xxxxxxxxx", "data": ["0x55", "0xD5", "D0", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "D11", "D12", "D13", "D14", "D15", "D16", "D17", "D18", "D19", "D20", "D21", "D22", "D23", "D24", "D25","D26","D27","D28","D56", "D57", "D58", "D59", "D60", "D61", "D62", "D63"] },
    { "name": "avalon_clk",  "wave": "l....h...l...h...l...h...l...h...l...h...l...h...l|h...l...h...l...h" },
    { "name": "clk_counter", "wave": "x2222222222222222222222222222222222222222222222222|22222222222222222", "data": ["000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110","111","000","100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011","100","101","110","111","000","001","010","011"]},
    { "name": "rx_st_data [63:0]", "wave": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx2.......2.......2....|2.......2.......x", "data": ["D0-D7", "D8-D15", "D16-D23", "D48-D55", "D59-D63"] },
    { "name": "rx_st_sop", "wave": "0............................1.......0............|................." },
    { "name": "rx_st_eop", "wave": "0.................................................|........1.......0" },
    { "name": "rx_st_empty", "wave": "............................22....................|................x", "data": ["0"] },
    { "name": "rx_st_valid", "wave": "0............................1....................|................0" },
    { "name": "rx_st_ready", "wave": "1.................................................|................." },
    { "name": "state_registar", "wave": "2............2.......2.......2.......2.......2....|2.......2........", "data": ["IDLE", "RECEIVING_PREAMBLE", "RECEIVING_DATA","RECEIVING_DATA","RECEIVING_DATA","RECEIVING_DATA","RECEIVING_DATA","IDLE"] },
    { "name": "counter", "wave": "x............2222222222222222222222222222222222222|22222222x........", "data": ["111","110","101","100","011","010","001","000","111","110","101","100","011","010","001","000","111","110","101","100","011","010","001","000","111","110","101","100","011","010","001","000","111","110","101","100","001","111","110","101","100","011","010","001","000","111","110","101","100","011","010","001","000","111","110","101","100"] }
  ]
}
```
![a_slucaj](https://github.com/user-attachments/assets/29bf8e3a-6e0e-4c21-96d5-abe0a29d868d)

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
{
  "signal": [
    { "name": "gmii_rx_clk", "wave": "p.................................................|........................." },
    { "name": "reset", "wave": "10................................................|........................." },
    { "name": "gmii_rxdv", "wave": "0............1....................................|............0............" },
    { "name": "gmii_rxd [7:0]", "wave": "xxxxxxxxxxxx.3......422222222222222222222222222222|222222222222xxxxxxxxxxxxx", "data": ["0x55", "0xD5", "D0", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "D11", "D12", "D13", "D14", "D15", "D16", "D17", "D18", "D19", "D20", "D21", "D22", "D23", "D24", "D25","D26","D27","D28","D72", "D73", "D74", "D75", "D76", "D77", "D78", "D79", "D80", "D81", "D82", "D83"] },
    { "name": "avalon_clk",  "wave": "l....h...l...h...l...h...l...h...l...h...l...h...l|h...l...h...l...h...l...h" },
    { "name": "clk_counter", "wave": "x2222222222222222222222222222222222222222222222222|222222222222222222222222x", "data": ["000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110","111","000","100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011","100","101","110","111","000","001","010","011"]},
    { "name": "rx_st_data [63:0]", "wave": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx2.......2.......2....|2.......2.......2.......x", "data": ["D0-D7", "D8-D15", "D16-D23", "D64-D71", "D72-D79", "D80-D83"] },
    { "name": "rx_st_sop", "wave": "0............................1.......0............|........................." },
    { "name": "rx_st_eop", "wave": "0.................................................|................1.......0" },
    { "name": "rx_st_empty", "wave": "............................22....................|................3.......x", "data": ["0", "4"] },
    { "name": "rx_st_valid", "wave": "0............................1....................|........................0" },
    { "name": "rx_st_ready", "wave": "1.................................................|........................." },
    { "name": "state_registar", "wave": "2............2.......2.......2.......2.......2....|2.......2...2............", "data": ["IDLE", "RECEIVING_PREAMBLE", "RECEIVING_DATA","RECEIVING_DATA","RECEIVING_DATA","RECEIVING_DATA", "RECEIVING_DATA","RECEIVING_DATA","IDLE"] },
    { "name": "counter", "wave": "x............2222222222222222222222222222222222222|222222222222x............", "data": ["111","110","101","100","011","010","001","000","111","110","101","100","011","010","001","000","111","110","101","100","011","010","001","000","111","110","101","100","011","010","001","000","111","110","101","100","001","111","110","101","100","011","010","001","000","111","110","101","100","011","010","001","000","111","110","101","100"] }
  ]
}

```
![b_slucaj](https://github.com/user-attachments/assets/d9899a56-e422-437b-9f1b-968f4395e606)

#### **2. Dizajnirati konačni automat koji upravlja tokom podataka kroz dati sklop**

Konačni automat se sastoji od 3 stanja: IDLE, RECEIVING_PREAMBLE, RECEIVING_DATA.

**`IDLE`**: predstavlja stanje mirovanja, gdje GMII interfejs čeka početak Ethernet okvira. Prelazak u naredno stanje dešava se kada signal `gmii_rxdv` postane '1', što označava da su dolazni podaci validni.

**`RECIEVING_PREAMBLE`**: predstavlja stanje u kojem se prima preambula Ethernet okvira. Kada GMII interfejs detektuje SFD (Start Frame Delimiter), odnosno bajt 0xD5, i signal `gmii_rxdv` ostane '1', prelazi se u stanje RECEIVING_DATA. 

**`RECIEVING_DATA`**: predstavlja stanje u kojem se obrađuju svi podaci Ethernet okvira. Sistem ostaje u ovom stanju sve dok je signal `gmii_rxdv` jednak '1', što označava da okvir još uvijek traje. Tokom ovog stanja vrijednost brojača `counter` se smanjuje sa svakim primljenim paketom, te se pri vrijednosti "000" resetuje i ponovo počinje sa brojanjem paketa. Ova dva uslova označavaju to da je na prijem stiglo 8 bajta koji se zajedno šalju na izlaz. Kada se prijem okvira završi, odnosno kada `gmii_rxdv` postane '0', sistem se vraća u stanje IDLE.


## Literatura

[1] AMD, *GMII Reception*, PG047 Gigabit Ethernet PCS/PMA.  

[2] Intel, *Gigabit Media Independent Interface*, Intel FPGA Documentation.  

[3] Intel, *Avalon-ST Rx Interface*, Intel FPGA Documentation.  

[4] Kaljić E., (2024.), *Arhitekture paketskih čvorišta - Predavanje 7*.  

[5] IEEE Std 802.3-2022, *IEEE Standard for Ethernet*.


