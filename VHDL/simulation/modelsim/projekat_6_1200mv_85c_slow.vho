-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "02/02/2025 19:58:55"

-- 
-- Device: Altera EP4CE6F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	projekat IS
    PORT (
	gmii_rx_clk : IN std_logic;
	reset : IN std_logic;
	gmii_rxdv : IN std_logic;
	gmii_rxd : IN std_logic_vector(7 DOWNTO 0);
	avalon_clk : OUT std_logic;
	rx_st_data : OUT std_logic_vector(63 DOWNTO 0);
	rx_st_sop : OUT std_logic;
	rx_st_eop : OUT std_logic;
	rx_st_empty : OUT std_logic_vector(2 DOWNTO 0);
	rx_st_valid : OUT std_logic;
	rx_st_ready : IN std_logic
	);
END projekat;

-- Design Ports Information
-- avalon_clk	=>  Location: PIN_D3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[0]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[1]	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[2]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[3]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[4]	=>  Location: PIN_F6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[5]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[6]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[7]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[8]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[9]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[10]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[11]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[12]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[13]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[14]	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[15]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[16]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[17]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[18]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[19]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[20]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[21]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[22]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[23]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[24]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[25]	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[26]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[27]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[28]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[29]	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[30]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[31]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[32]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[33]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[34]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[35]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[36]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[37]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[38]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[39]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[40]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[41]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[42]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[43]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[44]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[45]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[46]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[47]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[48]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[49]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[50]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[51]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[52]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[53]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[54]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[55]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[56]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[57]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[58]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[59]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[60]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[61]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[62]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_data[63]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_sop	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_eop	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_empty[0]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_empty[1]	=>  Location: PIN_T2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_empty[2]	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_valid	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx_st_ready	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gmii_rx_clk	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gmii_rxdv	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gmii_rxd[0]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gmii_rxd[2]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gmii_rxd[1]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gmii_rxd[3]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gmii_rxd[4]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gmii_rxd[6]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gmii_rxd[7]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gmii_rxd[5]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF projekat IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_gmii_rx_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_gmii_rxdv : std_logic;
SIGNAL ww_gmii_rxd : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_avalon_clk : std_logic;
SIGNAL ww_rx_st_data : std_logic_vector(63 DOWNTO 0);
SIGNAL ww_rx_st_sop : std_logic;
SIGNAL ww_rx_st_eop : std_logic;
SIGNAL ww_rx_st_empty : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_rx_st_valid : std_logic;
SIGNAL ww_rx_st_ready : std_logic;
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \gmii_rx_clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rx_st_ready~input_o\ : std_logic;
SIGNAL \avalon_clk~output_o\ : std_logic;
SIGNAL \rx_st_data[0]~output_o\ : std_logic;
SIGNAL \rx_st_data[1]~output_o\ : std_logic;
SIGNAL \rx_st_data[2]~output_o\ : std_logic;
SIGNAL \rx_st_data[3]~output_o\ : std_logic;
SIGNAL \rx_st_data[4]~output_o\ : std_logic;
SIGNAL \rx_st_data[5]~output_o\ : std_logic;
SIGNAL \rx_st_data[6]~output_o\ : std_logic;
SIGNAL \rx_st_data[7]~output_o\ : std_logic;
SIGNAL \rx_st_data[8]~output_o\ : std_logic;
SIGNAL \rx_st_data[9]~output_o\ : std_logic;
SIGNAL \rx_st_data[10]~output_o\ : std_logic;
SIGNAL \rx_st_data[11]~output_o\ : std_logic;
SIGNAL \rx_st_data[12]~output_o\ : std_logic;
SIGNAL \rx_st_data[13]~output_o\ : std_logic;
SIGNAL \rx_st_data[14]~output_o\ : std_logic;
SIGNAL \rx_st_data[15]~output_o\ : std_logic;
SIGNAL \rx_st_data[16]~output_o\ : std_logic;
SIGNAL \rx_st_data[17]~output_o\ : std_logic;
SIGNAL \rx_st_data[18]~output_o\ : std_logic;
SIGNAL \rx_st_data[19]~output_o\ : std_logic;
SIGNAL \rx_st_data[20]~output_o\ : std_logic;
SIGNAL \rx_st_data[21]~output_o\ : std_logic;
SIGNAL \rx_st_data[22]~output_o\ : std_logic;
SIGNAL \rx_st_data[23]~output_o\ : std_logic;
SIGNAL \rx_st_data[24]~output_o\ : std_logic;
SIGNAL \rx_st_data[25]~output_o\ : std_logic;
SIGNAL \rx_st_data[26]~output_o\ : std_logic;
SIGNAL \rx_st_data[27]~output_o\ : std_logic;
SIGNAL \rx_st_data[28]~output_o\ : std_logic;
SIGNAL \rx_st_data[29]~output_o\ : std_logic;
SIGNAL \rx_st_data[30]~output_o\ : std_logic;
SIGNAL \rx_st_data[31]~output_o\ : std_logic;
SIGNAL \rx_st_data[32]~output_o\ : std_logic;
SIGNAL \rx_st_data[33]~output_o\ : std_logic;
SIGNAL \rx_st_data[34]~output_o\ : std_logic;
SIGNAL \rx_st_data[35]~output_o\ : std_logic;
SIGNAL \rx_st_data[36]~output_o\ : std_logic;
SIGNAL \rx_st_data[37]~output_o\ : std_logic;
SIGNAL \rx_st_data[38]~output_o\ : std_logic;
SIGNAL \rx_st_data[39]~output_o\ : std_logic;
SIGNAL \rx_st_data[40]~output_o\ : std_logic;
SIGNAL \rx_st_data[41]~output_o\ : std_logic;
SIGNAL \rx_st_data[42]~output_o\ : std_logic;
SIGNAL \rx_st_data[43]~output_o\ : std_logic;
SIGNAL \rx_st_data[44]~output_o\ : std_logic;
SIGNAL \rx_st_data[45]~output_o\ : std_logic;
SIGNAL \rx_st_data[46]~output_o\ : std_logic;
SIGNAL \rx_st_data[47]~output_o\ : std_logic;
SIGNAL \rx_st_data[48]~output_o\ : std_logic;
SIGNAL \rx_st_data[49]~output_o\ : std_logic;
SIGNAL \rx_st_data[50]~output_o\ : std_logic;
SIGNAL \rx_st_data[51]~output_o\ : std_logic;
SIGNAL \rx_st_data[52]~output_o\ : std_logic;
SIGNAL \rx_st_data[53]~output_o\ : std_logic;
SIGNAL \rx_st_data[54]~output_o\ : std_logic;
SIGNAL \rx_st_data[55]~output_o\ : std_logic;
SIGNAL \rx_st_data[56]~output_o\ : std_logic;
SIGNAL \rx_st_data[57]~output_o\ : std_logic;
SIGNAL \rx_st_data[58]~output_o\ : std_logic;
SIGNAL \rx_st_data[59]~output_o\ : std_logic;
SIGNAL \rx_st_data[60]~output_o\ : std_logic;
SIGNAL \rx_st_data[61]~output_o\ : std_logic;
SIGNAL \rx_st_data[62]~output_o\ : std_logic;
SIGNAL \rx_st_data[63]~output_o\ : std_logic;
SIGNAL \rx_st_sop~output_o\ : std_logic;
SIGNAL \rx_st_eop~output_o\ : std_logic;
SIGNAL \rx_st_empty[0]~output_o\ : std_logic;
SIGNAL \rx_st_empty[1]~output_o\ : std_logic;
SIGNAL \rx_st_empty[2]~output_o\ : std_logic;
SIGNAL \rx_st_valid~output_o\ : std_logic;
SIGNAL \gmii_rx_clk~input_o\ : std_logic;
SIGNAL \gmii_rx_clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \clk_counter[0]~2_combout\ : std_logic;
SIGNAL \clk_counter[1]~0_combout\ : std_logic;
SIGNAL \clk_counter[2]~3_combout\ : std_logic;
SIGNAL \fsm~0_combout\ : std_logic;
SIGNAL \avalon_clk~reg0_q\ : std_logic;
SIGNAL \gmii_rxdv~input_o\ : std_logic;
SIGNAL \counter~6_combout\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \counter~5_combout\ : std_logic;
SIGNAL \counter~4_combout\ : std_logic;
SIGNAL \gmii_rxd[2]~input_o\ : std_logic;
SIGNAL \gmii_rxd[0]~input_o\ : std_logic;
SIGNAL \gmii_rxd[1]~input_o\ : std_logic;
SIGNAL \gmii_rxd[3]~input_o\ : std_logic;
SIGNAL \Selector2~1_combout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \Equal14~0_combout\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \Selector1~2_combout\ : std_logic;
SIGNAL \current_state.RECEIVING_PREAMBLE~q\ : std_logic;
SIGNAL \gmii_rxd[7]~input_o\ : std_logic;
SIGNAL \gmii_rxd[6]~input_o\ : std_logic;
SIGNAL \gmii_rxd[5]~input_o\ : std_logic;
SIGNAL \gmii_rxd[4]~input_o\ : std_logic;
SIGNAL \Selector2~2_combout\ : std_logic;
SIGNAL \Selector2~3_combout\ : std_logic;
SIGNAL \Selector2~4_combout\ : std_logic;
SIGNAL \current_state.RECEIVING_DATA~q\ : std_logic;
SIGNAL \sop_flag~0_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \Selector3~3_combout\ : std_logic;
SIGNAL \Selector3~2_combout\ : std_logic;
SIGNAL \rx_st_data~64_combout\ : std_logic;
SIGNAL \Selector3~4_combout\ : std_logic;
SIGNAL \current_state.LAST_DATA~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \current_state.IDLE~q\ : std_logic;
SIGNAL \int_data[0]~feeder_combout\ : std_logic;
SIGNAL \int_data[7]~0_combout\ : std_logic;
SIGNAL \out_data[0]~0_combout\ : std_logic;
SIGNAL \rx_st_data~0_combout\ : std_logic;
SIGNAL \int_data[1]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~1_combout\ : std_logic;
SIGNAL \int_data[2]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~2_combout\ : std_logic;
SIGNAL \rx_st_data~3_combout\ : std_logic;
SIGNAL \int_data[4]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~4_combout\ : std_logic;
SIGNAL \int_data[5]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~5_combout\ : std_logic;
SIGNAL \int_data[6]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~6_combout\ : std_logic;
SIGNAL \rx_st_data~7_combout\ : std_logic;
SIGNAL \int_data[8]~feeder_combout\ : std_logic;
SIGNAL \int_data[15]~1_combout\ : std_logic;
SIGNAL \rx_st_data~8_combout\ : std_logic;
SIGNAL \rx_st_data~9_combout\ : std_logic;
SIGNAL \int_data[10]~feeder_combout\ : std_logic;
SIGNAL \out_data[10]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~10_combout\ : std_logic;
SIGNAL \rx_st_data~11_combout\ : std_logic;
SIGNAL \int_data[12]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~12_combout\ : std_logic;
SIGNAL \int_data[13]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~13_combout\ : std_logic;
SIGNAL \rx_st_data~14_combout\ : std_logic;
SIGNAL \int_data[15]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~15_combout\ : std_logic;
SIGNAL \int_data[16]~feeder_combout\ : std_logic;
SIGNAL \int_data[16]~2_combout\ : std_logic;
SIGNAL \rx_st_data~16_combout\ : std_logic;
SIGNAL \rx_st_data~17_combout\ : std_logic;
SIGNAL \int_data[18]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~18_combout\ : std_logic;
SIGNAL \rx_st_data~19_combout\ : std_logic;
SIGNAL \int_data[20]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~20_combout\ : std_logic;
SIGNAL \rx_st_data~21_combout\ : std_logic;
SIGNAL \int_data[22]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~22_combout\ : std_logic;
SIGNAL \int_data[23]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~23_combout\ : std_logic;
SIGNAL \int_data[24]~feeder_combout\ : std_logic;
SIGNAL \int_data[29]~3_combout\ : std_logic;
SIGNAL \rx_st_data~24_combout\ : std_logic;
SIGNAL \int_data[25]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~25_combout\ : std_logic;
SIGNAL \rx_st_data~26_combout\ : std_logic;
SIGNAL \int_data[27]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~27_combout\ : std_logic;
SIGNAL \int_data[28]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~28_combout\ : std_logic;
SIGNAL \rx_st_data~29_combout\ : std_logic;
SIGNAL \int_data[30]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~30_combout\ : std_logic;
SIGNAL \rx_st_data~31_combout\ : std_logic;
SIGNAL \int_data[32]~feeder_combout\ : std_logic;
SIGNAL \int_data[33]~4_combout\ : std_logic;
SIGNAL \rx_st_data~32_combout\ : std_logic;
SIGNAL \rx_st_data~33_combout\ : std_logic;
SIGNAL \int_data[34]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~34_combout\ : std_logic;
SIGNAL \rx_st_data~35_combout\ : std_logic;
SIGNAL \int_data[36]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~36_combout\ : std_logic;
SIGNAL \rx_st_data~37_combout\ : std_logic;
SIGNAL \int_data[38]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~38_combout\ : std_logic;
SIGNAL \int_data[39]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~39_combout\ : std_logic;
SIGNAL \int_data[40]~feeder_combout\ : std_logic;
SIGNAL \int_data[46]~5_combout\ : std_logic;
SIGNAL \rx_st_data~40_combout\ : std_logic;
SIGNAL \rx_st_data~41_combout\ : std_logic;
SIGNAL \int_data[42]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~42_combout\ : std_logic;
SIGNAL \rx_st_data~43_combout\ : std_logic;
SIGNAL \int_data[44]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~44_combout\ : std_logic;
SIGNAL \int_data[45]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~45_combout\ : std_logic;
SIGNAL \rx_st_data~46_combout\ : std_logic;
SIGNAL \int_data[47]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~47_combout\ : std_logic;
SIGNAL \int_data[48]~feeder_combout\ : std_logic;
SIGNAL \int_data[55]~6_combout\ : std_logic;
SIGNAL \rx_st_data~48_combout\ : std_logic;
SIGNAL \rx_st_data~49_combout\ : std_logic;
SIGNAL \int_data[50]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~50_combout\ : std_logic;
SIGNAL \rx_st_data~51_combout\ : std_logic;
SIGNAL \int_data[52]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~52_combout\ : std_logic;
SIGNAL \rx_st_data~53_combout\ : std_logic;
SIGNAL \int_data[54]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~54_combout\ : std_logic;
SIGNAL \int_data[55]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~55_combout\ : std_logic;
SIGNAL \rx_st_data~56_combout\ : std_logic;
SIGNAL \rx_st_data~57_combout\ : std_logic;
SIGNAL \rx_st_data~58_combout\ : std_logic;
SIGNAL \rx_st_data~59_combout\ : std_logic;
SIGNAL \int_data[60]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~60_combout\ : std_logic;
SIGNAL \rx_st_data~61_combout\ : std_logic;
SIGNAL \int_data[62]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~62_combout\ : std_logic;
SIGNAL \int_data[63]~feeder_combout\ : std_logic;
SIGNAL \rx_st_data~63_combout\ : std_logic;
SIGNAL \packet_count[0]~86_combout\ : std_logic;
SIGNAL \packet_count[1]~31_combout\ : std_logic;
SIGNAL \packet_count[31]~55_combout\ : std_logic;
SIGNAL \packet_count[1]~32\ : std_logic;
SIGNAL \packet_count[2]~33_combout\ : std_logic;
SIGNAL \packet_count[2]~34\ : std_logic;
SIGNAL \packet_count[3]~35_combout\ : std_logic;
SIGNAL \sop_flag~6_combout\ : std_logic;
SIGNAL \packet_count[3]~36\ : std_logic;
SIGNAL \packet_count[4]~37_combout\ : std_logic;
SIGNAL \packet_count[4]~38\ : std_logic;
SIGNAL \packet_count[5]~39_combout\ : std_logic;
SIGNAL \packet_count[5]~40\ : std_logic;
SIGNAL \packet_count[6]~41_combout\ : std_logic;
SIGNAL \packet_count[6]~42\ : std_logic;
SIGNAL \packet_count[7]~43_combout\ : std_logic;
SIGNAL \sop_flag~7_combout\ : std_logic;
SIGNAL \packet_count[7]~44\ : std_logic;
SIGNAL \packet_count[8]~45_combout\ : std_logic;
SIGNAL \packet_count[8]~46\ : std_logic;
SIGNAL \packet_count[9]~47_combout\ : std_logic;
SIGNAL \packet_count[9]~48\ : std_logic;
SIGNAL \packet_count[10]~49_combout\ : std_logic;
SIGNAL \packet_count[10]~50\ : std_logic;
SIGNAL \packet_count[11]~51_combout\ : std_logic;
SIGNAL \packet_count[11]~52\ : std_logic;
SIGNAL \packet_count[12]~53_combout\ : std_logic;
SIGNAL \packet_count[12]~54\ : std_logic;
SIGNAL \packet_count[13]~56_combout\ : std_logic;
SIGNAL \packet_count[13]~57\ : std_logic;
SIGNAL \packet_count[14]~58_combout\ : std_logic;
SIGNAL \packet_count[14]~59\ : std_logic;
SIGNAL \packet_count[15]~60_combout\ : std_logic;
SIGNAL \packet_count[15]~61\ : std_logic;
SIGNAL \packet_count[16]~62_combout\ : std_logic;
SIGNAL \packet_count[16]~63\ : std_logic;
SIGNAL \packet_count[17]~64_combout\ : std_logic;
SIGNAL \packet_count[17]~65\ : std_logic;
SIGNAL \packet_count[18]~66_combout\ : std_logic;
SIGNAL \packet_count[18]~67\ : std_logic;
SIGNAL \packet_count[19]~68_combout\ : std_logic;
SIGNAL \packet_count[19]~69\ : std_logic;
SIGNAL \packet_count[20]~70_combout\ : std_logic;
SIGNAL \packet_count[20]~71\ : std_logic;
SIGNAL \packet_count[21]~72_combout\ : std_logic;
SIGNAL \packet_count[21]~73\ : std_logic;
SIGNAL \packet_count[22]~74_combout\ : std_logic;
SIGNAL \packet_count[22]~75\ : std_logic;
SIGNAL \packet_count[23]~76_combout\ : std_logic;
SIGNAL \packet_count[23]~77\ : std_logic;
SIGNAL \packet_count[24]~78_combout\ : std_logic;
SIGNAL \packet_count[24]~79\ : std_logic;
SIGNAL \packet_count[25]~80_combout\ : std_logic;
SIGNAL \packet_count[25]~81\ : std_logic;
SIGNAL \packet_count[26]~82_combout\ : std_logic;
SIGNAL \packet_count[26]~83\ : std_logic;
SIGNAL \packet_count[27]~84_combout\ : std_logic;
SIGNAL \packet_count[27]~85\ : std_logic;
SIGNAL \packet_count[28]~87_combout\ : std_logic;
SIGNAL \packet_count[28]~88\ : std_logic;
SIGNAL \packet_count[29]~89_combout\ : std_logic;
SIGNAL \packet_count[29]~90\ : std_logic;
SIGNAL \packet_count[30]~91_combout\ : std_logic;
SIGNAL \packet_count[30]~92\ : std_logic;
SIGNAL \packet_count[31]~93_combout\ : std_logic;
SIGNAL \sop_flag~9_combout\ : std_logic;
SIGNAL \sop_flag~8_combout\ : std_logic;
SIGNAL \sop_flag~10_combout\ : std_logic;
SIGNAL \sop_flag~1_combout\ : std_logic;
SIGNAL \sop_flag~3_combout\ : std_logic;
SIGNAL \sop_flag~2_combout\ : std_logic;
SIGNAL \sop_flag~4_combout\ : std_logic;
SIGNAL \sop_flag~5_combout\ : std_logic;
SIGNAL \sop_flag~11_combout\ : std_logic;
SIGNAL \sop_flag~q\ : std_logic;
SIGNAL \rx_st_sop~0_combout\ : std_logic;
SIGNAL packet_count : std_logic_vector(31 DOWNTO 0);
SIGNAL out_data : std_logic_vector(63 DOWNTO 0);
SIGNAL clk_counter : std_logic_vector(2 DOWNTO 0);
SIGNAL int_data : std_logic_vector(63 DOWNTO 0);
SIGNAL counter : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_rx_st_data~64_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_gmii_rx_clk <= gmii_rx_clk;
ww_reset <= reset;
ww_gmii_rxdv <= gmii_rxdv;
ww_gmii_rxd <= gmii_rxd;
avalon_clk <= ww_avalon_clk;
rx_st_data <= ww_rx_st_data;
rx_st_sop <= ww_rx_st_sop;
rx_st_eop <= ww_rx_st_eop;
rx_st_empty <= ww_rx_st_empty;
rx_st_valid <= ww_rx_st_valid;
ww_rx_st_ready <= rx_st_ready;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\gmii_rx_clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \gmii_rx_clk~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_rx_st_data~64_combout\ <= NOT \rx_st_data~64_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X1_Y24_N9
\avalon_clk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \avalon_clk~reg0_q\,
	devoe => ww_devoe,
	o => \avalon_clk~output_o\);

