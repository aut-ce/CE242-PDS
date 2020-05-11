--/*
--**********************************************************
--  Design Automation Course Homework (Spring, 2020 Semester)
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce.aut.ac.ir
--  Created by TA (ali[dot]mohammadpour[at]ac[dot]ir)
--  *******************************************************
--  Student ID  : XXXXXXX
--  Student Name: -----------------
--  Student Mail: -----------------
--  *******************************************************
--  Module: ProblemSet 4, Problem 1, Generic Stack
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;

entity generic_stack is
	generic (
		n : positive := 4;
		m : positive := 8
	);
	port (
		clock     : in  std_logic ;
		clear     : in  std_logic_vector(m -1 downto 0) ;
		push      : in  std_logic ;
		pop       : in  std_logic ;
		dout      : out std_logic_vector(m -1 downto 0) ;
		exception : out std_logic ;
		empty     : out std_logic ;
		full      : out std_logic ) ;
end generic_stack;

architecture generic_stack_arch of generic_stack is

	type memory is array (0 to 2 ** n - 1) of std_logic_vector(m-1 downto 0) ;
	-- write your code here

begin

	-- write your code here

end generic_stack_arch;
