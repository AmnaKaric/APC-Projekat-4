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
  **22.12.2024.** DODAVANJE INTERNIH SIGNALA <br>
  **03.01.2025** RAD NA WAVEDROM-U I FSM DIJAGRAMU <br>
  **08.01.2025** RAD NA WAVEDROM-U <br>
  **10.01.2025** FINALNE KOREKCIJE WAVEDROM-A , FSM ZAVRŠEN <br>
  **11.01.2025** POČETAK PISANJA VHDL KODA <br>
  **20.01.2025** IZRADA VHDL KODA I KOREKCIJA WAVEDROM-A

</details>

#### **1. Popis potrebnih ulaznih i izlaznih signala:**
- **`gmii_rx_clk`**: Takt signal za sinhronizaciju prijema podataka na GMII interfejsu.
- **`reset`**: Reset signal koji inicijalizira prijemni dio GMII interfejsa.
- **`gmii_rxdv`**: Signal koji označava da su podaci u `gmii_rxd` validni i da pripadaju Ethernet okviru.
- **`gmii_rxd[7:0]`**: 8-bitni ulazni signal koji prenosi oktete Ethernet okvira, sukcesivno, bajt po bajt.
- **`avalon_clk`**: Takt signal za sinhronizaciju prenosa podataka na Avalon-ST interfejsu (frekvencija osam puta manja od frekvencije ulaznog takta gmii_rx_clk).
- **`int_data`**: Interni signal, koji predstavlja 64-bitni vektor primljenih vrijednosti
- **`clk_counter`**: Brojač koji broji takt signal `avalon_clk`.
- **`rx_st_data[63:0]`**: 64-bitni izlazni signal koji prenosi podatke sa Avalon-ST interfejsa, uključujući cijeli Ethernet okvir, počevši od odredišne adrese pa do FCS polja.
- **`rx_st_sop`**: Signal koji označava početak Ethernet okvira na Avalon-ST interfejsu.
- **`rx_st_eop`**: Signal koji označava kraj Ethernet okvira na Avalon-ST interfejsu.
- **`int_empty`**: Interni signal koji predstavlja koliko bita će biti ispunjeni nulama, kako bi se omogućilo slanje na izlaz. 
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
    { "name": "gmii_rx_clk", "wave": "p.............................................................................................." },
    { "name": "reset", "wave": "10............................................................................................." },
    { "name": "gmii_rxdv", "wave": "0............1.......................................................................0........." },
    { "name": "gmii_rxd [7:0]", "wave": "xxxxxxxxxxxx.3......42222222222222222222222222222222222222222222222222222222222222222xXxxxxxxxx", "data": ["0x55", "0xD5", "D0", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "D11", "D12", "D13", "D14", "D15", "D16", "D17", "D18", "D19", "D20", "D21", "D22", "D23", "D24", "D25","D26","D27","D28","D29","D30","D31","D32","D33","D34","D35","D36","D37","D38","D39","D40","D41","D42","D43","D44","D45","D46","D47","D48","D49","D50","D51","D52","D53","D54","D55","D56","D57", "D58", "D59", "D60", "D61", "D62", "D63"] },
    { "name": "avalon_clk",  "wave": "0....1...0...1...0...1...0...1...0...1...0...1...0...1...0...1...0...1...0...1...0...1...0...1." },
    { "name": "clk_counter", "wave": "x2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222", "data": ["000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000"]},
    { "name": "int_data[63:56]", "wave": "xxxxxxxxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D0"]},
    { "name": "int_data[55:48]", "wave": "xxxxxxxxxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D1"]},
    { "name": "int_data[47:40]", "wave": "xxxxxxxxxxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D2"]},
    { "name": "int_data[39:32]", "wave": "xxxxxxxxxxxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D3"]},
    { "name": "int_data[31:24]", "wave": "xxxxxxxxxxxxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D4"]},
    { "name": "int_data[23:16]", "wave": "xxxxxxxxxxxxxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D5"]},
    { "name": "int_data[15:8]", "wave": "xxxxxxxxxxxxxxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D6"]},
    { "name": "int_data[7:0]", "wave": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D7"]},
    { "name": "int_data[63:0]", "wave": "xxxxxxxxxxxxxxxxxxxxxx2.......xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D0 D1 D2 D3 D4 D5 D6 D7"]},
	{ "name": "rx_st_data [63:0]", "wave": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx2.......2.......2.......2.......2.......2.......2.......2.......x", "data": ["D0-D7", "D8-D15", "D16-D23", "D24-D31","D32-D39","D40-D47","D48-D55", "D56-D63"] },
    { "name": "rx_st_sop", "wave": "0.............................1.......0........................................................" },
    { "name": "rx_st_eop", "wave": "0.....................................................................................1.......0" },
    { "name": "int_empty", "wave": "x.............................x......................................................2x.......x", "data": ["0"] },
    { "name": "rx_st_empty", "wave": ".............................22...............................................................x", "data": ["0"] },
    { "name": "rx_st_valid", "wave": "0.............................1...............................................................0" },
    { "name": "rx_st_ready", "wave": "1.............................................................................................." },
    { "name": "state_registar", "wave": "2.............2.......2...............................................................2.......2", "data": ["IDLE", "RECEIVING_PREAMBLE", "RECEIVING_DATA","LAST_DATA","IDLE"] },
    { "name": "counter", "wave": "x.............222222222222222222222222222222222222222222222222222222222222222222222222x........", "data": ["7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0"] }
  ]
}
```
![slucaj_a](https://github.com/user-attachments/assets/5e04ef8e-596a-4560-833d-b6d1421e5904)

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
    { "name": "gmii_rx_clk", "wave": "p........................................................................................................................" },
    { "name": "reset", "wave": "10......................................................................................................................." },
    { "name": "gmii_rxdv", "wave": "0............1...........................................................................................0..............." },
    { "name": "gmii_rxd [7:0]", "wave": "xxxxxxxxxxxx.3......4222222222222222222222222222222222222222222222222222222222222222222222222222222222222xxxxxxxxxxxxxxxx", "data": ["0x55", "0xD5", "D0", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "D11", "D12", "D13", "D14", "D15", "D16", "D17", "D18", "D19", "D20", "D21", "D22", "D23", "D24", "D25","D26","D27","D28","D29","D30","D31","D32","D33","D34","D35","D36","D37","D38","D39","D40","D41","D42","D43","D44","D45","D46","D47","D48","D49","D50","D51","D52","D53","D54","D55","D56","D57", "D58", "D59", "D60", "D61","D62","D63","D64","D65","D66","D67","D68","D69","D70","D71","D72", "D73", "D74", "D75", "D76", "D77", "D78", "D79", "D80", "D81", "D82", "D83"]},
	{ "name": "avalon_clk",  "wave": "0....1...0...1...0...1...0...1...0...1...0...1...0...1...0...1...0...1...0...1...0...1...0...1...0...1...0...1...0...1..." },
	{ "name": "clk_counter", "wave": "x222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222", "data": ["000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000", "001", "010", "011", "100", "101", "110", "111","000"]},
    { "name": "int_data[63:56]", "wave": "xxxxxxxxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D0"]},
    { "name": "int_data[55:48]", "wave": "xxxxxxxxxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D1"]},
    { "name": "int_data[47:40]", "wave": "xxxxxxxxxxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D2"]},
    { "name": "int_data[39:32]", "wave": "xxxxxxxxxxxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D3"]},
    { "name": "int_data[31:24]", "wave": "xxxxxxxxxxxxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D4"]},
    { "name": "int_data[23:16]", "wave": "xxxxxxxxxxxxxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D5"]},
    { "name": "int_data[15:8]", "wave": "xxxxxxxxxxxxxxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D6"]},
    { "name": "int_data[7:0]", "wave": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D7"]},
    { "name": "int_data[63:0]", "wave": "xxxxxxxxxxxxxxxxxxxxxx2.......xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx","data": ["D0 D1 D2 D3 D4 D5 D6 D7"]},
	{ "name": "rx_st_data [63:0]", "wave": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx2.......2.......2.......2.......2.......2.......2.......2.......2.......2.......2.......x..", "data": ["D0-D7", "D8-D15", "D16-D23","D24-D31","D32-D39","D40-D47","D48-D55", "D56-D63","D64-D71", "D72-D79", "D80-D87"] },
    { "name": "rx_st_sop", "wave": "0.............................1.......0.................................................................................." },
    { "name": "rx_st_eop", "wave": "0.............................................................................................................1.......0.." },
    { "name": "int_empty", "wave": "x........................................................................................................x2222x.......x..", "data": ["1", "2", "3", "4"] },
    { "name": "rx_st_empty", "wave": ".............................22...............................................................................3.......x..", "data": ["0", "4"] },
    { "name": "rx_st_valid", "wave": "0.............................1.......................................................................................0.." },
    { "name": "rx_st_ready", "wave": "1........................................................................................................................" },
    { "name": "state_registar", "wave": "2.............2.......2.......................................................................................2.......2..", "data": ["IDLE", "RECEIVING_PREAMBLE", "RECEIVING_DATA","LAST_DATA","IDLE"] },
	{ "name": "counter", "wave": "x.............222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222x..........", "data": ["7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0","7","6","5","4","3","2","1","0",] }
  ]
}
```
![slucaj_b](https://github.com/user-attachments/assets/70b69d1c-1b77-4b60-8509-f021d2dc7e0e)

#### **2. Dizajnirati konačni automat koji upravlja tokom podataka kroz dati sklop**

Konačni automat se sastoji od 3 stanja: **IDLE**, **RECEIVING_PREAMBLE**, **RECEIVING_DATA**, **LAST_DATA**.

**`IDLE`**: predstavlja stanje mirovanja, gdje GMII interfejs čeka početak Ethernet okvira. Prelazak u naredno stanje dešava se kada signal `gmii_rxdv` postane '1', što označava da su dolazni podaci validni.

**`RECIEVING_PREAMBLE`**: predstavlja stanje u kojem se prima preambula Ethernet okvira. Kada GMII interfejs detektuje SFD (Start Frame Delimiter), odnosno bajt 0xD5, i signal `gmii_rxdv` ostane '1', prelazi se u stanje RECEIVING_DATA. 

**`RECIEVING_DATA`**: predstavlja stanje u kojem se obrađuju svi podaci Ethernet okvira. Sistem ostaje u ovom stanju sve dok je signal `gmii_rxdv` jednak '1', što označava da okvir još uvijek traje. Tokom ovog stanja vrijednost brojača `counter` se smanjuje sa svakim primljenim paketom, te se pri vrijednosti "000" resetuje i ponovo počinje sa brojanjem paketa. Ova dva uslova označavaju to da je na prijem stiglo 8 bita koji se zajedno šalju na izlaz. Kada se prijem okvira završi, odnosno kada `gmii_rxdv` postane '0', sistem prelazi stanje u LAST_DATA.

**`LAST_DATA`**: predstavlja stanje u kojem se obrađuje posljednih 8 bita primljenih podataka, te se nakon njihove obrade, sistem vraća u stanje IDLE.

![FSM](https://github.com/user-attachments/assets/e6fd3023-ae14-4c2a-8cb6-43eaa4c84549)

## Literatura

[1] AMD, *GMII Reception*, PG047 Gigabit Ethernet PCS/PMA.  

[2] Intel, *Gigabit Media Independent Interface*, Intel FPGA Documentation.  

[3] Intel, *Avalon-ST Rx Interface*, Intel FPGA Documentation.  

[4] Kaljić E., (2024.), *Arhitekture paketskih čvorišta - Predavanje 7*.  

[5] IEEE Std 802.3-2022, *IEEE Standard for Ethernet*.