-- Location: IOOBUF_X11_Y24_N9
\rx_st_data[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~0_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[0]~output_o\);

-- Location: IOOBUF_X7_Y24_N2
\rx_st_data[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~1_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[1]~output_o\);

-- Location: IOOBUF_X16_Y24_N16
\rx_st_data[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~2_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[2]~output_o\);

-- Location: IOOBUF_X11_Y24_N23
\rx_st_data[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~3_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[3]~output_o\);

-- Location: IOOBUF_X11_Y24_N16
\rx_st_data[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~4_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[4]~output_o\);

-- Location: IOOBUF_X7_Y24_N16
\rx_st_data[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~5_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[5]~output_o\);

-- Location: IOOBUF_X7_Y24_N9
\rx_st_data[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~6_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[6]~output_o\);

-- Location: IOOBUF_X11_Y24_N2
\rx_st_data[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~7_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[7]~output_o\);

-- Location: IOOBUF_X32_Y24_N16
\rx_st_data[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~8_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[8]~output_o\);

-- Location: IOOBUF_X25_Y24_N16
\rx_st_data[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~9_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[9]~output_o\);

-- Location: IOOBUF_X34_Y19_N2
\rx_st_data[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~10_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[10]~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\rx_st_data[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~11_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[11]~output_o\);

-- Location: IOOBUF_X34_Y20_N2
\rx_st_data[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~12_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[12]~output_o\);

-- Location: IOOBUF_X30_Y24_N9
\rx_st_data[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~13_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[13]~output_o\);

-- Location: IOOBUF_X34_Y8_N23
\rx_st_data[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~14_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[14]~output_o\);

-- Location: IOOBUF_X34_Y20_N9
\rx_st_data[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~15_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[15]~output_o\);

-- Location: IOOBUF_X34_Y10_N2
\rx_st_data[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~16_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[16]~output_o\);

-- Location: IOOBUF_X34_Y11_N9
\rx_st_data[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~17_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[17]~output_o\);

-- Location: IOOBUF_X32_Y24_N23
\rx_st_data[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~18_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[18]~output_o\);

-- Location: IOOBUF_X25_Y0_N23
\rx_st_data[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~19_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[19]~output_o\);

-- Location: IOOBUF_X28_Y24_N2
\rx_st_data[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~20_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[20]~output_o\);

-- Location: IOOBUF_X34_Y17_N23
\rx_st_data[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~21_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[21]~output_o\);

-- Location: IOOBUF_X25_Y24_N23
\rx_st_data[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~22_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[22]~output_o\);

-- Location: IOOBUF_X34_Y17_N16
\rx_st_data[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~23_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[23]~output_o\);

-- Location: IOOBUF_X34_Y20_N16
\rx_st_data[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~24_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[24]~output_o\);

-- Location: IOOBUF_X34_Y9_N9
\rx_st_data[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~25_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[25]~output_o\);

-- Location: IOOBUF_X21_Y0_N23
\rx_st_data[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~26_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[26]~output_o\);

-- Location: IOOBUF_X23_Y24_N23
\rx_st_data[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~27_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[27]~output_o\);

-- Location: IOOBUF_X21_Y24_N2
\rx_st_data[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~28_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[28]~output_o\);

-- Location: IOOBUF_X0_Y19_N16
\rx_st_data[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~29_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[29]~output_o\);

-- Location: IOOBUF_X21_Y0_N16
\rx_st_data[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~30_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[30]~output_o\);

-- Location: IOOBUF_X21_Y0_N2
\rx_st_data[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~31_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[31]~output_o\);

-- Location: IOOBUF_X18_Y24_N9
\rx_st_data[32]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~32_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[32]~output_o\);

-- Location: IOOBUF_X30_Y24_N2
\rx_st_data[33]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~33_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[33]~output_o\);

-- Location: IOOBUF_X13_Y24_N9
\rx_st_data[34]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~34_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[34]~output_o\);

-- Location: IOOBUF_X18_Y24_N16
\rx_st_data[35]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~35_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[35]~output_o\);

-- Location: IOOBUF_X21_Y24_N16
\rx_st_data[36]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~36_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[36]~output_o\);

-- Location: IOOBUF_X25_Y24_N2
\rx_st_data[37]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~37_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[37]~output_o\);

-- Location: IOOBUF_X9_Y24_N9
\rx_st_data[38]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~38_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[38]~output_o\);

-- Location: IOOBUF_X21_Y24_N9
\rx_st_data[39]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~39_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[39]~output_o\);

-- Location: IOOBUF_X34_Y11_N2
\rx_st_data[40]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~40_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[40]~output_o\);

-- Location: IOOBUF_X28_Y24_N16
\rx_st_data[41]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~41_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[41]~output_o\);

-- Location: IOOBUF_X23_Y0_N2
\rx_st_data[42]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~42_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[42]~output_o\);

-- Location: IOOBUF_X28_Y24_N23
\rx_st_data[43]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~43_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[43]~output_o\);

-- Location: IOOBUF_X30_Y24_N23
\rx_st_data[44]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~44_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[44]~output_o\);

