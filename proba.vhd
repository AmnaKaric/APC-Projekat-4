LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


ENTITY proba IS
PORT (
	gmii_rx_clk : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	gmii_rxdv : IN STD_LOGIC;
	gmii_rxd : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	avalon_clk : OUT STD_LOGIC; --provjera da li je IN
	rx_st_data : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
	rx_st_sop : OUT STD_LOGIC;
	rx_st_eop : OUT STD_LOGIC;
	rx_st_empty : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	rx_st_valid : OUT STD_LOGIC;
	rx_st_ready : IN STD_LOGIC
);
END ENTITY proba;

ARCHITECTURE rtl OF proba IS
TYPE STATE_REGISTAR IS (IDLE, RECEIVING_PREAMBLE, RECEIVING_DATA, LAST_DATA);
SIGNAL current_state, next_state : STATE_REGISTAR;
SIGNAL counter : STD_LOGIC_VECTOR(2 DOWNTO 0) := "111"; --interni signal
SIGNAL int_data: STD_LOGIC_VECTOR(63 DOWNTO 0) := (OTHERS => '0'); -- interni signal
SIGNAL clk_counter : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0');
SIGNAL int_empty: INTEGER:= 0;

BEGIN
fsm: PROCESS (reset,gmii_rx_clk)  --gmii_rxdv,gmii_rxd --> vidjeti da li ih treba dodati
BEGIN
IF reset = '1' THEN --inicijalizirati sve interne registre 
	current_state <= IDLE;
	avalon_clk <= '0';
	counter <= "111";
	int_data <= (OTHERS => '0');
	clk_counter <= "000";
	int_empty <= 0;
ELSIF RISING_EDGE(gmii_rx_clk) THEN
	current_state <= next_state;
	IF UNSIGNED(clk_counter) > 0 THEN
            clk_counter <= STD_LOGIC_VECTOR(UNSIGNED(clk_counter) - 1); 
				IF UNSIGNED(clk_counter) > "011" THEN
					avalon_clk <= '1';
				ELSE avalon_clk <= '0';
				END IF;
			ELSE
            clk_counter <= "111";  
			END IF;
	CASE current_state IS
	WHEN IDLE =>
		IF gmii_rxdv = '1' THEN
			next_state <= RECEIVING_PREAMBLE;
			counter <= "111";
		ELSE
			next_state <= IDLE;
		END IF;

	WHEN RECEIVING_PREAMBLE =>
		IF UNSIGNED(counter) > 0 THEN
        counter <= STD_LOGIC_VECTOR (UNSIGNED(counter) - 1);  -- Smanjivanje brojača za 1
		END IF;
		IF gmii_rxdv = '1' AND gmii_rxd = x"D5" THEN
			next_state <= RECEIVING_DATA;
		END IF;
		
		WHEN RECEIVING_DATA =>
		IF gmii_rxdv = '1' THEN
			int_data(TO_INTEGER(UNSIGNED(counter)) * 8 + 7 DOWNTO TO_INTEGER(UNSIGNED(counter)) * 8) <= gmii_rxd;
        -- Smanjujemo brojač dok god nije dostigao 0 
		  --(PROVJERITI IMA LI JEDNOSTAVNIJE)
			--int_data <= STD_LOGIC_VECTOR(UNSIGNED(int_data) + UNSIGNED(gmii_rxd));
         IF counter = "111" THEN
            int_data <= (OTHERS => '0');
			END IF;
			IF UNSIGNED(counter) > 0 THEN
            counter <= STD_LOGIC_VECTOR(UNSIGNED(counter) - 1);  -- Smanjujemo brojač
			ELSE
            -- Ako je brojač dostigao 0, postavljamo ga nazad na 7 (3-bitni brojač)
            counter <= "111";  -- Resetujemo brojač na 7
			END IF;
		END IF;

		-- Kada je brojač 0 i prijem podataka završen, pređi na sljedeće stanje
		IF gmii_rxdv = '0' THEN
         int_empty <= 8 - TO_INTEGER(UNSIGNED(counter)); -- za empty
        IF counter = "000" THEN
            next_state <= LAST_DATA;
				CASE int_empty IS
            WHEN 1 =>
                int_data(7 DOWNTO 0) <= (OTHERS => '0');
            WHEN 2 =>
                int_data(15 DOWNTO 0) <= (OTHERS => '0');
            WHEN 3 =>
                int_data(23 DOWNTO 0) <= (OTHERS => '0');
            WHEN 4 =>
                int_data(31 DOWNTO 0) <= (OTHERS => '0');
            WHEN 5 =>
                int_data(39 DOWNTO 0) <= (OTHERS => '0');
            WHEN 6 =>
                int_data(47 DOWNTO 0) <= (OTHERS => '0');
            WHEN 7 =>
                int_data(55 DOWNTO 0) <= (OTHERS => '0');
			   WHEN OTHERS =>
                int_data(63 DOWNTO 0) <= (OTHERS => '0');
				END CASE;
        END IF;
		END IF;

	WHEN LAST_DATA =>
		counter <= STD_LOGIC_VECTOR (UNSIGNED(counter) - 1);	
		IF counter = "000" THEN
			next_state <= IDLE;
		END IF;
	END CASE;
END IF;
END PROCESS;

outp: PROCESS (ALL)
BEGIN
CASE current_state IS
	WHEN IDLE =>
		--avalon_clk <= '0';
		rx_st_sop <= '0';
		rx_st_eop <= '0';
		rx_st_valid <= '0';
		rx_st_empty <= "000";
		rx_st_data <= (OTHERS => '0');
	WHEN RECEIVING_PREAMBLE =>
		rx_st_sop <= '0';
		rx_st_eop <= '0';
		rx_st_valid <= '0';
		rx_st_empty <= "000";
		rx_st_data <= (OTHERS => '0');
	WHEN RECEIVING_DATA =>
		rx_st_sop <= '1'; --pogledati za ovaj dio
		rx_st_eop <= '0';
		rx_st_valid <= '1';
		rx_st_empty <= "000";
		IF counter = "000" THEN
			rx_st_data <= int_data;
      END IF;
	WHEN LAST_DATA =>
		rx_st_sop <= '0'; --pogledati za ovaj dio
		rx_st_eop <= '1';
		rx_st_valid <= '1';
		rx_st_empty <= STD_LOGIC_VECTOR(TO_UNSIGNED(int_empty, 3));
		rx_st_data <= int_data;
END CASE;
END PROCESS;
END ARCHITECTURE rtl;