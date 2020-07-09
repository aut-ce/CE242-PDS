
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Register IS
END TB_Register;
 
ARCHITECTURE behavior OF TB_Register IS 
 
    COMPONENT Regeister
    PORT(
         clock : IN  std_logic;
         enable : IN  std_logic;
         reset : IN  std_logic;
         din : IN  std_logic_vector(7 downto 0);
         dout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   signal clock : std_logic := '0';
   signal enable : std_logic := '0';
   signal reset : std_logic := '0';
   signal din : std_logic_vector(7 downto 0) ;

   signal dout : std_logic_vector(7 downto 0);

   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Regeister PORT MAP (
          clock => clock,
          enable => enable,
          reset => reset,
          din => din,
          dout => dout
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
	reset <= '1' after clock_period/2 ,'0' after clock_period*3/2;
	enable<= '1' after clock_period*2 ,'0' after clock_period*7;
	din 	<= X"05" after clock_period ,
				X"0A" after clock_period*2,
				X"1A" after clock_period*3,
				X"2A" after clock_period*4,
				X"3A" after clock_period*5,
				X"4A" after clock_period*6,
				X"5A" after clock_period*7,
				X"6B" after clock_period*8;
END;
