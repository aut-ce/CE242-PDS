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
--  Module: ProblemSet 2, Problem 2, Half Adder
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
  port (
	a    : in  std_logic;
	b    : in  std_logic;
	cout : out std_logic;
	sum  : out std_logic
  ) ;
end entity ; -- half_adder

architecture structural of half_adder is

begin

	-- Write Your Code Here!
	sum <= a xor b;
	cout <= a and b;
	--

end architecture ; -- structural