-- Location: IOOBUF_X34_Y10_N9
\rx_st_data[45]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~45_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[45]~output_o\);

-- Location: IOOBUF_X23_Y24_N9
\rx_st_data[46]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~46_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[46]~output_o\);

-- Location: IOOBUF_X23_Y0_N16
\rx_st_data[47]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~47_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[47]~output_o\);

-- Location: IOOBUF_X32_Y24_N9
\rx_st_data[48]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~48_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[48]~output_o\);

-- Location: IOOBUF_X34_Y17_N2
\rx_st_data[49]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~49_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[49]~output_o\);

-- Location: IOOBUF_X28_Y0_N16
\rx_st_data[50]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~50_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[50]~output_o\);

-- Location: IOOBUF_X28_Y24_N9
\rx_st_data[51]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~51_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[51]~output_o\);

-- Location: IOOBUF_X34_Y18_N2
\rx_st_data[52]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~52_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[52]~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\rx_st_data[53]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~53_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[53]~output_o\);

-- Location: IOOBUF_X5_Y24_N9
\rx_st_data[54]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~54_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[54]~output_o\);

-- Location: IOOBUF_X23_Y0_N9
\rx_st_data[55]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~55_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[55]~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\rx_st_data[56]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~56_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[56]~output_o\);

-- Location: IOOBUF_X9_Y24_N16
\rx_st_data[57]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~57_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[57]~output_o\);

-- Location: IOOBUF_X5_Y24_N2
\rx_st_data[58]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~58_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[58]~output_o\);

-- Location: IOOBUF_X13_Y24_N23
\rx_st_data[59]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~59_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[59]~output_o\);

-- Location: IOOBUF_X5_Y24_N16
\rx_st_data[60]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~60_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[60]~output_o\);

-- Location: IOOBUF_X13_Y24_N2
\rx_st_data[61]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~61_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[61]~output_o\);

-- Location: IOOBUF_X9_Y24_N23
\rx_st_data[62]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~62_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[62]~output_o\);

-- Location: IOOBUF_X13_Y24_N16
\rx_st_data[63]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_data~63_combout\,
	devoe => ww_devoe,
	o => \rx_st_data[63]~output_o\);

-- Location: IOOBUF_X3_Y24_N23
\rx_st_sop~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rx_st_sop~0_combout\,
	devoe => ww_devoe,
	o => \rx_st_sop~output_o\);

-- Location: IOOBUF_X18_Y24_N23
\rx_st_eop~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \current_state.LAST_DATA~q\,
	devoe => ww_devoe,
	o => \rx_st_eop~output_o\);

-- Location: IOOBUF_X7_Y0_N2
\rx_st_empty[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \rx_st_empty[0]~output_o\);

-- Location: IOOBUF_X3_Y0_N2
\rx_st_empty[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \rx_st_empty[1]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\rx_st_empty[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \rx_st_empty[2]~output_o\);

-- Location: IOOBUF_X0_Y19_N2
\rx_st_valid~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rx_st_data~64_combout\,
	devoe => ww_devoe,
	o => \rx_st_valid~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\gmii_rx_clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_gmii_rx_clk,
	o => \gmii_rx_clk~input_o\);

-- Location: CLKCTRL_G2
\gmii_rx_clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \gmii_rx_clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \gmii_rx_clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y11_N15
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LCCOMB_X2_Y20_N4
\clk_counter[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[0]~2_combout\ = !clk_counter(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => clk_counter(0),
	combout => \clk_counter[0]~2_combout\);

-- Location: FF_X2_Y20_N5
\clk_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \clk_counter[0]~2_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(0));

