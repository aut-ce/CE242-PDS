
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Alu is
	port(
		A	: in  std_logic_vector;
		B	: in  std_logic_vector;
		op	: in  std_logic;
		S 	: out std_logic_vector);
end Alu;

architecture Behavioral of Alu is
	component Adder is
		port(
			A		: in  std_logic_vector;
			B		: in  std_logic_vector;
			Cin	: in  std_logic;
			S 		: out std_logic_vector;
			Cout 	: out std_logic);
	end component;
	
	component XorCrearor is
		port(
			input1 : in	 std_logic;
			input2 : in  std_logic_vector;
			result : out std_logic_vector);
	end component;
	signal xored: std_logic_vector(A'range);
begin
	XO :XorCrearor port map(op,B,xored);
	ADD:ADDER port map(A,xored,op,S,open);


end Behavioral;

