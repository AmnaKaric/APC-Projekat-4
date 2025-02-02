LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY projekat IS
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
END ENTITY projekat;

ARCHITECTURE rtl OF projekat IS
    TYPE STATE_REGISTAR IS (IDLE, RECEIVING_PREAMBLE, RECEIVING_DATA, LAST_DATA);
    SIGNAL current_state, next_state : STATE_REGISTAR := IDLE; 
    SIGNAL counter : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL int_data: STD_LOGIC_VECTOR(63 DOWNTO 0) := (OTHERS => '0'); 
	 SIGNAL out_data: STD_LOGIC_VECTOR(63 DOWNTO 0) := (OTHERS => '0'); 
    SIGNAL clk_counter : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '1'); 
    SIGNAL int_empty: INTEGER := 0; 
    SIGNAL sop_flag : STD_LOGIC := '0';
	 SIGNAL packet_count : INTEGER := 0;
	 SIGNAL saved_empty : INTEGER := 0;
	 SIGNAL empty_locked : INTEGER := 0;
BEGIN

-- SEKVENCIJALNI DIO --
fsm: PROCESS (reset, gmii_rx_clk)
BEGIN
    IF reset = '1' THEN
        current_state <= IDLE;
        counter <= "111"; 
        int_data <= (OTHERS => '0'); 
        sop_flag <= '0';
       
    ELSIF RISING_EDGE(gmii_rx_clk) THEN
        current_state <= next_state; 

        IF clk_counter = "111" THEN
            clk_counter <= "000";  
        ELSE
            clk_counter <= STD_LOGIC_VECTOR(UNSIGNED(clk_counter) + 1);
        END IF;

        IF clk_counter = "011"  OR clk_counter = "100"  OR clk_counter = "101" OR clk_counter = "110" THEN
            avalon_clk <= '1';
        ELSE
            avalon_clk <= '0';
        END IF;
          
        IF current_state = IDLE THEN
            counter <= "111";
            
        END IF;
          
        IF current_state = RECEIVING_PREAMBLE THEN
            counter <= STD_LOGIC_VECTOR(UNSIGNED(counter) - 1);
        END IF;
          
        IF current_state = RECEIVING_DATA THEN
            counter <= STD_LOGIC_VECTOR(UNSIGNED(counter) - 1);
					 CASE counter IS
						  WHEN "000" =>
								int_data(63 DOWNTO 56) <= gmii_rxd;
						  WHEN "111" =>
								int_data(55 DOWNTO 48) <= gmii_rxd;
						  WHEN "110" =>
								int_data(47 DOWNTO 40) <= gmii_rxd;
						  WHEN "101" =>
								int_data(39 DOWNTO 32) <= gmii_rxd;
						  WHEN "100" =>
								int_data(31 DOWNTO 24) <= gmii_rxd;
						  WHEN "011" =>
								int_data(23 DOWNTO 16) <= gmii_rxd;
						  WHEN "010" =>
								int_data(15 DOWNTO 8) <= gmii_rxd;
						  WHEN "001" =>
								int_data(7 DOWNTO 0) <= gmii_rxd;
						  WHEN OTHERS =>
								int_data(63 DOWNTO 0) <= (OTHERS => '0');  -- Ako nešto nepredviđeno desi, sve se puni nulama
					 END CASE;
				
				
           
				packet_count <= packet_count + 1;
				
				IF counter = "000" THEN
                out_data <= int_data;  
            END IF;
				
				IF counter = "000" THEN
					IF packet_count > 0 AND packet_count < 9 THEN  -- Aktiviraj SOP samo prvi put
                    sop_flag <= '1';
                    
					ELSE
						sop_flag <= '0';
					END IF;
				END IF;
				
        END IF;
        
		  IF saved_empty > 0 THEN
					 CASE saved_empty IS
						  WHEN 8 =>
								int_data(63 DOWNTO 0) <= (OTHERS => '0');
						  WHEN 7 =>
								int_data(55 DOWNTO 0) <= (OTHERS => '0');
						  WHEN 6 =>
								int_data(47 DOWNTO 0) <= (OTHERS => '0');
						  WHEN 5 =>
								int_data(39 DOWNTO 0) <= (OTHERS => '0');  
						  WHEN 4 =>
								int_data(31 DOWNTO 0) <= (OTHERS => '0');
						  WHEN 3 =>
								int_data(23 DOWNTO 0) <= (OTHERS => '0'); 
						  WHEN 2 =>
								int_data(15 DOWNTO 0) <= (OTHERS => '0');
						  WHEN 1 =>
								int_data(7 DOWNTO 0) <= (OTHERS => '0'); 
						  WHEN OTHERS =>
								int_data(63 DOWNTO 0) <= (OTHERS => '0');  -- Ako nešto nepredviđeno desi, sve se puni nulama
					 END CASE;
				END IF;
				
        IF current_state = LAST_DATA THEN
            counter <= STD_LOGIC_VECTOR(UNSIGNED(counter) - 1);
        END IF;
		  
    END IF;
END PROCESS;


-- KOMBINATORNI DIO --
PROCESS (gmii_rxdv, gmii_rxd, counter, current_state)
BEGIN
    next_state <= current_state;
    CASE current_state IS
        WHEN IDLE =>
            IF gmii_rxdv = '1' THEN
                next_state <= RECEIVING_PREAMBLE;
            END IF;

        WHEN RECEIVING_PREAMBLE =>
            IF gmii_rxd = x"D5" THEN
                next_state <= RECEIVING_DATA;
            END IF;
				
			WHEN RECEIVING_DATA =>
				 IF gmii_rxdv = '0' THEN
					 IF counter = "000" THEN
							int_empty <= 0;
							next_state <= LAST_DATA;
					  END IF;
				 END IF;
				 
				 IF gmii_rxdv = '0' AND counter > "000" THEN
							int_empty <= TO_INTEGER(UNSIGNED(counter));
							IF empty_locked = 0 THEN
								 saved_empty <= TO_INTEGER(UNSIGNED(counter));
								 empty_locked <= 1;
							END IF;
				 END IF;
				 
        WHEN LAST_DATA =>
            IF counter = "000" THEN 
                next_state <= IDLE;
            END IF;
    END CASE;
END PROCESS;

-- IZLAZNI DIO --
outp: PROCESS (ALL)
BEGIN
    CASE current_state IS
        WHEN IDLE =>
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
            rx_st_sop <= sop_flag; 
            rx_st_eop <= '0';
            rx_st_valid <= '1';
            rx_st_empty <= "000";
            rx_st_data <= out_data;

        WHEN LAST_DATA =>
            rx_st_sop <= '0';
            rx_st_eop <= '1'; 
            rx_st_valid <= '1';
				rx_st_empty <= STD_LOGIC_VECTOR(TO_UNSIGNED(saved_empty, 3));
            rx_st_data <= out_data;
    END CASE;
END PROCESS;

END ARCHITECTURE rtl;