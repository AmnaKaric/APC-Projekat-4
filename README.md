# APC-Projekat-4
Projekat 4: GMII prijemni interfejs
Modelirati i implementirati GMII prijemni interfejs koji putem ulaznog GMII interfejsa prima
preambulu, SFD i oktete dolaznog Ethernet okvira, te na izlazni 64-bitni Avalon-ST interfejs
generiše dolazni Ethernet okvir (počinje odredišnom adresom a završava FCS poljem).


08.12.2024. prikaz signala u Wavedromu:
- Normalni režim rada:
{ signal: [
  { name: "gmii_rx_clk", wave: "p......................" },
  { name: "gmii_rxreset_n", wave: "01....................." },
  { name: "gmii_rxdv", wave: "01.........0..........."},
  { name: "gmii_rxer", wave: "0......................" },
  { name: "gmii_rxd", wave: "x2222222222xxxxxxxxxxxx",data: ["8'h55", "8'hAB", "D1", "D2","D3","D4","D5","D6","D7","D8","x"] },
  { name: "rx_st_data", wave: "xxxxxxxxxxx22222222x...", data: ["D1", "D2","D3","D4","D5","D6","D7","D8","x"] },
  { name: "rx_st_sop", wave: "0..........10..........", },
  { name: "rx_st_eop", wave: "0.................10...", },
  { name: "rx_st_empty", wave: "..........22.......xx..", data: ["0"] },
  { name: "rx_st_valid", wave: "0..........1.......0...", },
  { name: "rx_st_ready", wave: "0..........10..........", },
  { name: "rx_st_err", wave: "0......................", }
]
 }



Napomene:
8'h55- preambula - 8'h ovo označava da je riječ o 8-bitnoj vrijednosti (1 bajt) prikazanoj u heksadecimalnom formatu; 55 - heksadecimalna vrijednost 55 u binarnom obliku je 01010101.
8'hAB - SFD (Start Frame Delimiter): 1 oktet (fiksna vrijednost 0xAB).
Nakon polja SFD pristižu okteti Ethernet okvira koji su označeni sa D1,..,D8:
-Destination MAC Address: 6 okteta.
-Source MAC Address: 6 okteta.
-EtherType/Length: 2 okteta.
-Payload (Data): 46 okteta (proizvoljno odabrana veličina).
-FCS (Frame Check Sequence): 4 okteta.


