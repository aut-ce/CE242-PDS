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
--  Module: ProblemSet 4, Problem 1, Generic Stack Testbench
--  *********************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

-----------------------------------------------------------

entity tb_generic_stack is
end entity tb_generic_stack;

-----------------------------------------------------------

architecture testbench of tb_generic_stack is

	component generic_stack is
		generic (
			n : positive := 4;
			m : positive := 8
		);
		port (
			clock : in std_logic ;

			clear : in std_logic_vector(m -1 downto 0) ;
			push  : in std_logic ;
			pop   : in std_logic ;

			dout      : out std_logic_vector(m -1 downto 0) ;
			exception : out std_logic ;
			empty     : out std_logic ;
			full      : out std_logic ) ;
	end component;

	signal clock     : std_logic := '0';
	signal clear     : std_logic_vector(m -1 downto 0);
	signal push      : std_logic;
	signal pop       : std_logic;
	signal dout      : std_logic_vector(m -1 downto 0);
	signal exception : std_logic;
	signal empty     : std_logic;
	signal full      : std_logic;

begin

	-- Design Under Test
	dut : generic_stack
		generic map (
			m : 4,
			n : 2
		)
		port map (
			clock     => clock ,
			clear     => clear ,
			push      => push ,
			pop       => pop ,
			dout      => dout ,
			exception => exception,
			empty     => empty ,
			full      => full
		);

	-- Clock Generation
	clock <= not clock after 10 ns;

	-- Input Data
	data <=
		X"0" after 000 ns,
		X"1" after 010 ns,
		X"2" after 020 ns,
		X"3" after 030 ns,
		X"4" after 040 ns,
		X"5" after 050 ns,
		X"6" after 060 ns,
		X"7" after 070 ns,
		X"8" after 080 ns,
		X"9" after 090 ns,
		X"A" after 110 ns,
		X"B" after 120 ns,
		X"C" after 130 ns,
		X"D" after 140 ns,
		X"E" after 150 ns,
		X"F" after 160 ns;

	-- Clear Stack Content
	clear <=
		'1' after 000 ns,
		'0' after 010 ns,
		'1' after 090 ns,
		'0' after 100 ns;

	push <=
		'0' after 000 ns,
		'1' after 030 ns,
		'0' after 090 ns,
		'1' after 120 ns,
		'0' after 140 ns;

	pop <=
		'0' after 000 ns,
		'1' after 090 ns,
		'0' after 080 ns,
		'1' after 140 ns;

end architecture testbench;