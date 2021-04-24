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
--  Module: ProblemSet 4, Problem 2, Average Weighted Filter
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;

entity filter is
	port (
		clock    : in  std_logic ;
		reset    : in  std_logic ;
		input_x  : in  std_logic_vector(7 downto 0) ;
		coef_0   : in  std_logic_vector(3 downto 0) ;
		coef_1   : in  std_logic_vector(3 downto 0) ;
		coef_2   : in  std_logic_vector(3 downto 0) ;
		coef_3   : in  std_logic_vector(3 downto 0) ;
		output_y : out std_logic_vector(7 downto 0) ) ;
end filter;

architecture filter_arch of filter is

	-- write your code here
	-- use reset input for initialize registers

begin

	-- write your code here

end filter_arch;
