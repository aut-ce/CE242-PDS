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

begin

     -- write your code here

end structural;
