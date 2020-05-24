--/*
--***********************************************************
--  Design Automation Course Homework (Spring, 2020 Semester)
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce.aut.ac.ir
--  Created by TA (ali[dot]mohammadpour[at]ac[dot]ir)
--  *********************************************************
--  Student ID  : XXXXXXX
--  Student Name: -----------------
--  Student Mail: -----------------
--  *********************************************************
--  Module: ProblemSet 5, Problem 4, PWM Module Testbench
--  *********************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

-----------------------------------------------------------

entity tb_pwm is
end entity tb_pwm;

-----------------------------------------------------------

architecture testbench of tb_pwm is

	component pwm_native is
		port (
			clock  : in  std_logic ;
			reset  : in  std_logic ;
			enable : in  std_logic ;   -- when is zero, output will be zero else heart !
			pwm_o  : out std_logic ) ; -- output is not good port name pwm_o is better.
	end component;

	component pwm_macro is
		port (
			clock  : in  std_logic ;
			reset  : in  std_logic ;
			enable : in  std_logic ;   -- when is zero, output will be zero else heart !
			pwm_o  : out std_logic ) ; -- output is not good port name pwm_o is better.
	end component;

	signal clock        : std_logic := '0';
	signal reset        : std_logic ;
	signal enable       : std_logic ;
	signal pwm_o_native : std_logic ;
	signal pwm_o_macro  : std_logic ;

begin

	-- Design Under Test
	dut_native : pwm_native
		port map (
			clock  => clock ,
			reset  => reset,
			enable => enable ,
			pwm_o  => pwm_o_native);
	
	dut_macro : pwm_macro
		port map (
			clock  => clock ,
			reset  => reset,
			enable => enable ,
			pwm_o  => pwm_o_macro);
	-- Clock Generation
	clock <= not clock after 5 ns;

	-- Clear Stack Content
	enable <=
		'1' after 000 ns ,
		'0' after 070 ns ,
		'1' after 090 ns ;

	reset <=
		'1' after 000 ns ,
		'0' after 010 ns ;

end architecture testbench;
