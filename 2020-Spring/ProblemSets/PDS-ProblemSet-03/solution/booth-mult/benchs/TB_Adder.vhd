
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Adder IS
END TB_Adder;
 
ARCHITECTURE behavior OF TB_Adder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Adder
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Cin : IN  std_logic;
         S : OUT  std_logic_vector(7 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others =>'0');
   signal B : std_logic_vector(7 downto 0) := (others =>'0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(7 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          Cout => Cout
        );
	cin <= '1' after 20 ns , '0' after 40 ns;
	A <= X"05" after 10 ns , X"06" after 20 ns , X"F8" after 30 ns ;
	B <= X"0F" after 10 ns , X"0A" after 20 ns , X"F3" after 30 ns ;
END;
