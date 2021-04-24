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
--  Module: ProblemSet 3, Problem 3
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;

entity booth_multiplier is
	generic (
		n : positive := 8
	)
	port (
		clk : in std_logic ;
		reset : in std_logic ;
		input_x : in std_logic_vector(n-1 downto 0) ;
		input_y : in std_logic_vector(n-1 downto 0) ;
		product : out std_logic_vector((2 * n - 1) downto 0)
  );

end booth_multiplier;

architecture booth_multiplier_arc of booth_multiplier is

begin

     -- write your code here

end booth_multiplier_arc ;

