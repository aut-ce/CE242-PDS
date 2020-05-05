--/*
--**********************************************************
--  Design Automation Course Homework (Spring, 2020 Semester)
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce.aut.ac.ir
--  Designed TA (ali[dot]mohammadpour[at]ac[dot]ir)
--  *******************************************************
--  Student ID  : XXXXXXX
--  Student Name: -----------------
--  Student Mail: -----------------
--  *******************************************************
--  Module: ProblemSet 2, Problem 5 , Testbench
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;

entity problem_2_5 is
end problem_2_5;

architecture problem_2_5_arc of problem_2_5 is
	
	signal mode: std_logic := '0';
	
	signal input: std_logic_vector(7 downto 0) := (others =>'0');
	signal out_p24: std_logic_vector(7 downto 0) := (others =>'0');
	signal p2_3: std_logic_vector(7 downto 0) := (others =>'0');

begin

	problem_2_3_uut : problem_2_3_a port map (input, shamt, mode, p_2_3);
	problem_2_4_uut : problem_2_4 port map (input, shamt, mode, p_2_4);

	mode <= '0',
			'1' after 20 ns,
			'0' after 40 ns;

	input <= b"11_10_10_10" after 10 ns, -- b stands for binary and underscores
			 b"01_10_11_01" after 30 ns; -- are ignored by the compiler.

	shamt <= b"101" ;

end  problem_2_5_arc;
 