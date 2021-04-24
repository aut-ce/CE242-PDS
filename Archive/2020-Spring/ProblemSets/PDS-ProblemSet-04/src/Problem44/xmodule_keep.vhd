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
--  Module: ProblemSet 4, Problem 4, XModule (keep)
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;

entity xmodule is
	port(
		clk   : in  std_logic ;
		inp_a : in  std_logic ;
		inp_b : in  std_logic ;
		out_a : out std_logic ;
		out_b : out std_logic );
end entity;

architecture xmodule_arch of xmodule is
	signal tmp_a     : std_logic ;
	signal tmp_b     : std_logic ;
	signal wire_a    : std_logic ;
	signal wire_b    : std_logic ;
	signal or_result : std_logic ;
	
	-- write your code here, add keep attribute for wire_a and wire_b signals

begin

	process(clk)
	begin
		if rising_edge(clk) then
			tmp_a <= inp_a;
			tmp_b <= inp_b;
		end if;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
			out_a <= wire_a;
			out_b <= wire_b;
		end if;
	end process;

	or_result <= (tmp_a or tmp_b);
	wire_a    <= or_result;
	wire_b    <= or_result;

end xmodule_arch;
