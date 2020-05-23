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
--  Module: ProblemSet 5, Problem 1, Fibonacci Testbench
--  *********************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

-----------------------------------------------------------

entity tb_fibo_block_ram is
end entity tb_fibo_block_ram;

-----------------------------------------------------------

architecture testbench of tb_fibo_block_ram is

	component fibo_block_ram is
		port (
			clock : in  std_logic ;
			din   : in  std_logic_vector(3 downto 0) ;   -- input: n
			dout  : out std_logic_vector(11 downto 0)) ; -- output : fib(n)
	end component fibo_block_ram;

	signal clock : std_logic;
	signal din   : std_logic_vector(3 downto 0);
	signal dout  : std_logic_vector(11 downto 0);

begin

	-- Design Under Test
	dut : fibo_block_ram
		port map (
			clock => clock,
			din   => din ,
			dout  => dout
		);

	-- Clock Generation
	clock <= not clock after 5 ns;


end architecture testbench;
