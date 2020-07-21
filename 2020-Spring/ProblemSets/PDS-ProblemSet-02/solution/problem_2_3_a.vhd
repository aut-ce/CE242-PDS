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
--  Module: ProblemSet 2, Problem 3, Section B
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity problem_2_3_a is
	port (
		data_inp : in std_logic_vector(7 downto 0) ;
		shamt : in std_logic_vector(2 downto 0) ;
		shmod : in std_logic ; 
		data_out : out std_logic_vector(7 downto 0));

end problem_2_3_a;

architecture problem_2_3_a_arc of problem_2_3_a is

begin
	data_out <= 
		std_logic_vector(shift_right(unsigned(data_inp), to_integer(unsigned(shamt)))) when shmod = '1' else
		std_logic_vector(shift_right(signed(data_inp), to_integer(unsigned(shamt))));

	-- Note : Functions 'SRA' and 'SRL' is not compatible with VHDL 1076-1987. 
	-- Comment out the function (declaration and body) for VHDL 1076-1987 compatibility.
	
	--	dataout <= 	data_inp srl to_integer(unsigned(data_inp))  when shmod = '1' else
	--				data_inp sra to_integer(unsigned(data_inp))

end  problem_2_3_a_arc;