-- Location: LCCOMB_X2_Y20_N30
\clk_counter[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[1]~0_combout\ = clk_counter(1) $ (((!\reset~input_o\ & !clk_counter(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => clk_counter(1),
	datad => clk_counter(0),
	combout => \clk_counter[1]~0_combout\);

-- Location: FF_X2_Y20_N31
\clk_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \clk_counter[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(1));

-- Location: LCCOMB_X2_Y20_N6
\clk_counter[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \clk_counter[2]~3_combout\ = !\fsm~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fsm~0_combout\,
	combout => \clk_counter[2]~3_combout\);

-- Location: FF_X2_Y20_N7
\clk_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \clk_counter[2]~3_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => clk_counter(2));

-- Location: LCCOMB_X2_Y20_N28
\fsm~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm~0_combout\ = clk_counter(2) $ (((clk_counter(1)) # (clk_counter(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => clk_counter(1),
	datac => clk_counter(0),
	datad => clk_counter(2),
	combout => \fsm~0_combout\);

-- Location: FF_X2_Y20_N29
\avalon_clk~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \fsm~0_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \avalon_clk~reg0_q\);

-- Location: IOIBUF_X16_Y24_N22
\gmii_rxdv~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_gmii_rxdv,
	o => \gmii_rxdv~input_o\);

-- Location: LCCOMB_X19_Y20_N2
\counter~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter~6_combout\ = (\current_state.IDLE~q\ & !counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => counter(0),
	combout => \counter~6_combout\);

-- Location: CLKCTRL_G4
\reset~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: FF_X19_Y20_N3
\counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \counter~6_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(0));

-- Location: LCCOMB_X19_Y20_N4
\counter~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter~5_combout\ = (\current_state.IDLE~q\ & (counter(1) $ (counter(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => counter(1),
	datad => counter(0),
	combout => \counter~5_combout\);

-- Location: FF_X19_Y20_N5
\counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \counter~5_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(1));

-- Location: LCCOMB_X19_Y20_N22
\counter~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter~4_combout\ = (\current_state.IDLE~q\ & (counter(2) $ (((counter(1) & counter(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datab => counter(1),
	datac => counter(2),
	datad => counter(0),
	combout => \counter~4_combout\);

-- Location: FF_X19_Y20_N23
\counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \counter~4_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => counter(2));

-- Location: IOIBUF_X16_Y24_N8
\gmii_rxd[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_gmii_rxd(2),
	o => \gmii_rxd[2]~input_o\);

-- Location: IOIBUF_X16_Y24_N1
\gmii_rxd[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_gmii_rxd(0),
	o => \gmii_rxd[0]~input_o\);

-- Location: IOIBUF_X0_Y21_N22
\gmii_rxd[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_gmii_rxd(1),
	o => \gmii_rxd[1]~input_o\);

-- Location: IOIBUF_X34_Y19_N8
\gmii_rxd[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_gmii_rxd(3),
	o => \gmii_rxd[3]~input_o\);

-- Location: LCCOMB_X18_Y20_N26
\Selector2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~1_combout\ = (\gmii_rxd[2]~input_o\ & (\gmii_rxd[0]~input_o\ & (!\gmii_rxd[1]~input_o\ & !\gmii_rxd[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gmii_rxd[2]~input_o\,
	datab => \gmii_rxd[0]~input_o\,
	datac => \gmii_rxd[1]~input_o\,
	datad => \gmii_rxd[3]~input_o\,
	combout => \Selector2~1_combout\);

-- Location: LCCOMB_X18_Y20_N10
\Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\gmii_rxdv~input_o\ & !\current_state.IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gmii_rxdv~input_o\,
	datad => \current_state.IDLE~q\,
	combout => \Selector1~0_combout\);

-- Location: LCCOMB_X19_Y20_N18
\Equal14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal14~0_combout\ = (counter(2) & (counter(1) & counter(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(2),
	datac => counter(1),
	datad => counter(0),
	combout => \Equal14~0_combout\);

-- Location: LCCOMB_X18_Y20_N24
\Selector1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = ((!\current_state.LAST_DATA~q\ & ((\gmii_rxdv~input_o\) # (!\current_state.RECEIVING_DATA~q\)))) # (!\Equal14~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gmii_rxdv~input_o\,
	datab => \current_state.LAST_DATA~q\,
	datac => \current_state.RECEIVING_DATA~q\,
	datad => \Equal14~0_combout\,
	combout => \Selector1~1_combout\);

-- Location: LCCOMB_X18_Y20_N2
\Selector1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~2_combout\ = (!\Selector2~3_combout\ & ((\Selector1~0_combout\) # ((\current_state.RECEIVING_PREAMBLE~q\ & \Selector1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector1~0_combout\,
	datab => \Selector2~3_combout\,
	datac => \current_state.RECEIVING_PREAMBLE~q\,
	datad => \Selector1~1_combout\,
	combout => \Selector1~2_combout\);

-- Location: FF_X18_Y20_N3
\current_state.RECEIVING_PREAMBLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \Selector1~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.RECEIVING_PREAMBLE~q\);

-- Location: IOIBUF_X34_Y18_N15
\gmii_rxd[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_gmii_rxd(7),
	o => \gmii_rxd[7]~input_o\);

-- Location: IOIBUF_X0_Y19_N22
\gmii_rxd[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_gmii_rxd(6),
	o => \gmii_rxd[6]~input_o\);

-- Location: IOIBUF_X25_Y24_N8
\gmii_rxd[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_gmii_rxd(5),
	o => \gmii_rxd[5]~input_o\);

-- Location: IOIBUF_X34_Y19_N15
\gmii_rxd[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_gmii_rxd(4),
	o => \gmii_rxd[4]~input_o\);

-- Location: LCCOMB_X17_Y20_N12
\Selector2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~2_combout\ = (\gmii_rxd[7]~input_o\ & (\gmii_rxd[6]~input_o\ & (!\gmii_rxd[5]~input_o\ & \gmii_rxd[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gmii_rxd[7]~input_o\,
	datab => \gmii_rxd[6]~input_o\,
	datac => \gmii_rxd[5]~input_o\,
	datad => \gmii_rxd[4]~input_o\,
	combout => \Selector2~2_combout\);

-- Location: LCCOMB_X18_Y20_N20
\Selector2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~3_combout\ = (\Selector2~1_combout\ & (\current_state.RECEIVING_PREAMBLE~q\ & \Selector2~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector2~1_combout\,
	datab => \current_state.RECEIVING_PREAMBLE~q\,
	datad => \Selector2~2_combout\,
	combout => \Selector2~3_combout\);

-- Location: LCCOMB_X19_Y20_N10
\Selector2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~4_combout\ = (\Selector2~3_combout\) # ((\current_state.RECEIVING_DATA~q\ & ((\gmii_rxdv~input_o\) # (!\Equal14~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gmii_rxdv~input_o\,
	datab => \Selector2~3_combout\,
	datac => \current_state.RECEIVING_DATA~q\,
	datad => \Equal14~0_combout\,
	combout => \Selector2~4_combout\);

-- Location: FF_X19_Y20_N11
\current_state.RECEIVING_DATA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \Selector2~4_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.RECEIVING_DATA~q\);

-- Location: LCCOMB_X19_Y20_N20
\sop_flag~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sop_flag~0_combout\ = (counter(2) & (counter(0) & (counter(1) & \current_state.RECEIVING_DATA~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(2),
	datab => counter(0),
	datac => counter(1),
	datad => \current_state.RECEIVING_DATA~q\,
	combout => \sop_flag~0_combout\);

-- Location: LCCOMB_X18_Y20_N30
\Selector3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (!\current_state.LAST_DATA~q\ & (!\gmii_rxdv~input_o\ & \sop_flag~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.LAST_DATA~q\,
	datac => \gmii_rxdv~input_o\,
	datad => \sop_flag~0_combout\,
	combout => \Selector3~1_combout\);

-- Location: LCCOMB_X18_Y20_N18
\Selector3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~3_combout\ = (\current_state.RECEIVING_PREAMBLE~q\ & (((!\Selector2~1_combout\)) # (!\Selector2~2_combout\))) # (!\current_state.RECEIVING_PREAMBLE~q\ & (((!\gmii_rxdv~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector2~2_combout\,
	datab => \gmii_rxdv~input_o\,
	datac => \Selector2~1_combout\,
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \Selector3~3_combout\);

-- Location: LCCOMB_X18_Y20_N8
\Selector3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~2_combout\ = (\current_state.LAST_DATA~q\ & (((!counter(2)) # (!counter(1))) # (!counter(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(0),
	datab => \current_state.LAST_DATA~q\,
	datac => counter(1),
	datad => counter(2),
	combout => \Selector3~2_combout\);

-- Location: LCCOMB_X19_Y20_N24
\rx_st_data~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~64_combout\ = (\current_state.RECEIVING_PREAMBLE~q\) # (!\current_state.IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state.IDLE~q\,
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~64_combout\);

-- Location: LCCOMB_X18_Y20_N4
\Selector3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~4_combout\ = (\Selector3~1_combout\) # ((\Selector3~2_combout\ & ((\Selector3~3_combout\) # (!\rx_st_data~64_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector3~1_combout\,
	datab => \Selector3~3_combout\,
	datac => \Selector3~2_combout\,
	datad => \rx_st_data~64_combout\,
	combout => \Selector3~4_combout\);

-- Location: FF_X18_Y20_N5
\current_state.LAST_DATA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \Selector3~4_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.LAST_DATA~q\);

-- Location: LCCOMB_X18_Y20_N16
\Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\gmii_rxdv~input_o\ & (((!\Equal14~0_combout\)) # (!\current_state.LAST_DATA~q\))) # (!\gmii_rxdv~input_o\ & (\current_state.IDLE~q\ & ((!\Equal14~0_combout\) # (!\current_state.LAST_DATA~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gmii_rxdv~input_o\,
	datab => \current_state.LAST_DATA~q\,
	datac => \current_state.IDLE~q\,
	datad => \Equal14~0_combout\,
	combout => \Selector0~0_combout\);

-- Location: FF_X18_Y20_N17
\current_state.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \Selector0~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.IDLE~q\);

-- Location: LCCOMB_X16_Y20_N16
\int_data[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[0]~feeder_combout\ = \gmii_rxd[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[0]~input_o\,
	combout => \int_data[0]~feeder_combout\);

-- Location: LCCOMB_X19_Y20_N8
\int_data[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[7]~0_combout\ = (\current_state.RECEIVING_DATA~q\ & (counter(1) & (counter(2) & !counter(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.RECEIVING_DATA~q\,
	datab => counter(1),
	datac => counter(2),
	datad => counter(0),
	combout => \int_data[7]~0_combout\);

-- Location: FF_X16_Y20_N17
\int_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[0]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(0));

-- Location: LCCOMB_X19_Y20_N12
\out_data[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \out_data[0]~0_combout\ = (!\reset~input_o\ & \sop_flag~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \sop_flag~0_combout\,
	combout => \out_data[0]~0_combout\);

-- Location: FF_X16_Y20_N13
\out_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(0),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(0));

-- Location: LCCOMB_X16_Y20_N12
\rx_st_data~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~0_combout\ = (\current_state.IDLE~q\ & (!\current_state.RECEIVING_PREAMBLE~q\ & out_data(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datab => \current_state.RECEIVING_PREAMBLE~q\,
	datac => out_data(0),
	combout => \rx_st_data~0_combout\);

-- Location: LCCOMB_X16_Y20_N22
\int_data[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[1]~feeder_combout\ = \gmii_rxd[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[1]~input_o\,
	combout => \int_data[1]~feeder_combout\);

-- Location: FF_X16_Y20_N23
\int_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(1));

-- Location: FF_X16_Y20_N1
\out_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(1),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(1));

-- Location: LCCOMB_X16_Y20_N0
\rx_st_data~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~1_combout\ = (\current_state.IDLE~q\ & (!\current_state.RECEIVING_PREAMBLE~q\ & out_data(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datab => \current_state.RECEIVING_PREAMBLE~q\,
	datac => out_data(1),
	combout => \rx_st_data~1_combout\);

-- Location: LCCOMB_X16_Y20_N8
\int_data[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[2]~feeder_combout\ = \gmii_rxd[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[2]~input_o\,
	combout => \int_data[2]~feeder_combout\);

-- Location: FF_X16_Y20_N9
\int_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[2]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(2));

-- Location: FF_X16_Y20_N3
\out_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(2),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(2));

-- Location: LCCOMB_X16_Y20_N2
\rx_st_data~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~2_combout\ = (\current_state.IDLE~q\ & (!\current_state.RECEIVING_PREAMBLE~q\ & out_data(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datab => \current_state.RECEIVING_PREAMBLE~q\,
	datac => out_data(2),
	combout => \rx_st_data~2_combout\);

-- Location: FF_X16_Y20_N15
\int_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(3));

-- Location: FF_X16_Y20_N29
\out_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(3),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(3));

-- Location: LCCOMB_X16_Y20_N28
\rx_st_data~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~3_combout\ = (\current_state.IDLE~q\ & (!\current_state.RECEIVING_PREAMBLE~q\ & out_data(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datab => \current_state.RECEIVING_PREAMBLE~q\,
	datac => out_data(3),
	combout => \rx_st_data~3_combout\);

-- Location: LCCOMB_X16_Y20_N30
\int_data[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[4]~feeder_combout\ = \gmii_rxd[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[4]~input_o\,
	combout => \int_data[4]~feeder_combout\);

-- Location: FF_X16_Y20_N31
\int_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[4]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(4));

-- Location: FF_X16_Y20_N21
\out_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(4),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(4));

-- Location: LCCOMB_X16_Y20_N20
\rx_st_data~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~4_combout\ = (\current_state.IDLE~q\ & (!\current_state.RECEIVING_PREAMBLE~q\ & out_data(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datab => \current_state.RECEIVING_PREAMBLE~q\,
	datac => out_data(4),
	combout => \rx_st_data~4_combout\);

-- Location: LCCOMB_X16_Y20_N4
\int_data[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[5]~feeder_combout\ = \gmii_rxd[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[5]~input_o\,
	combout => \int_data[5]~feeder_combout\);

-- Location: FF_X16_Y20_N5
\int_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[5]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(5));

-- Location: FF_X16_Y20_N25
\out_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(5),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(5));

-- Location: LCCOMB_X16_Y20_N24
\rx_st_data~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~5_combout\ = (\current_state.IDLE~q\ & (!\current_state.RECEIVING_PREAMBLE~q\ & out_data(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datab => \current_state.RECEIVING_PREAMBLE~q\,
	datac => out_data(5),
	combout => \rx_st_data~5_combout\);

-- Location: LCCOMB_X16_Y20_N18
\int_data[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[6]~feeder_combout\ = \gmii_rxd[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[6]~input_o\,
	combout => \int_data[6]~feeder_combout\);

-- Location: FF_X16_Y20_N19
\int_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[6]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(6));

-- Location: FF_X16_Y20_N7
\out_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(6),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(6));

-- Location: LCCOMB_X16_Y20_N6
\rx_st_data~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~6_combout\ = (\current_state.IDLE~q\ & (!\current_state.RECEIVING_PREAMBLE~q\ & out_data(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datab => \current_state.RECEIVING_PREAMBLE~q\,
	datac => out_data(6),
	combout => \rx_st_data~6_combout\);

-- Location: FF_X16_Y20_N27
\int_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(7));

-- Location: FF_X16_Y20_N11
\out_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(7),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(7));

-- Location: LCCOMB_X16_Y20_N10
\rx_st_data~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~7_combout\ = (\current_state.IDLE~q\ & (!\current_state.RECEIVING_PREAMBLE~q\ & out_data(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datab => \current_state.RECEIVING_PREAMBLE~q\,
	datac => out_data(7),
	combout => \rx_st_data~7_combout\);

-- Location: LCCOMB_X23_Y20_N16
\int_data[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[8]~feeder_combout\ = \gmii_rxd[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[0]~input_o\,
	combout => \int_data[8]~feeder_combout\);

-- Location: LCCOMB_X19_Y20_N6
\int_data[15]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[15]~1_combout\ = (\current_state.RECEIVING_DATA~q\ & (!counter(1) & (counter(2) & counter(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.RECEIVING_DATA~q\,
	datab => counter(1),
	datac => counter(2),
	datad => counter(0),
	combout => \int_data[15]~1_combout\);

-- Location: FF_X23_Y20_N17
\int_data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[8]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(8));

-- Location: FF_X24_Y20_N29
\out_data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(8),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(8));

-- Location: LCCOMB_X24_Y20_N28
\rx_st_data~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~8_combout\ = (\current_state.IDLE~q\ & (out_data(8) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.IDLE~q\,
	datac => out_data(8),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~8_combout\);

-- Location: FF_X23_Y20_N15
\int_data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(9));

-- Location: FF_X24_Y20_N3
\out_data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(9),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(9));

-- Location: LCCOMB_X24_Y20_N2
\rx_st_data~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~9_combout\ = (\current_state.IDLE~q\ & (out_data(9) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.IDLE~q\,
	datac => out_data(9),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~9_combout\);

-- Location: LCCOMB_X23_Y20_N12
\int_data[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[10]~feeder_combout\ = \gmii_rxd[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[2]~input_o\,
	combout => \int_data[10]~feeder_combout\);

-- Location: FF_X23_Y20_N13
\int_data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[10]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(10));

-- Location: LCCOMB_X24_Y20_N20
\out_data[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \out_data[10]~feeder_combout\ = int_data(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => int_data(10),
	combout => \out_data[10]~feeder_combout\);

-- Location: FF_X24_Y20_N21
\out_data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \out_data[10]~feeder_combout\,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(10));

-- Location: LCCOMB_X26_Y20_N12
\rx_st_data~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~10_combout\ = (\current_state.IDLE~q\ & (out_data(10) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(10),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~10_combout\);

-- Location: FF_X23_Y20_N7
\int_data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(11));

-- Location: FF_X24_Y20_N23
\out_data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(11),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(11));

-- Location: LCCOMB_X24_Y20_N22
\rx_st_data~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~11_combout\ = (\current_state.IDLE~q\ & (out_data(11) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.IDLE~q\,
	datac => out_data(11),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~11_combout\);

-- Location: LCCOMB_X23_Y20_N4
\int_data[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[12]~feeder_combout\ = \gmii_rxd[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[4]~input_o\,
	combout => \int_data[12]~feeder_combout\);

-- Location: FF_X23_Y20_N5
\int_data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[12]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(12));

-- Location: FF_X24_Y20_N13
\out_data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(12),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(12));

-- Location: LCCOMB_X24_Y20_N12
\rx_st_data~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~12_combout\ = (\current_state.IDLE~q\ & (out_data(12) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.IDLE~q\,
	datac => out_data(12),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~12_combout\);

-- Location: LCCOMB_X23_Y20_N30
\int_data[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[13]~feeder_combout\ = \gmii_rxd[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[5]~input_o\,
	combout => \int_data[13]~feeder_combout\);

-- Location: FF_X23_Y20_N31
\int_data[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[13]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(13));

-- Location: FF_X26_Y20_N19
\out_data[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(13),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(13));

-- Location: LCCOMB_X26_Y20_N18
\rx_st_data~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~13_combout\ = (\current_state.IDLE~q\ & (out_data(13) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(13),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~13_combout\);

-- Location: FF_X23_Y20_N29
\int_data[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(14));

-- Location: FF_X26_Y20_N9
\out_data[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(14),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(14));

-- Location: LCCOMB_X26_Y20_N8
\rx_st_data~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~14_combout\ = (\current_state.IDLE~q\ & (out_data(14) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(14),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~14_combout\);

-- Location: LCCOMB_X23_Y20_N10
\int_data[15]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[15]~feeder_combout\ = \gmii_rxd[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[7]~input_o\,
	combout => \int_data[15]~feeder_combout\);

-- Location: FF_X23_Y20_N11
\int_data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[15]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(15));

-- Location: FF_X22_Y20_N23
\out_data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(15),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(15));

-- Location: LCCOMB_X22_Y20_N22
\rx_st_data~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~15_combout\ = (\current_state.IDLE~q\ & (out_data(15) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(15),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~15_combout\);

-- Location: LCCOMB_X25_Y20_N28
\int_data[16]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[16]~feeder_combout\ = \gmii_rxd[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[0]~input_o\,
	combout => \int_data[16]~feeder_combout\);

-- Location: LCCOMB_X19_Y20_N28
\int_data[16]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[16]~2_combout\ = (counter(2) & (!counter(0) & (!counter(1) & \current_state.RECEIVING_DATA~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(2),
	datab => counter(0),
	datac => counter(1),
	datad => \current_state.RECEIVING_DATA~q\,
	combout => \int_data[16]~2_combout\);

-- Location: FF_X25_Y20_N29
\int_data[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[16]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[16]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(16));

-- Location: FF_X26_Y20_N11
\out_data[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(16),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(16));

-- Location: LCCOMB_X26_Y20_N10
\rx_st_data~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~16_combout\ = (\current_state.IDLE~q\ & (out_data(16) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(16),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~16_combout\);

-- Location: FF_X25_Y20_N7
\int_data[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[16]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(17));

-- Location: FF_X26_Y20_N29
\out_data[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(17),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(17));

-- Location: LCCOMB_X26_Y20_N28
\rx_st_data~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~17_combout\ = (\current_state.IDLE~q\ & (out_data(17) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(17),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~17_combout\);

-- Location: LCCOMB_X25_Y20_N16
\int_data[18]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[18]~feeder_combout\ = \gmii_rxd[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[2]~input_o\,
	combout => \int_data[18]~feeder_combout\);

-- Location: FF_X25_Y20_N17
\int_data[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[18]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[16]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(18));

-- Location: FF_X26_Y20_N31
\out_data[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(18),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(18));

-- Location: LCCOMB_X26_Y20_N30
\rx_st_data~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~18_combout\ = (\current_state.IDLE~q\ & (out_data(18) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(18),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~18_combout\);

-- Location: FF_X25_Y20_N31
\int_data[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[16]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(19));

-- Location: FF_X24_Y20_N15
\out_data[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(19),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(19));

-- Location: LCCOMB_X24_Y20_N14
\rx_st_data~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~19_combout\ = (\current_state.IDLE~q\ & (out_data(19) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.IDLE~q\,
	datac => out_data(19),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~19_combout\);

-- Location: LCCOMB_X25_Y20_N4
\int_data[20]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[20]~feeder_combout\ = \gmii_rxd[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[4]~input_o\,
	combout => \int_data[20]~feeder_combout\);

-- Location: FF_X25_Y20_N5
\int_data[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[20]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[16]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(20));

-- Location: FF_X26_Y20_N17
\out_data[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(20),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(20));

-- Location: LCCOMB_X26_Y20_N16
\rx_st_data~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~20_combout\ = (\current_state.IDLE~q\ & (out_data(20) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(20),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~20_combout\);

-- Location: FF_X25_Y20_N23
\int_data[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[16]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(21));

-- Location: FF_X26_Y20_N7
\out_data[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(21),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(21));

-- Location: LCCOMB_X26_Y20_N6
\rx_st_data~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~21_combout\ = (\current_state.IDLE~q\ & (out_data(21) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(21),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~21_combout\);

-- Location: LCCOMB_X25_Y20_N20
\int_data[22]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[22]~feeder_combout\ = \gmii_rxd[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[6]~input_o\,
	combout => \int_data[22]~feeder_combout\);

-- Location: FF_X25_Y20_N21
\int_data[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[22]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[16]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(22));

-- Location: FF_X24_Y20_N9
\out_data[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(22),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(22));

-- Location: LCCOMB_X24_Y20_N8
\rx_st_data~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~22_combout\ = (\current_state.IDLE~q\ & (out_data(22) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.IDLE~q\,
	datac => out_data(22),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~22_combout\);

-- Location: LCCOMB_X25_Y20_N18
\int_data[23]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[23]~feeder_combout\ = \gmii_rxd[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[7]~input_o\,
	combout => \int_data[23]~feeder_combout\);

-- Location: FF_X25_Y20_N19
\int_data[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[23]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[16]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(23));

-- Location: FF_X26_Y20_N25
\out_data[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(23),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(23));

-- Location: LCCOMB_X26_Y20_N24
\rx_st_data~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~23_combout\ = (\current_state.IDLE~q\ & (out_data(23) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(23),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~23_combout\);

-- Location: LCCOMB_X22_Y20_N20
\int_data[24]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[24]~feeder_combout\ = \gmii_rxd[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[0]~input_o\,
	combout => \int_data[24]~feeder_combout\);

-- Location: LCCOMB_X19_Y20_N26
\int_data[29]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[29]~3_combout\ = (\current_state.RECEIVING_DATA~q\ & (counter(1) & (!counter(2) & counter(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.RECEIVING_DATA~q\,
	datab => counter(1),
	datac => counter(2),
	datad => counter(0),
	combout => \int_data[29]~3_combout\);

-- Location: FF_X22_Y20_N21
\int_data[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[24]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[29]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(24));

-- Location: FF_X26_Y20_N15
\out_data[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(24),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(24));

-- Location: LCCOMB_X26_Y20_N14
\rx_st_data~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~24_combout\ = (\current_state.IDLE~q\ & (out_data(24) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(24),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~24_combout\);

-- Location: LCCOMB_X22_Y20_N2
\int_data[25]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[25]~feeder_combout\ = \gmii_rxd[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[1]~input_o\,
	combout => \int_data[25]~feeder_combout\);

-- Location: FF_X22_Y20_N3
\int_data[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[25]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[29]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(25));

-- Location: FF_X26_Y20_N1
\out_data[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(25),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(25));

-- Location: LCCOMB_X26_Y20_N0
\rx_st_data~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~25_combout\ = (\current_state.IDLE~q\ & (out_data(25) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(25),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~25_combout\);

-- Location: FF_X22_Y20_N25
\int_data[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[2]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[29]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(26));

-- Location: FF_X22_Y20_N29
\out_data[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(26),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(26));

-- Location: LCCOMB_X22_Y20_N28
\rx_st_data~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~26_combout\ = (\current_state.IDLE~q\ & (out_data(26) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(26),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~26_combout\);

-- Location: LCCOMB_X22_Y20_N14
\int_data[27]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[27]~feeder_combout\ = \gmii_rxd[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[3]~input_o\,
	combout => \int_data[27]~feeder_combout\);

-- Location: FF_X22_Y20_N15
\int_data[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[27]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[29]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(27));

-- Location: FF_X22_Y20_N19
\out_data[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(27),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(27));

-- Location: LCCOMB_X22_Y20_N18
\rx_st_data~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~27_combout\ = (\current_state.IDLE~q\ & (out_data(27) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(27),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~27_combout\);

-- Location: LCCOMB_X22_Y20_N26
\int_data[28]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[28]~feeder_combout\ = \gmii_rxd[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[4]~input_o\,
	combout => \int_data[28]~feeder_combout\);

-- Location: FF_X22_Y20_N27
\int_data[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[28]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[29]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(28));

-- Location: FF_X22_Y20_N11
\out_data[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(28),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(28));

-- Location: LCCOMB_X22_Y20_N10
\rx_st_data~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~28_combout\ = (\current_state.IDLE~q\ & (out_data(28) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(28),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~28_combout\);

-- Location: FF_X22_Y20_N5
\int_data[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[29]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(29));

-- Location: FF_X22_Y20_N17
\out_data[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(29),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(29));

-- Location: LCCOMB_X22_Y20_N16
\rx_st_data~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~29_combout\ = (\current_state.IDLE~q\ & (out_data(29) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(29),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~29_combout\);

-- Location: LCCOMB_X22_Y20_N12
\int_data[30]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[30]~feeder_combout\ = \gmii_rxd[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[6]~input_o\,
	combout => \int_data[30]~feeder_combout\);

-- Location: FF_X22_Y20_N13
\int_data[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[30]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[29]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(30));

-- Location: FF_X21_Y20_N29
\out_data[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(30),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(30));

-- Location: LCCOMB_X21_Y20_N28
\rx_st_data~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~30_combout\ = (\current_state.IDLE~q\ & (out_data(30) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(30),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~30_combout\);

-- Location: FF_X22_Y20_N9
\int_data[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[7]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[29]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(31));

-- Location: FF_X22_Y20_N7
\out_data[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(31),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(31));

-- Location: LCCOMB_X22_Y20_N6
\rx_st_data~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~31_combout\ = (\current_state.IDLE~q\ & (out_data(31) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(31),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~31_combout\);

-- Location: LCCOMB_X21_Y20_N30
\int_data[32]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[32]~feeder_combout\ = \gmii_rxd[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[0]~input_o\,
	combout => \int_data[32]~feeder_combout\);

-- Location: LCCOMB_X19_Y20_N16
\int_data[33]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[33]~4_combout\ = (\current_state.RECEIVING_DATA~q\ & (counter(1) & (!counter(2) & !counter(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.RECEIVING_DATA~q\,
	datab => counter(1),
	datac => counter(2),
	datad => counter(0),
	combout => \int_data[33]~4_combout\);

-- Location: FF_X21_Y20_N31
\int_data[32]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[32]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[33]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(32));

-- Location: FF_X21_Y20_N21
\out_data[32]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(32),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(32));

-- Location: LCCOMB_X21_Y20_N20
\rx_st_data~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~32_combout\ = (\current_state.IDLE~q\ & (out_data(32) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(32),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~32_combout\);

-- Location: FF_X21_Y20_N7
\int_data[33]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[33]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(33));

-- Location: FF_X24_Y20_N11
\out_data[33]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(33),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(33));

-- Location: LCCOMB_X24_Y20_N10
\rx_st_data~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~33_combout\ = (\current_state.IDLE~q\ & (out_data(33) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.IDLE~q\,
	datac => out_data(33),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~33_combout\);

-- Location: LCCOMB_X21_Y20_N26
\int_data[34]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[34]~feeder_combout\ = \gmii_rxd[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[2]~input_o\,
	combout => \int_data[34]~feeder_combout\);

-- Location: FF_X21_Y20_N27
\int_data[34]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[34]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[33]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(34));

-- Location: FF_X21_Y20_N3
\out_data[34]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(34),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(34));

-- Location: LCCOMB_X21_Y20_N2
\rx_st_data~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~34_combout\ = (\current_state.IDLE~q\ & (out_data(34) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(34),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~34_combout\);

-- Location: FF_X21_Y20_N9
\int_data[35]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[33]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(35));

-- Location: FF_X21_Y20_N11
\out_data[35]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(35),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(35));

-- Location: LCCOMB_X21_Y20_N10
\rx_st_data~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~35_combout\ = (\current_state.IDLE~q\ & (out_data(35) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(35),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~35_combout\);

-- Location: LCCOMB_X21_Y20_N4
\int_data[36]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[36]~feeder_combout\ = \gmii_rxd[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[4]~input_o\,
	combout => \int_data[36]~feeder_combout\);

-- Location: FF_X21_Y20_N5
\int_data[36]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[36]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[33]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(36));

-- Location: FF_X21_Y20_N1
\out_data[36]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(36),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(36));

-- Location: LCCOMB_X21_Y20_N0
\rx_st_data~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~36_combout\ = (\current_state.IDLE~q\ & (out_data(36) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(36),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~36_combout\);

-- Location: FF_X21_Y20_N17
\int_data[37]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[33]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(37));

-- Location: FF_X22_Y20_N1
\out_data[37]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(37),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(37));

-- Location: LCCOMB_X22_Y20_N0
\rx_st_data~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~37_combout\ = (\current_state.IDLE~q\ & (out_data(37) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(37),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~37_combout\);

-- Location: LCCOMB_X21_Y20_N22
\int_data[38]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[38]~feeder_combout\ = \gmii_rxd[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[6]~input_o\,
	combout => \int_data[38]~feeder_combout\);

-- Location: FF_X21_Y20_N23
\int_data[38]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[38]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[33]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(38));

-- Location: FF_X21_Y20_N25
\out_data[38]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(38),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(38));

-- Location: LCCOMB_X21_Y20_N24
\rx_st_data~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~38_combout\ = (\current_state.IDLE~q\ & (out_data(38) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(38),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~38_combout\);

-- Location: LCCOMB_X21_Y20_N14
\int_data[39]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[39]~feeder_combout\ = \gmii_rxd[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[7]~input_o\,
	combout => \int_data[39]~feeder_combout\);

-- Location: FF_X21_Y20_N15
\int_data[39]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[39]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[33]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(39));

-- Location: FF_X21_Y20_N19
\out_data[39]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(39),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(39));

-- Location: LCCOMB_X21_Y20_N18
\rx_st_data~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~39_combout\ = (\current_state.IDLE~q\ & (out_data(39) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(39),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~39_combout\);

-- Location: LCCOMB_X23_Y20_N8
\int_data[40]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[40]~feeder_combout\ = \gmii_rxd[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[0]~input_o\,
	combout => \int_data[40]~feeder_combout\);

-- Location: LCCOMB_X19_Y20_N14
\int_data[46]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[46]~5_combout\ = (\current_state.RECEIVING_DATA~q\ & (!counter(1) & (!counter(2) & counter(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.RECEIVING_DATA~q\,
	datab => counter(1),
	datac => counter(2),
	datad => counter(0),
	combout => \int_data[46]~5_combout\);

-- Location: FF_X23_Y20_N9
\int_data[40]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[40]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[46]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(40));

-- Location: FF_X22_Y20_N31
\out_data[40]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(40),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(40));

-- Location: LCCOMB_X23_Y19_N20
\rx_st_data~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~40_combout\ = (!\current_state.RECEIVING_PREAMBLE~q\ & (\current_state.IDLE~q\ & out_data(40)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.RECEIVING_PREAMBLE~q\,
	datac => \current_state.IDLE~q\,
	datad => out_data(40),
	combout => \rx_st_data~40_combout\);

-- Location: FF_X23_Y20_N23
\int_data[41]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[46]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(41));

-- Location: FF_X24_Y20_N1
\out_data[41]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(41),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(41));

-- Location: LCCOMB_X24_Y20_N0
\rx_st_data~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~41_combout\ = (\current_state.IDLE~q\ & (out_data(41) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.IDLE~q\,
	datac => out_data(41),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~41_combout\);

-- Location: LCCOMB_X23_Y20_N20
\int_data[42]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[42]~feeder_combout\ = \gmii_rxd[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[2]~input_o\,
	combout => \int_data[42]~feeder_combout\);

-- Location: FF_X23_Y20_N21
\int_data[42]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[42]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[46]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(42));

-- Location: FF_X24_Y20_N19
\out_data[42]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(42),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(42));

-- Location: LCCOMB_X24_Y20_N18
\rx_st_data~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~42_combout\ = (\current_state.IDLE~q\ & (out_data(42) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.IDLE~q\,
	datac => out_data(42),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~42_combout\);

-- Location: FF_X23_Y20_N27
\int_data[43]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[46]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(43));

-- Location: FF_X24_Y20_N17
\out_data[43]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(43),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(43));

-- Location: LCCOMB_X24_Y20_N16
\rx_st_data~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~43_combout\ = (\current_state.IDLE~q\ & (out_data(43) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.IDLE~q\,
	datac => out_data(43),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~43_combout\);

-- Location: LCCOMB_X23_Y20_N0
\int_data[44]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[44]~feeder_combout\ = \gmii_rxd[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[4]~input_o\,
	combout => \int_data[44]~feeder_combout\);

-- Location: FF_X23_Y20_N1
\int_data[44]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[44]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[46]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(44));

-- Location: FF_X24_Y20_N27
\out_data[44]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(44),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(44));

-- Location: LCCOMB_X24_Y20_N26
\rx_st_data~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~44_combout\ = (\current_state.IDLE~q\ & (out_data(44) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.IDLE~q\,
	datac => out_data(44),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~44_combout\);

-- Location: LCCOMB_X23_Y20_N18
\int_data[45]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[45]~feeder_combout\ = \gmii_rxd[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[5]~input_o\,
	combout => \int_data[45]~feeder_combout\);

-- Location: FF_X23_Y20_N19
\int_data[45]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[45]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[46]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(45));

-- Location: FF_X26_Y20_N3
\out_data[45]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(45),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(45));

-- Location: LCCOMB_X26_Y20_N2
\rx_st_data~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~45_combout\ = (\current_state.IDLE~q\ & (out_data(45) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(45),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~45_combout\);

-- Location: FF_X23_Y20_N25
\int_data[46]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[6]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[46]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(46));

-- Location: FF_X24_Y20_N5
\out_data[46]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(46),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(46));

-- Location: LCCOMB_X24_Y20_N4
\rx_st_data~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~46_combout\ = (\current_state.IDLE~q\ & (out_data(46) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.IDLE~q\,
	datac => out_data(46),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~46_combout\);

-- Location: LCCOMB_X23_Y20_N2
\int_data[47]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[47]~feeder_combout\ = \gmii_rxd[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[7]~input_o\,
	combout => \int_data[47]~feeder_combout\);

-- Location: FF_X23_Y20_N3
\int_data[47]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[47]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[46]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(47));

-- Location: FF_X19_Y20_N13
\out_data[47]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(47),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(47));

-- Location: LCCOMB_X23_Y19_N14
\rx_st_data~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~47_combout\ = (!\current_state.RECEIVING_PREAMBLE~q\ & (\current_state.IDLE~q\ & out_data(47)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.RECEIVING_PREAMBLE~q\,
	datac => \current_state.IDLE~q\,
	datad => out_data(47),
	combout => \rx_st_data~47_combout\);

-- Location: LCCOMB_X25_Y20_N12
\int_data[48]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[48]~feeder_combout\ = \gmii_rxd[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[0]~input_o\,
	combout => \int_data[48]~feeder_combout\);

-- Location: LCCOMB_X19_Y20_N0
\int_data[55]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[55]~6_combout\ = (!counter(2) & (!counter(0) & (!counter(1) & \current_state.RECEIVING_DATA~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => counter(2),
	datab => counter(0),
	datac => counter(1),
	datad => \current_state.RECEIVING_DATA~q\,
	combout => \int_data[55]~6_combout\);

-- Location: FF_X25_Y20_N13
\int_data[48]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[48]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[55]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(48));

-- Location: FF_X26_Y20_N21
\out_data[48]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(48),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(48));

-- Location: LCCOMB_X26_Y20_N20
\rx_st_data~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~48_combout\ = (\current_state.IDLE~q\ & (out_data(48) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(48),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~48_combout\);

-- Location: FF_X25_Y20_N3
\int_data[49]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[55]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(49));

-- Location: FF_X26_Y20_N23
\out_data[49]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(49),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(49));

-- Location: LCCOMB_X26_Y20_N22
\rx_st_data~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~49_combout\ = (\current_state.IDLE~q\ & (out_data(49) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(49),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~49_combout\);

-- Location: LCCOMB_X25_Y20_N8
\int_data[50]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[50]~feeder_combout\ = \gmii_rxd[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[2]~input_o\,
	combout => \int_data[50]~feeder_combout\);

-- Location: FF_X25_Y20_N9
\int_data[50]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[50]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[55]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(50));

-- Location: FF_X24_Y20_N7
\out_data[50]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(50),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(50));

-- Location: LCCOMB_X24_Y20_N6
\rx_st_data~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~50_combout\ = (\current_state.IDLE~q\ & (out_data(50) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.IDLE~q\,
	datac => out_data(50),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~50_combout\);

-- Location: FF_X25_Y20_N27
\int_data[51]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[55]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(51));

-- Location: FF_X26_Y20_N5
\out_data[51]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(51),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(51));

-- Location: LCCOMB_X26_Y20_N4
\rx_st_data~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~51_combout\ = (\current_state.IDLE~q\ & (out_data(51) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(51),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~51_combout\);

-- Location: LCCOMB_X25_Y20_N0
\int_data[52]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[52]~feeder_combout\ = \gmii_rxd[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[4]~input_o\,
	combout => \int_data[52]~feeder_combout\);

-- Location: FF_X25_Y20_N1
\int_data[52]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[52]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[55]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(52));

-- Location: FF_X26_Y20_N27
\out_data[52]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(52),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(52));

-- Location: LCCOMB_X26_Y20_N26
\rx_st_data~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~52_combout\ = (\current_state.IDLE~q\ & (out_data(52) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(52),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~52_combout\);

-- Location: FF_X25_Y20_N15
\int_data[53]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \int_data[55]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(53));

-- Location: FF_X24_Y20_N25
\out_data[53]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(53),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(53));

-- Location: LCCOMB_X24_Y20_N24
\rx_st_data~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~53_combout\ = (\current_state.IDLE~q\ & (out_data(53) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.IDLE~q\,
	datac => out_data(53),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~53_combout\);

-- Location: LCCOMB_X25_Y20_N24
\int_data[54]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[54]~feeder_combout\ = \gmii_rxd[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[6]~input_o\,
	combout => \int_data[54]~feeder_combout\);

-- Location: FF_X25_Y20_N25
\int_data[54]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[54]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[55]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(54));

-- Location: FF_X21_Y20_N13
\out_data[54]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(54),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(54));

-- Location: LCCOMB_X21_Y20_N12
\rx_st_data~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~54_combout\ = (\current_state.IDLE~q\ & (out_data(54) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(54),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~54_combout\);

-- Location: LCCOMB_X25_Y20_N10
\int_data[55]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[55]~feeder_combout\ = \gmii_rxd[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[7]~input_o\,
	combout => \int_data[55]~feeder_combout\);

-- Location: FF_X25_Y20_N11
\int_data[55]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[55]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \int_data[55]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(55));

-- Location: FF_X24_Y20_N31
\out_data[55]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(55),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(55));

-- Location: LCCOMB_X24_Y20_N30
\rx_st_data~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~55_combout\ = (\current_state.IDLE~q\ & (out_data(55) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.IDLE~q\,
	datac => out_data(55),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~55_combout\);

-- Location: FF_X18_Y20_N15
\int_data[56]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[0]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \sop_flag~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(56));

-- Location: FF_X17_Y20_N11
\out_data[56]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(56),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(56));

-- Location: LCCOMB_X17_Y20_N10
\rx_st_data~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~56_combout\ = (\current_state.IDLE~q\ & (out_data(56) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(56),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~56_combout\);

-- Location: FF_X18_Y20_N21
\int_data[57]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[1]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \sop_flag~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(57));

-- Location: FF_X17_Y20_N21
\out_data[57]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(57),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(57));

-- Location: LCCOMB_X17_Y20_N20
\rx_st_data~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~57_combout\ = (\current_state.IDLE~q\ & (out_data(57) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(57),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~57_combout\);

-- Location: FF_X17_Y20_N23
\int_data[58]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[2]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \sop_flag~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(58));

-- Location: FF_X17_Y20_N17
\out_data[58]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(58),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(58));

-- Location: LCCOMB_X17_Y20_N16
\rx_st_data~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~58_combout\ = (\current_state.IDLE~q\ & (out_data(58) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(58),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~58_combout\);

-- Location: FF_X18_Y20_N11
\int_data[59]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[3]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \sop_flag~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(59));

-- Location: FF_X17_Y20_N25
\out_data[59]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(59),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(59));

-- Location: LCCOMB_X17_Y20_N24
\rx_st_data~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~59_combout\ = (\current_state.IDLE~q\ & (out_data(59) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(59),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~59_combout\);

-- Location: LCCOMB_X17_Y20_N14
\int_data[60]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[60]~feeder_combout\ = \gmii_rxd[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[4]~input_o\,
	combout => \int_data[60]~feeder_combout\);

-- Location: FF_X17_Y20_N15
\int_data[60]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[60]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \sop_flag~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(60));

-- Location: FF_X17_Y20_N27
\out_data[60]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(60),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(60));

-- Location: LCCOMB_X17_Y20_N26
\rx_st_data~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~60_combout\ = (\current_state.IDLE~q\ & (out_data(60) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(60),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~60_combout\);

-- Location: FF_X17_Y20_N31
\int_data[61]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => \gmii_rxd[5]~input_o\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \sop_flag~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(61));

-- Location: FF_X17_Y20_N29
\out_data[61]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(61),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(61));

-- Location: LCCOMB_X17_Y20_N28
\rx_st_data~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~61_combout\ = (\current_state.IDLE~q\ & (out_data(61) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(61),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~61_combout\);

-- Location: LCCOMB_X17_Y20_N8
\int_data[62]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[62]~feeder_combout\ = \gmii_rxd[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[6]~input_o\,
	combout => \int_data[62]~feeder_combout\);

-- Location: FF_X17_Y20_N9
\int_data[62]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[62]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \sop_flag~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(62));

-- Location: FF_X17_Y20_N1
\out_data[62]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(62),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(62));

-- Location: LCCOMB_X17_Y20_N0
\rx_st_data~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~62_combout\ = (\current_state.IDLE~q\ & (out_data(62) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(62),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~62_combout\);

-- Location: LCCOMB_X17_Y20_N4
\int_data[63]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \int_data[63]~feeder_combout\ = \gmii_rxd[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gmii_rxd[7]~input_o\,
	combout => \int_data[63]~feeder_combout\);

-- Location: FF_X17_Y20_N5
\int_data[63]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \int_data[63]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \sop_flag~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => int_data(63));

-- Location: FF_X17_Y20_N19
\out_data[63]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	asdata => int_data(63),
	sload => VCC,
	ena => \out_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => out_data(63));

-- Location: LCCOMB_X17_Y20_N18
\rx_st_data~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_data~63_combout\ = (\current_state.IDLE~q\ & (out_data(63) & !\current_state.RECEIVING_PREAMBLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.IDLE~q\,
	datac => out_data(63),
	datad => \current_state.RECEIVING_PREAMBLE~q\,
	combout => \rx_st_data~63_combout\);

-- Location: LCCOMB_X18_Y22_N0
\packet_count[0]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[0]~86_combout\ = packet_count(0) $ (((!\reset~input_o\ & \current_state.RECEIVING_DATA~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => packet_count(0),
	datad => \current_state.RECEIVING_DATA~q\,
	combout => \packet_count[0]~86_combout\);

-- Location: FF_X18_Y22_N1
\packet_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[0]~86_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(0));

-- Location: LCCOMB_X18_Y22_N2
\packet_count[1]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[1]~31_combout\ = (packet_count(0) & (packet_count(1) $ (VCC))) # (!packet_count(0) & (packet_count(1) & VCC))
-- \packet_count[1]~32\ = CARRY((packet_count(0) & packet_count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(0),
	datab => packet_count(1),
	datad => VCC,
	combout => \packet_count[1]~31_combout\,
	cout => \packet_count[1]~32\);

-- Location: LCCOMB_X19_Y20_N30
\packet_count[31]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[31]~55_combout\ = (!\reset~input_o\ & \current_state.RECEIVING_DATA~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \current_state.RECEIVING_DATA~q\,
	combout => \packet_count[31]~55_combout\);

-- Location: FF_X18_Y22_N3
\packet_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[1]~31_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(1));

-- Location: LCCOMB_X18_Y22_N4
\packet_count[2]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[2]~33_combout\ = (packet_count(2) & (!\packet_count[1]~32\)) # (!packet_count(2) & ((\packet_count[1]~32\) # (GND)))
-- \packet_count[2]~34\ = CARRY((!\packet_count[1]~32\) # (!packet_count(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(2),
	datad => VCC,
	cin => \packet_count[1]~32\,
	combout => \packet_count[2]~33_combout\,
	cout => \packet_count[2]~34\);

-- Location: FF_X18_Y22_N5
\packet_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[2]~33_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(2));

-- Location: LCCOMB_X18_Y22_N6
\packet_count[3]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[3]~35_combout\ = (packet_count(3) & (\packet_count[2]~34\ $ (GND))) # (!packet_count(3) & (!\packet_count[2]~34\ & VCC))
-- \packet_count[3]~36\ = CARRY((packet_count(3) & !\packet_count[2]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(3),
	datad => VCC,
	cin => \packet_count[2]~34\,
	combout => \packet_count[3]~35_combout\,
	cout => \packet_count[3]~36\);

-- Location: FF_X18_Y22_N7
\packet_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[3]~35_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(3));

-- Location: LCCOMB_X17_Y22_N8
\sop_flag~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \sop_flag~6_combout\ = packet_count(3) $ (((packet_count(0)) # ((packet_count(1)) # (packet_count(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(3),
	datab => packet_count(0),
	datac => packet_count(1),
	datad => packet_count(2),
	combout => \sop_flag~6_combout\);

-- Location: LCCOMB_X18_Y22_N8
\packet_count[4]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[4]~37_combout\ = (packet_count(4) & (!\packet_count[3]~36\)) # (!packet_count(4) & ((\packet_count[3]~36\) # (GND)))
-- \packet_count[4]~38\ = CARRY((!\packet_count[3]~36\) # (!packet_count(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(4),
	datad => VCC,
	cin => \packet_count[3]~36\,
	combout => \packet_count[4]~37_combout\,
	cout => \packet_count[4]~38\);

-- Location: FF_X18_Y22_N9
\packet_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[4]~37_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(4));

-- Location: LCCOMB_X18_Y22_N10
\packet_count[5]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[5]~39_combout\ = (packet_count(5) & (\packet_count[4]~38\ $ (GND))) # (!packet_count(5) & (!\packet_count[4]~38\ & VCC))
-- \packet_count[5]~40\ = CARRY((packet_count(5) & !\packet_count[4]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(5),
	datad => VCC,
	cin => \packet_count[4]~38\,
	combout => \packet_count[5]~39_combout\,
	cout => \packet_count[5]~40\);

-- Location: FF_X18_Y22_N11
\packet_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[5]~39_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(5));

-- Location: LCCOMB_X18_Y22_N12
\packet_count[6]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[6]~41_combout\ = (packet_count(6) & (!\packet_count[5]~40\)) # (!packet_count(6) & ((\packet_count[5]~40\) # (GND)))
-- \packet_count[6]~42\ = CARRY((!\packet_count[5]~40\) # (!packet_count(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(6),
	datad => VCC,
	cin => \packet_count[5]~40\,
	combout => \packet_count[6]~41_combout\,
	cout => \packet_count[6]~42\);

-- Location: FF_X18_Y22_N13
\packet_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[6]~41_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(6));

-- Location: LCCOMB_X18_Y22_N14
\packet_count[7]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[7]~43_combout\ = (packet_count(7) & (\packet_count[6]~42\ $ (GND))) # (!packet_count(7) & (!\packet_count[6]~42\ & VCC))
-- \packet_count[7]~44\ = CARRY((packet_count(7) & !\packet_count[6]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(7),
	datad => VCC,
	cin => \packet_count[6]~42\,
	combout => \packet_count[7]~43_combout\,
	cout => \packet_count[7]~44\);

-- Location: FF_X18_Y22_N15
\packet_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[7]~43_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(7));

-- Location: LCCOMB_X18_Y19_N0
\sop_flag~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \sop_flag~7_combout\ = (!packet_count(4) & (!packet_count(5) & (!packet_count(6) & !packet_count(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(4),
	datab => packet_count(5),
	datac => packet_count(6),
	datad => packet_count(7),
	combout => \sop_flag~7_combout\);

-- Location: LCCOMB_X18_Y22_N16
\packet_count[8]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[8]~45_combout\ = (packet_count(8) & (!\packet_count[7]~44\)) # (!packet_count(8) & ((\packet_count[7]~44\) # (GND)))
-- \packet_count[8]~46\ = CARRY((!\packet_count[7]~44\) # (!packet_count(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(8),
	datad => VCC,
	cin => \packet_count[7]~44\,
	combout => \packet_count[8]~45_combout\,
	cout => \packet_count[8]~46\);

-- Location: FF_X18_Y22_N17
\packet_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[8]~45_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(8));

-- Location: LCCOMB_X18_Y22_N18
\packet_count[9]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[9]~47_combout\ = (packet_count(9) & (\packet_count[8]~46\ $ (GND))) # (!packet_count(9) & (!\packet_count[8]~46\ & VCC))
-- \packet_count[9]~48\ = CARRY((packet_count(9) & !\packet_count[8]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(9),
	datad => VCC,
	cin => \packet_count[8]~46\,
	combout => \packet_count[9]~47_combout\,
	cout => \packet_count[9]~48\);

-- Location: FF_X18_Y22_N19
\packet_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[9]~47_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(9));

-- Location: LCCOMB_X18_Y22_N20
\packet_count[10]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[10]~49_combout\ = (packet_count(10) & (!\packet_count[9]~48\)) # (!packet_count(10) & ((\packet_count[9]~48\) # (GND)))
-- \packet_count[10]~50\ = CARRY((!\packet_count[9]~48\) # (!packet_count(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(10),
	datad => VCC,
	cin => \packet_count[9]~48\,
	combout => \packet_count[10]~49_combout\,
	cout => \packet_count[10]~50\);

-- Location: FF_X18_Y22_N21
\packet_count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[10]~49_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(10));

-- Location: LCCOMB_X18_Y22_N22
\packet_count[11]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[11]~51_combout\ = (packet_count(11) & (\packet_count[10]~50\ $ (GND))) # (!packet_count(11) & (!\packet_count[10]~50\ & VCC))
-- \packet_count[11]~52\ = CARRY((packet_count(11) & !\packet_count[10]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(11),
	datad => VCC,
	cin => \packet_count[10]~50\,
	combout => \packet_count[11]~51_combout\,
	cout => \packet_count[11]~52\);

-- Location: FF_X18_Y22_N23
\packet_count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[11]~51_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(11));

-- Location: LCCOMB_X18_Y22_N24
\packet_count[12]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[12]~53_combout\ = (packet_count(12) & (!\packet_count[11]~52\)) # (!packet_count(12) & ((\packet_count[11]~52\) # (GND)))
-- \packet_count[12]~54\ = CARRY((!\packet_count[11]~52\) # (!packet_count(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(12),
	datad => VCC,
	cin => \packet_count[11]~52\,
	combout => \packet_count[12]~53_combout\,
	cout => \packet_count[12]~54\);

-- Location: FF_X18_Y22_N25
\packet_count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[12]~53_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(12));

-- Location: LCCOMB_X18_Y22_N26
\packet_count[13]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[13]~56_combout\ = (packet_count(13) & (\packet_count[12]~54\ $ (GND))) # (!packet_count(13) & (!\packet_count[12]~54\ & VCC))
-- \packet_count[13]~57\ = CARRY((packet_count(13) & !\packet_count[12]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(13),
	datad => VCC,
	cin => \packet_count[12]~54\,
	combout => \packet_count[13]~56_combout\,
	cout => \packet_count[13]~57\);

-- Location: FF_X18_Y22_N27
\packet_count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[13]~56_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(13));

-- Location: LCCOMB_X18_Y22_N28
\packet_count[14]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[14]~58_combout\ = (packet_count(14) & (!\packet_count[13]~57\)) # (!packet_count(14) & ((\packet_count[13]~57\) # (GND)))
-- \packet_count[14]~59\ = CARRY((!\packet_count[13]~57\) # (!packet_count(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(14),
	datad => VCC,
	cin => \packet_count[13]~57\,
	combout => \packet_count[14]~58_combout\,
	cout => \packet_count[14]~59\);

-- Location: FF_X18_Y22_N29
\packet_count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[14]~58_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(14));

-- Location: LCCOMB_X18_Y22_N30
\packet_count[15]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[15]~60_combout\ = (packet_count(15) & (\packet_count[14]~59\ $ (GND))) # (!packet_count(15) & (!\packet_count[14]~59\ & VCC))
-- \packet_count[15]~61\ = CARRY((packet_count(15) & !\packet_count[14]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(15),
	datad => VCC,
	cin => \packet_count[14]~59\,
	combout => \packet_count[15]~60_combout\,
	cout => \packet_count[15]~61\);

-- Location: FF_X18_Y22_N31
\packet_count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[15]~60_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(15));

-- Location: LCCOMB_X18_Y21_N0
\packet_count[16]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[16]~62_combout\ = (packet_count(16) & (!\packet_count[15]~61\)) # (!packet_count(16) & ((\packet_count[15]~61\) # (GND)))
-- \packet_count[16]~63\ = CARRY((!\packet_count[15]~61\) # (!packet_count(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(16),
	datad => VCC,
	cin => \packet_count[15]~61\,
	combout => \packet_count[16]~62_combout\,
	cout => \packet_count[16]~63\);

-- Location: FF_X18_Y21_N1
\packet_count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[16]~62_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(16));

-- Location: LCCOMB_X18_Y21_N2
\packet_count[17]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[17]~64_combout\ = (packet_count(17) & (\packet_count[16]~63\ $ (GND))) # (!packet_count(17) & (!\packet_count[16]~63\ & VCC))
-- \packet_count[17]~65\ = CARRY((packet_count(17) & !\packet_count[16]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(17),
	datad => VCC,
	cin => \packet_count[16]~63\,
	combout => \packet_count[17]~64_combout\,
	cout => \packet_count[17]~65\);

-- Location: FF_X18_Y21_N3
\packet_count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[17]~64_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(17));

-- Location: LCCOMB_X18_Y21_N4
\packet_count[18]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[18]~66_combout\ = (packet_count(18) & (!\packet_count[17]~65\)) # (!packet_count(18) & ((\packet_count[17]~65\) # (GND)))
-- \packet_count[18]~67\ = CARRY((!\packet_count[17]~65\) # (!packet_count(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(18),
	datad => VCC,
	cin => \packet_count[17]~65\,
	combout => \packet_count[18]~66_combout\,
	cout => \packet_count[18]~67\);

-- Location: FF_X18_Y21_N5
\packet_count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[18]~66_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(18));

-- Location: LCCOMB_X18_Y21_N6
\packet_count[19]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[19]~68_combout\ = (packet_count(19) & (\packet_count[18]~67\ $ (GND))) # (!packet_count(19) & (!\packet_count[18]~67\ & VCC))
-- \packet_count[19]~69\ = CARRY((packet_count(19) & !\packet_count[18]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(19),
	datad => VCC,
	cin => \packet_count[18]~67\,
	combout => \packet_count[19]~68_combout\,
	cout => \packet_count[19]~69\);

-- Location: FF_X18_Y21_N7
\packet_count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[19]~68_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(19));

-- Location: LCCOMB_X18_Y21_N8
\packet_count[20]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[20]~70_combout\ = (packet_count(20) & (!\packet_count[19]~69\)) # (!packet_count(20) & ((\packet_count[19]~69\) # (GND)))
-- \packet_count[20]~71\ = CARRY((!\packet_count[19]~69\) # (!packet_count(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(20),
	datad => VCC,
	cin => \packet_count[19]~69\,
	combout => \packet_count[20]~70_combout\,
	cout => \packet_count[20]~71\);

-- Location: FF_X18_Y21_N9
\packet_count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[20]~70_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(20));

-- Location: LCCOMB_X18_Y21_N10
\packet_count[21]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[21]~72_combout\ = (packet_count(21) & (\packet_count[20]~71\ $ (GND))) # (!packet_count(21) & (!\packet_count[20]~71\ & VCC))
-- \packet_count[21]~73\ = CARRY((packet_count(21) & !\packet_count[20]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(21),
	datad => VCC,
	cin => \packet_count[20]~71\,
	combout => \packet_count[21]~72_combout\,
	cout => \packet_count[21]~73\);

-- Location: FF_X18_Y21_N11
\packet_count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[21]~72_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(21));

-- Location: LCCOMB_X18_Y21_N12
\packet_count[22]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[22]~74_combout\ = (packet_count(22) & (!\packet_count[21]~73\)) # (!packet_count(22) & ((\packet_count[21]~73\) # (GND)))
-- \packet_count[22]~75\ = CARRY((!\packet_count[21]~73\) # (!packet_count(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(22),
	datad => VCC,
	cin => \packet_count[21]~73\,
	combout => \packet_count[22]~74_combout\,
	cout => \packet_count[22]~75\);

-- Location: FF_X18_Y21_N13
\packet_count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[22]~74_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(22));

-- Location: LCCOMB_X18_Y21_N14
\packet_count[23]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[23]~76_combout\ = (packet_count(23) & (\packet_count[22]~75\ $ (GND))) # (!packet_count(23) & (!\packet_count[22]~75\ & VCC))
-- \packet_count[23]~77\ = CARRY((packet_count(23) & !\packet_count[22]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(23),
	datad => VCC,
	cin => \packet_count[22]~75\,
	combout => \packet_count[23]~76_combout\,
	cout => \packet_count[23]~77\);

-- Location: FF_X18_Y21_N15
\packet_count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[23]~76_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(23));

-- Location: LCCOMB_X18_Y21_N16
\packet_count[24]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[24]~78_combout\ = (packet_count(24) & (!\packet_count[23]~77\)) # (!packet_count(24) & ((\packet_count[23]~77\) # (GND)))
-- \packet_count[24]~79\ = CARRY((!\packet_count[23]~77\) # (!packet_count(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(24),
	datad => VCC,
	cin => \packet_count[23]~77\,
	combout => \packet_count[24]~78_combout\,
	cout => \packet_count[24]~79\);

-- Location: FF_X18_Y21_N17
\packet_count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[24]~78_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(24));

-- Location: LCCOMB_X18_Y21_N18
\packet_count[25]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[25]~80_combout\ = (packet_count(25) & (\packet_count[24]~79\ $ (GND))) # (!packet_count(25) & (!\packet_count[24]~79\ & VCC))
-- \packet_count[25]~81\ = CARRY((packet_count(25) & !\packet_count[24]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(25),
	datad => VCC,
	cin => \packet_count[24]~79\,
	combout => \packet_count[25]~80_combout\,
	cout => \packet_count[25]~81\);

-- Location: FF_X18_Y21_N19
\packet_count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[25]~80_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(25));

-- Location: LCCOMB_X18_Y21_N20
\packet_count[26]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[26]~82_combout\ = (packet_count(26) & (!\packet_count[25]~81\)) # (!packet_count(26) & ((\packet_count[25]~81\) # (GND)))
-- \packet_count[26]~83\ = CARRY((!\packet_count[25]~81\) # (!packet_count(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(26),
	datad => VCC,
	cin => \packet_count[25]~81\,
	combout => \packet_count[26]~82_combout\,
	cout => \packet_count[26]~83\);

-- Location: FF_X18_Y21_N21
\packet_count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[26]~82_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(26));

-- Location: LCCOMB_X18_Y21_N22
\packet_count[27]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[27]~84_combout\ = (packet_count(27) & (\packet_count[26]~83\ $ (GND))) # (!packet_count(27) & (!\packet_count[26]~83\ & VCC))
-- \packet_count[27]~85\ = CARRY((packet_count(27) & !\packet_count[26]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(27),
	datad => VCC,
	cin => \packet_count[26]~83\,
	combout => \packet_count[27]~84_combout\,
	cout => \packet_count[27]~85\);

-- Location: FF_X18_Y21_N23
\packet_count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[27]~84_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(27));

-- Location: LCCOMB_X18_Y21_N24
\packet_count[28]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[28]~87_combout\ = (packet_count(28) & (!\packet_count[27]~85\)) # (!packet_count(28) & ((\packet_count[27]~85\) # (GND)))
-- \packet_count[28]~88\ = CARRY((!\packet_count[27]~85\) # (!packet_count(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(28),
	datad => VCC,
	cin => \packet_count[27]~85\,
	combout => \packet_count[28]~87_combout\,
	cout => \packet_count[28]~88\);

-- Location: FF_X18_Y21_N25
\packet_count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[28]~87_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(28));

-- Location: LCCOMB_X18_Y21_N26
\packet_count[29]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[29]~89_combout\ = (packet_count(29) & (\packet_count[28]~88\ $ (GND))) # (!packet_count(29) & (!\packet_count[28]~88\ & VCC))
-- \packet_count[29]~90\ = CARRY((packet_count(29) & !\packet_count[28]~88\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(29),
	datad => VCC,
	cin => \packet_count[28]~88\,
	combout => \packet_count[29]~89_combout\,
	cout => \packet_count[29]~90\);

-- Location: FF_X18_Y21_N27
\packet_count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[29]~89_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(29));

-- Location: LCCOMB_X18_Y21_N28
\packet_count[30]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[30]~91_combout\ = (packet_count(30) & (!\packet_count[29]~90\)) # (!packet_count(30) & ((\packet_count[29]~90\) # (GND)))
-- \packet_count[30]~92\ = CARRY((!\packet_count[29]~90\) # (!packet_count(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => packet_count(30),
	datad => VCC,
	cin => \packet_count[29]~90\,
	combout => \packet_count[30]~91_combout\,
	cout => \packet_count[30]~92\);

-- Location: FF_X18_Y21_N29
\packet_count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[30]~91_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(30));

-- Location: LCCOMB_X18_Y21_N30
\packet_count[31]~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \packet_count[31]~93_combout\ = packet_count(31) $ (!\packet_count[30]~92\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(31),
	cin => \packet_count[30]~92\,
	combout => \packet_count[31]~93_combout\);

-- Location: FF_X18_Y21_N31
\packet_count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \packet_count[31]~93_combout\,
	ena => \packet_count[31]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => packet_count(31));

-- Location: LCCOMB_X19_Y21_N24
\sop_flag~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \sop_flag~9_combout\ = (!packet_count(31) & (!packet_count(30) & (!packet_count(29) & !packet_count(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(31),
	datab => packet_count(30),
	datac => packet_count(29),
	datad => packet_count(28),
	combout => \sop_flag~9_combout\);

-- Location: LCCOMB_X19_Y22_N22
\sop_flag~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \sop_flag~8_combout\ = (!packet_count(8) & (!packet_count(9) & (!packet_count(10) & !packet_count(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(8),
	datab => packet_count(9),
	datac => packet_count(10),
	datad => packet_count(11),
	combout => \sop_flag~8_combout\);

-- Location: LCCOMB_X18_Y20_N12
\sop_flag~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \sop_flag~10_combout\ = (\sop_flag~6_combout\ & (\sop_flag~7_combout\ & (\sop_flag~9_combout\ & \sop_flag~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sop_flag~6_combout\,
	datab => \sop_flag~7_combout\,
	datac => \sop_flag~9_combout\,
	datad => \sop_flag~8_combout\,
	combout => \sop_flag~10_combout\);

-- Location: LCCOMB_X19_Y22_N20
\sop_flag~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sop_flag~1_combout\ = (!packet_count(13) & (!packet_count(15) & (!packet_count(12) & !packet_count(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(13),
	datab => packet_count(15),
	datac => packet_count(12),
	datad => packet_count(14),
	combout => \sop_flag~1_combout\);

-- Location: LCCOMB_X18_Y20_N28
\sop_flag~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \sop_flag~3_combout\ = (!packet_count(20) & (!packet_count(23) & (!packet_count(22) & !packet_count(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(20),
	datab => packet_count(23),
	datac => packet_count(22),
	datad => packet_count(21),
	combout => \sop_flag~3_combout\);

-- Location: LCCOMB_X18_Y20_N22
\sop_flag~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \sop_flag~2_combout\ = (!packet_count(19) & (!packet_count(16) & (!packet_count(17) & !packet_count(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(19),
	datab => packet_count(16),
	datac => packet_count(17),
	datad => packet_count(18),
	combout => \sop_flag~2_combout\);

-- Location: LCCOMB_X17_Y21_N8
\sop_flag~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \sop_flag~4_combout\ = (!packet_count(26) & (!packet_count(25) & (!packet_count(27) & !packet_count(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => packet_count(26),
	datab => packet_count(25),
	datac => packet_count(27),
	datad => packet_count(24),
	combout => \sop_flag~4_combout\);

-- Location: LCCOMB_X18_Y20_N6
\sop_flag~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \sop_flag~5_combout\ = (\sop_flag~1_combout\ & (\sop_flag~3_combout\ & (\sop_flag~2_combout\ & \sop_flag~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sop_flag~1_combout\,
	datab => \sop_flag~3_combout\,
	datac => \sop_flag~2_combout\,
	datad => \sop_flag~4_combout\,
	combout => \sop_flag~5_combout\);

-- Location: LCCOMB_X18_Y20_N0
\sop_flag~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \sop_flag~11_combout\ = (\sop_flag~0_combout\ & (\sop_flag~10_combout\ & ((\sop_flag~5_combout\)))) # (!\sop_flag~0_combout\ & (((\sop_flag~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sop_flag~10_combout\,
	datab => \sop_flag~0_combout\,
	datac => \sop_flag~q\,
	datad => \sop_flag~5_combout\,
	combout => \sop_flag~11_combout\);

-- Location: FF_X18_Y20_N1
sop_flag : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \gmii_rx_clk~inputclkctrl_outclk\,
	d => \sop_flag~11_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sop_flag~q\);

-- Location: LCCOMB_X18_Y20_N14
\rx_st_sop~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rx_st_sop~0_combout\ = (\current_state.RECEIVING_DATA~q\ & \sop_flag~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_state.RECEIVING_DATA~q\,
	datad => \sop_flag~q\,
	combout => \rx_st_sop~0_combout\);

-- Location: IOIBUF_X13_Y0_N22
\rx_st_ready~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx_st_ready,
	o => \rx_st_ready~input_o\);

ww_avalon_clk <= \avalon_clk~output_o\;

ww_rx_st_data(0) <= \rx_st_data[0]~output_o\;

ww_rx_st_data(1) <= \rx_st_data[1]~output_o\;

ww_rx_st_data(2) <= \rx_st_data[2]~output_o\;

ww_rx_st_data(3) <= \rx_st_data[3]~output_o\;

ww_rx_st_data(4) <= \rx_st_data[4]~output_o\;

ww_rx_st_data(5) <= \rx_st_data[5]~output_o\;

ww_rx_st_data(6) <= \rx_st_data[6]~output_o\;

ww_rx_st_data(7) <= \rx_st_data[7]~output_o\;

ww_rx_st_data(8) <= \rx_st_data[8]~output_o\;

ww_rx_st_data(9) <= \rx_st_data[9]~output_o\;

ww_rx_st_data(10) <= \rx_st_data[10]~output_o\;

ww_rx_st_data(11) <= \rx_st_data[11]~output_o\;

ww_rx_st_data(12) <= \rx_st_data[12]~output_o\;

ww_rx_st_data(13) <= \rx_st_data[13]~output_o\;

ww_rx_st_data(14) <= \rx_st_data[14]~output_o\;

ww_rx_st_data(15) <= \rx_st_data[15]~output_o\;

ww_rx_st_data(16) <= \rx_st_data[16]~output_o\;

ww_rx_st_data(17) <= \rx_st_data[17]~output_o\;

ww_rx_st_data(18) <= \rx_st_data[18]~output_o\;

ww_rx_st_data(19) <= \rx_st_data[19]~output_o\;

ww_rx_st_data(20) <= \rx_st_data[20]~output_o\;

ww_rx_st_data(21) <= \rx_st_data[21]~output_o\;

ww_rx_st_data(22) <= \rx_st_data[22]~output_o\;

ww_rx_st_data(23) <= \rx_st_data[23]~output_o\;

ww_rx_st_data(24) <= \rx_st_data[24]~output_o\;

ww_rx_st_data(25) <= \rx_st_data[25]~output_o\;

ww_rx_st_data(26) <= \rx_st_data[26]~output_o\;

ww_rx_st_data(27) <= \rx_st_data[27]~output_o\;

ww_rx_st_data(28) <= \rx_st_data[28]~output_o\;

ww_rx_st_data(29) <= \rx_st_data[29]~output_o\;

ww_rx_st_data(30) <= \rx_st_data[30]~output_o\;

ww_rx_st_data(31) <= \rx_st_data[31]~output_o\;

ww_rx_st_data(32) <= \rx_st_data[32]~output_o\;

ww_rx_st_data(33) <= \rx_st_data[33]~output_o\;

ww_rx_st_data(34) <= \rx_st_data[34]~output_o\;

ww_rx_st_data(35) <= \rx_st_data[35]~output_o\;

ww_rx_st_data(36) <= \rx_st_data[36]~output_o\;

ww_rx_st_data(37) <= \rx_st_data[37]~output_o\;

ww_rx_st_data(38) <= \rx_st_data[38]~output_o\;

ww_rx_st_data(39) <= \rx_st_data[39]~output_o\;

ww_rx_st_data(40) <= \rx_st_data[40]~output_o\;

ww_rx_st_data(41) <= \rx_st_data[41]~output_o\;

ww_rx_st_data(42) <= \rx_st_data[42]~output_o\;

ww_rx_st_data(43) <= \rx_st_data[43]~output_o\;

ww_rx_st_data(44) <= \rx_st_data[44]~output_o\;

ww_rx_st_data(45) <= \rx_st_data[45]~output_o\;

ww_rx_st_data(46) <= \rx_st_data[46]~output_o\;

ww_rx_st_data(47) <= \rx_st_data[47]~output_o\;

ww_rx_st_data(48) <= \rx_st_data[48]~output_o\;

ww_rx_st_data(49) <= \rx_st_data[49]~output_o\;

ww_rx_st_data(50) <= \rx_st_data[50]~output_o\;

ww_rx_st_data(51) <= \rx_st_data[51]~output_o\;

ww_rx_st_data(52) <= \rx_st_data[52]~output_o\;

ww_rx_st_data(53) <= \rx_st_data[53]~output_o\;

ww_rx_st_data(54) <= \rx_st_data[54]~output_o\;

ww_rx_st_data(55) <= \rx_st_data[55]~output_o\;

ww_rx_st_data(56) <= \rx_st_data[56]~output_o\;

ww_rx_st_data(57) <= \rx_st_data[57]~output_o\;

ww_rx_st_data(58) <= \rx_st_data[58]~output_o\;

ww_rx_st_data(59) <= \rx_st_data[59]~output_o\;

ww_rx_st_data(60) <= \rx_st_data[60]~output_o\;

ww_rx_st_data(61) <= \rx_st_data[61]~output_o\;

ww_rx_st_data(62) <= \rx_st_data[62]~output_o\;

ww_rx_st_data(63) <= \rx_st_data[63]~output_o\;

ww_rx_st_sop <= \rx_st_sop~output_o\;

ww_rx_st_eop <= \rx_st_eop~output_o\;

ww_rx_st_empty(0) <= \rx_st_empty[0]~output_o\;

ww_rx_st_empty(1) <= \rx_st_empty[1]~output_o\;

ww_rx_st_empty(2) <= \rx_st_empty[2]~output_o\;

ww_rx_st_valid <= \rx_st_valid~output_o\;
END structure;


