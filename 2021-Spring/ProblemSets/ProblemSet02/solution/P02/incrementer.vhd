--/*
--**********************************************************
--  Design Automation Course Homework (Spring, 2021 Semester)
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce.aut.ac.ir
--  Designed TA (ali[dot]mohammadpour[at]ac[dot]ir)
--  *******************************************************
--  Student ID  : XXXXXXX
--  Student Name: -----------------
--  Student Mail: -----------------
--  *******************************************************
--  Module: ProblemSet 2, Problem 2, Incrementer
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;

entity incrementer is
	port (
		inp      : in  std_logic_vector(3 downto 0) ;
		outp     : out std_logic_vector(3 downto 0) ;
		zero     : out std_logic ;
		parity   : out std_logic ;
		overflow : out std_logic
	);

end incrementer;

architecture structural of incrementer is
	signal carry   : std_logic_vector(inp'range);
	signal xzero   : std_logic;
	signal xparity : std_logic;
begin
	carry(0) <= '1' ;
	half_adders : for inx in 0 to inp'length-1 generate
		hax : half_adder
			port map(
				a    => carry(inx) ,
				b    => inp(inx) ,
				cout => carry(inx+1) ,
				sum  => outp(inx));
	end generate half_adders;

	overflow <= carry(inp'length-1) xor carry(inp'length-2);
	xor_gen : for i in carry'range generate
		xparity <= xparity xor carry(i);
	end generate xor_gen;
	and_gen : for i in carry'range generate
		xzero <= zero and carry(i);
	end generate and_gen;
	zero   <= xzero;
	parity <= xparity ;
	-- write your code here

end structural;

