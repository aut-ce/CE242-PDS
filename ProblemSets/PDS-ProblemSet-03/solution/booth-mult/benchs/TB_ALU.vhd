
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY TB_ALU IS
END TB_ALU;
 
ARCHITECTURE behavior OF TB_ALU IS 
 
    COMPONENT Alu
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         op : IN  std_logic;
         S : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal op : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(7 downto 0);
 
BEGIN

   uut: Alu PORT MAP (
          A => A,
          B => B,
          op => op,
          S => S
        );
	A <= X"05" after 10 ns , X"0F" after 30 ns;
	B <= X"0A" after 10 ns , X"08" after 30 ns;
	op <= '1' after 20 ns , '0' after 40 ns;

END;
