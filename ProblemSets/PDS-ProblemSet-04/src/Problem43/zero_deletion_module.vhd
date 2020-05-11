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
--  Module: ProblemSet 4, Problem 3, Zero Deletion Module
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;

entity zero_deletion_module is
	port (
		clock    : in  std_logic ;
		din      : in  std_logic ;
		reset    : in  std_logic ;
		enable   : in  std_logic ;
		is_valid : out std_logic ;
		dout     : out std_logic ;
		detected : out std_logic ) ;
end zero_deletion_module;

architecture zero_deletion_module_arch of zero_deletion_module is

	component zero_deletion_detector is
	port (
		clock    : in  std_logic ;
		din      : in  std_logic ;
		reset    : in  std_logic ;
		enable   : in  std_logic ;
		detected : out std_logic ) ;
	end component zero_deletion_detector;

	-- write your code here

begin

	-- write your code here

end zero_deletion_module_arch;
