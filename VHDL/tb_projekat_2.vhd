LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY tb_projekat_2 IS
END ENTITY tb_projekat_2;

ARCHITECTURE behavior OF tb_projekat_2 IS

    COMPONENT projekat
        PORT (
            gmii_rx_clk : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            gmii_rxdv : IN STD_LOGIC;
            gmii_rxd : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            avalon_clk : OUT STD_LOGIC;
            rx_st_data : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
            rx_st_sop : OUT STD_LOGIC;
            rx_st_eop : OUT STD_LOGIC;
            rx_st_empty : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            rx_st_valid : OUT STD_LOGIC;
            rx_st_ready : IN STD_LOGIC
        );
    END COMPONENT;

    SIGNAL gmii_rx_clk : STD_LOGIC := '0';
    SIGNAL reset : STD_LOGIC := '1';
    SIGNAL gmii_rxdv : STD_LOGIC := '0';
    SIGNAL gmii_rxd : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL avalon_clk : STD_LOGIC;
    SIGNAL rx_st_data : STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL rx_st_sop : STD_LOGIC;
    SIGNAL rx_st_eop : STD_LOGIC;
    SIGNAL rx_st_empty : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL rx_st_valid : STD_LOGIC;
    SIGNAL rx_st_ready : STD_LOGIC := '1';
    CONSTANT clk_period : TIME := 10 ns;

BEGIN
    uut: projekat
        PORT MAP (
            gmii_rx_clk => gmii_rx_clk,
            reset => reset,
            gmii_rxdv => gmii_rxdv,
            gmii_rxd => gmii_rxd,
            avalon_clk => avalon_clk,
            rx_st_data => rx_st_data,
            rx_st_sop => rx_st_sop,
            rx_st_eop => rx_st_eop,
            rx_st_empty => rx_st_empty,
            rx_st_valid => rx_st_valid,
            rx_st_ready => rx_st_ready
        );

    clk_process: PROCESS
    BEGIN
        gmii_rx_clk <= '0';
        WAIT FOR clk_period / 2;
        gmii_rx_clk <= '1';
        WAIT FOR clk_period / 2;
    END PROCESS;

    stim_proc: PROCESS
    BEGIN
       
        reset <= '1';
        WAIT FOR 10 ns;
        reset <= '0';
	gmii_rxdv <= '0';
        gmii_rxd <= (OTHERS => '0');

        -- Pocetni IDLE period
        WAIT FOR 40 ns;

        -- Tranzicija u RECEIVING_PREAMBLE
        gmii_rxdv <= '1';
        gmii_rxd <= x"55";
	WAIT FOR 70 ns;
        gmii_rxd <= x"D5";
        WAIT FOR 10 ns;

        -- Tranzicija u RECEIVING_DATA 
        gmii_rxd <= x"00";
	WAIT FOR 10 ns;

        gmii_rxd <= x"01";
	WAIT FOR 10 ns;

        gmii_rxd <= x"02";
	WAIT FOR 10 ns;

        gmii_rxd <= x"03";
	WAIT FOR 10 ns;

        gmii_rxd <= x"04";
	WAIT FOR 10 ns;

        gmii_rxd <= x"05";
	WAIT FOR 10 ns;

        gmii_rxd <= x"06";
	WAIT FOR 10 ns;

        gmii_rxd <= x"07";
	WAIT FOR 10 ns;

        gmii_rxd <= x"08";
	WAIT FOR 10 ns;

        gmii_rxd <= x"09";
	WAIT FOR 10 ns;

        gmii_rxd <= x"0A";
	WAIT FOR 10 ns;

        gmii_rxd <= x"0B";
	WAIT FOR 10 ns;

        gmii_rxd <= x"0C";
	WAIT FOR 10 ns;

        gmii_rxd <= x"0D";
	WAIT FOR 10 ns;

        gmii_rxd <= x"0E";
	WAIT FOR 10 ns;

        gmii_rxd <= x"0F";
	WAIT FOR 10 ns;

        gmii_rxd <= x"10";
	WAIT FOR 10 ns;

        gmii_rxd <= x"11";
	WAIT FOR 10 ns;

        gmii_rxd <= x"12";
	WAIT FOR 10 ns;

        gmii_rxd <= x"13";
	WAIT FOR 10 ns;

        gmii_rxd <= x"14";
	WAIT FOR 10 ns;

        gmii_rxd <= x"15";
	WAIT FOR 10 ns;

        gmii_rxd <= x"16";
	WAIT FOR 10 ns;

        gmii_rxd <= x"17";
        WAIT FOR 10 ns;

        gmii_rxd <= x"18";
        WAIT FOR 10 ns;

        gmii_rxd <= x"19";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"1A";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"1B";
        WAIT FOR 10 ns;

        gmii_rxd <= x"1C";
        WAIT FOR 10 ns;

        gmii_rxd <= x"1D";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"1E";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"1F";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"20";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"21";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"22";
        WAIT FOR 10 ns;

        gmii_rxd <= x"23";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"24";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"25";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"26";
        WAIT FOR 10 ns;

        gmii_rxd <= x"27";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"28";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"29";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"2A";
        WAIT FOR 10 ns;

        gmii_rxd <= x"2B";
        WAIT FOR 10 ns;

        gmii_rxd <= x"2C";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"2D";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"2E";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"2F";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"30";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"31";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"32";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"33";
        WAIT FOR 10 ns;

        gmii_rxd <= x"34";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"35";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"36";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"37";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"38";
        WAIT FOR 10 ns;

        gmii_rxd <= x"39";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"3A";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"3B";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"3C";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"3D";
        WAIT FOR 10 ns;

        gmii_rxd <= x"3E";
        WAIT FOR 10 ns;

        gmii_rxd <= x"3F";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"40";  
        WAIT FOR 10 ns;

	gmii_rxd <= x"41";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"42";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"43";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"44";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"45";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"46";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"47";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"48";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"49";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"4A";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"4B";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"4C";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"4D";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"4E";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"4F";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"50";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"51";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"52";  
        WAIT FOR 10 ns;

        gmii_rxd <= x"53";  
        WAIT FOR 10 ns;

        -- Trazicija u LAST_DATA
        gmii_rxdv <= '0';
        WAIT FOR 80 ns;

       -- Trazicija opet u IDLE
        gmii_rxdv <= '0';
        WAIT FOR 10 ns;

        WAIT; 
    END PROCESS;
END ARCHITECTURE behavior;