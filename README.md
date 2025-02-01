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
  
![slucaj_a)](https://github.com/user-attachments/assets/64a67d14-761a-4a7f-bfd0-a63d68707a1e)

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

![slucaj_b)](https://github.com/user-attachments/assets/f6960f52-6dcd-4796-8eeb-b21d559ec0cc)

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


