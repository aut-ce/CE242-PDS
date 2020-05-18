
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Ander IS
END TB_Ander;
 
ARCHITECTURE behavior OF TB_Ander IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Ander
    PORT(
         input1 : IN  std_logic;
         input2 : IN  std_logic_vector(7 downto 0);
         result : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input1 : std_logic := '0';
   signal input2 : std_logic_vector(7 downto 0) := (others=>'0');

 	--Outputs
   signal result : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ander PORT MAP (
          input1 => input1,
          input2 => input2,
          result => result
        );
	input2 <= X"58";
	input1 <= '1' after 20 ns;
END;
