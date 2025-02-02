# APC-Projekat-4

## Projekat 4: GMII prijemni interfejs
Modelirati i implementirati GMII prijemni interfejs koji putem ulaznog GMII interfejsa prima
preambulu, SFD i oktete dolaznog Ethernet okvira, te na izlazni 64-bitni Avalon-ST interfejs
generiše dolazni Ethernet okvir (počinje odredišnom adresom a završava FCS poljem).

### **Uvod** 
*Gigabit Media Independent Interface (GMII)* predstavlja ključnu komponentu Ethernet arhitekture kao standardizovani interfejs koji omogućava komunikaciju između *Media Access Control (MAC)* sloja i *fizičkog (PHY)* sloja u Gigabit Ethernet mrežama. Kao takav ima ključnu ulogu u očuvanju integriteta Ethernet okvira, osiguravajući da se podaci prenose bez grešaka i u skladu sa protokolima Ethernet arhitekture. Omogućava prenos podataka brzinom do 1 Gbps koristeći 8-bitni paralelni prenos podataka sinhronizovan taktom od 125 MHz.

Struktura *Ethernet okvira* uključuje *preambulu* (7B), koja služi za sinhronizaciju prijemnika; *Start Frame Delimiter* (1B), koji označava kraj preambule i početak okvira; *odredišnu* (6B) i *izvorišnu* (6B) adresu, koje označavaju krajnje tačke komunikacije; polje *dužine okvira* ili *tipa protokola* (2B), koje definiše vrstu prenesenih podataka; *payload* ili korisničke podatke (46–1500 B) te *Frame Check Sequence* (4B) za detekciju grešaka u prenesenim podacima. 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ![novi_okvir](https://github.com/user-attachments/assets/fcac6106-6a7f-465c-95bf-1e472c2562c7)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Slika 1**: Ethernet okvir

GMII prijemni interfejs je odgovoran za preuzimanje dolaznih Ethernet okvira sa fizičkog sloja, dekodiranje preambule i *Start Frame Delimiter (SFD)*, te formiranje i prosljeđivanje validnih okvira na viši sloj putem *Avalon Streaming (Avalon-ST)* interfejsa. Ovaj proces uključuje konverziju podataka iz GMII formata, u format prilagođen Avalon-ST interfejsu, koji očekuje 64-bitni tok podataka uz sinhronizaciju putem odgovarajućih kontrolnih signala (valid, ready, end-of-packet). U pogledu dizajna, razvoj GMII prijemnog interfejsa zahtjeva optimizovanu arhitekturu koja može efikasno obraditi visokofrekventni tok podataka bez gubitaka ili kašnjenja. Implementacija se može bazirati na *FPGA (Field-Programmable Gate Array)* ili *ASIC (Application-Specific Integrated Circuit)* tehnologijama. Uspješno modeliran i implementiran GMII prijemni interfejs doprinosi stabilnosti mrežnih sistema, a njegova efikasnost direktno utiče na performanse krajnjih aplikacija koje se oslanjaju na brz i pouzdan prenos podataka. Izradom ovog projektom pružen je uvid u rad GMII prijemnog interfejsa, te otvorene mogućnosti njegove dalje primjene.

#### **1. Popis potrebnih signala:**

**GMII Interface:**
- **`gmii_rx_clk`**: Takt signal za sinhronizaciju prijema podataka na GMII interfejsu.
- **`reset`**: Reset signal koji inicijalizira prijemni dio GMII interfejsa.
- **`gmii_rxdv`**: Signal koji označava da su podaci u `gmii_rxd` validni i da pripadaju Ethernet okviru.
- **`gmii_rxd[7:0]`**: 8-bitni ulazni signal koji prenosi oktete Ethernet okvira, sukcesivno, bajt po bajt.

**Interni signali:**
- **`avalon_clk`**: Takt signal za sinhronizaciju prenosa podataka na Avalon-ST interfejsu (frekvencija osam puta manja od frekvencije ulaznog takta gmii_rx_clk).
- **`int_data`**: Interni signal koji predstavlja 64-bitni vektor primljenih vrijednosti.
- **`int_empty`**: Broj bajtova u posljednjem segmentu koji će biti zamijenjeni nulama radi poravnanja, kako bi se omogućilo slanje na izlaz. 
- **`clk_counter`**: Brojač koji broji takt signal `avalon_clk`.
- **`state_registar`**: Interni signal koji prati trenutno stanje ulaznih signala.
- **`counter`**: 8-bitni brojač koji broji primljene bite na ulazu.

**Avalon‑ST RX Interface:**
- **`rx_st_data[63:0]`**: 64-bitni izlazni signal koji prenosi podatke sa Avalon-ST interfejsa, uključujući cijeli Ethernet okvir, počevši od odredišne adrese pa do FCS polja.
- **`rx_st_sop`**: Signal koji označava početak Ethernet okvira na Avalon-ST interfejsu.
- **`rx_st_eop`**: Signal koji označava kraj Ethernet okvira na Avalon-ST interfejsu.
- **`rx_st_empty`**: Signal koji pokazuje koliko bajtova u posljednjem 64-bitnom segmentu okvira je preostalo.
- **`rx_st_valid`**: Signal koji označava da su podaci na `rx_st_data` trenutno validni i spremni za obradu.
- **`rx_st_ready`**: Ulazni signal kojim prijemnik označava da je spreman da prihvati nove podatke sa Avalon-ST interfejsa.
  
### **a) Prijem okvira čija je dužina (u bajtima) djeljiva bez ostatka sa 8**

### Napomene:
- **0x55**: Preambula - 7 okteta
- **0xD5**: SFD (Start Frame Delimiter) - 1 oktet

Nakon polja SFD pristižu okteti Ethernet okvira, koji su označeni sa `D0,...,D63`:
- **Destination MAC Address**: 6 okteta.
- **Source MAC Address**: 6 okteta.
- **EtherType/Length**: 2 okteta.
- **Payload (Data)**: 46 okteta (proizvoljno odabrana veličina).
- **FCS (Frame Check Sequence)**: 4 okteta.
  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ![slucaj_a)](https://github.com/user-attachments/assets/64a67d14-761a-4a7f-bfd0-a63d68707a1e)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Slika 2**: Wavedrom prikaz prijema okvira čija je dužina (u bajtima) djeljiva bez ostatka sa 8

### **b) Prijem okvira čija dužina (u bajtima) nije djeljiva bez ostatka sa 8:**

### Napomene:
- **0x55**: Preambula - 7 okteta
- **0xD5**: SFD (Start Frame Delimiter) - 1 oktet

Nakon polja SFD pristižu okteti Ethernet okvira, koji su označeni sa `D0,...,D83`:
- **Destination MAC Address**: 6 okteta.
- **Source MAC Address**: 6 okteta.
- **EtherType/Length**: 2 okteta.
- **Payload (Data)**: 66 okteta (proizvoljno odabrana veličina).
- **FCS (Frame Check Sequence)**: 4 okteta.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ![slucaj_b)](https://github.com/user-attachments/assets/f6960f52-6dcd-4796-8eeb-b21d559ec0cc)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Slika 3**: Wavedrom prikaz prijema okvira čija dužina (u bajtima) nije djeljiva bez ostatka sa 8

#### **2. Dizajnirati konačni automat koji upravlja tokom podataka kroz dati sklop**

Konačni automat se sastoji od 3 stanja: **IDLE**, **RECEIVING_PREAMBLE**, **RECEIVING_DATA**, **LAST_DATA**.

**`IDLE`**: predstavlja stanje mirovanja, gdje GMII interfejs čeka početak Ethernet okvira. Prelazak u naredno stanje dešava se kada signal `gmii_rxdv` postane '1', što označava da su dolazni podaci validni.

**`RECIEVING_PREAMBLE`**: predstavlja stanje u kojem se prima preambula Ethernet okvira. Kada GMII interfejs detektuje SFD (Start Frame Delimiter), odnosno bajt 0xD5, i signal `gmii_rxdv` ostane '1', prelazi se u stanje RECEIVING_DATA. 

**`RECIEVING_DATA`**: predstavlja stanje u kojem se obrađuju svi podaci Ethernet okvira. Sistem ostaje u ovom stanju sve dok je signal `gmii_rxdv` jednak '1', što označava da okvir još uvijek traje. Tokom ovog stanja vrijednost brojača `counter` se smanjuje sa svakim primljenim paketom, te se pri vrijednosti "000" resetuje i ponovo počinje sa brojanjem paketa. Ova dva uslova označavaju to da je na prijem stiglo 8 bita koji se zajedno šalju na izlaz. Kada se prijem okvira završi, odnosno kada `gmii_rxdv` postane '0' i kada `counter` izbroji posljednih 8 paketa, sistem prelazi stanje u LAST_DATA.

**`LAST_DATA`**: predstavlja stanje u kojem se obrađuje posljednih 8 bita primljenih podataka, te se nakon njihove obrade, sistem vraća u stanje IDLE.

![FSM_dijagram](https://github.com/user-attachments/assets/592f90c4-b247-462c-9331-c46302f40522)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**Slika 4**: FSM dijagram

### **3. *Register Transfer Level (RTL)* reprezentacije dizajna i *State Machine Viewer (STM)* verifikacija stanja automata**

FSM je konstruisan kroz tri odvojena procesa. Prvi proces je sekvencijalna logika, koja koristi clock signal za praćenje i promjenu stanja. Naredni proces predstavlja kombinatornu logiku, koja se koristi se za praćenje trenutnog stanja (IDLE, RECEIVING_PREAMBLE, RECEIVING_DATA, LAST_DATA), ali i za upravljanje promjenama između tih stanja na osnovu ulaznih signala i brojača. Treći proces sadrži logiku za izlaze, gdje se izlazni signali generišu na temelju trenutnog stanja FSM-a. 

RTL Viewer u Quartus-u pruža pregled *Register Transfer Level (RTL)* reprezentacije dizajna nakon uspješnog kompajliranja. Generiše se strukturni prikaz dizajna, prikazujući kako su elementi međusobno povezani na osnovu VHDL koda.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ![rtl_novi](https://github.com/user-attachments/assets/b8beacbb-9744-476a-ae67-bdfc082cc921)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  **Slika 5**: RTL prikaz dizajna


Korištenjem *State Machine Viewer-a* koji služi za vizualizaciju i analizu FSM-a implementiranog u VHDL-u, izvršena je grafička reprezentacija svih stanja i prelaza između njih. Sa ovim je izvršena validacija FSM dijagrama nacrtanog u draw.io (slika 4). 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ![FSM_quartus](https://github.com/user-attachments/assets/85d76dd6-ef94-4ce1-8ea5-66492a721d54)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Slika 6**: Vizualizacija FSM-a pomoću State Machine Viewer-a

### **4. Valni oblici simuliranih signala u ModelSim-u**  

Kreiran je testbench za slučaj čija je dužina (u bajtima) djeljiva bez ostatka sa 8, te za slučaj prijema okvira čija dužina (u bajtima) nije djeljiva bez ostatka sa 8. Pomoću ModelSim alata izvršena je verifikacija funkcionalnosti implementiranog GMII prijemnog interfejsa.


![a_slucaj](https://github.com/user-attachments/assets/39e90027-9e81-48ab-871b-4671b42a2a9a)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Slika 7**: Prikaz signala u ModelSim-u za prijem okvira čija je dužina (u bajtima) djeljiva bez ostatka sa 8


![b_slucaj](https://github.com/user-attachments/assets/1dfd9104-b123-449b-95b2-a9c03ff3fd66)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Slika 8**: Prikaz signala u ModelSim-u za prijem okvira čija dužina (u bajtima) nije djeljiva bez ostatka sa 8


## Literatura

[1] AMD, *GMII Reception*, PG047 Gigabit Ethernet PCS/PMA.  

[2] Intel, *Gigabit Media Independent Interface*, Intel FPGA Documentation.  

[3] Intel, *Avalon-ST Rx Interface*, Intel FPGA Documentation.  

[4] Kaljić E., (2024.), *Arhitekture paketskih čvorišta - Predavanje 7*.  

[5] IEEE Std 802.3-2022, *IEEE Standard for Ethernet*.

[6] Pong P. Chu (2006) *RTL hardware design using VHDL*, John Wiley & sons, Inc., New Jersey, USA.

[7] Chris Metcalf and Jim Semple, *Ethernet: Principles, Protocols, and Applications*, Prentice Hall, 2005.




