
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY TB_RightShiftReg IS
END TB_RightShiftReg;
 
ARCHITECTURE behavior OF TB_RightShiftReg IS 
 

 
    COMPONENT RightShiftReg
    PORT(
         clock : IN  std_logic;
         enable : IN  std_logic;
         shift : IN  std_logic;
         din : IN  std_logic_vector(8 downto 0);
         dout : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal enable : std_logic := '0';
   signal shift : std_logic := '0';
   signal din : std_logic_vector(8 downto 0) := (others => '0');

 	--Outputs
   signal dout : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RightShiftReg PORT MAP (
          clock => clock,
          enable => enable,
          shift => shift,
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
	
	enable 	<= '1' after clock_period*2 ,'0' after clock_period*3;
	shift		<= '1' after clock_period*3 ,'0' after clock_period*7;
	din 		<= "011001101" after clock_period/2;
END;
