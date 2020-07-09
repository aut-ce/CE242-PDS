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
--  Module: ProblemSet 4, Problem 3, Zero Delation Testbench
--  *********************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

-----------------------------------------------------------

entity tb_zero_deletion_module is
end entity tb_zero_deletion_module;

-----------------------------------------------------------

architecture testbench of tb_zero_deletion_module is

	component zero_deletion_module is
		port (
			clock    : in  std_logic ;
			din      : in  std_logic ;
			reset    : in  std_logic ;
			enable   : in  std_logic ;
			is_valid : out std_logic ;
			dout     : out std_logic ;
			detected : out std_logic ) ;
	end component;

	signal clock    : std_logic;
	signal din      : std_logic;
	signal reset    : std_logic;
	signal enable   : std_logic;
	signal is_valid : std_logic;
	signal dout     : std_logic;
	signal detected : std_logic;

begin
	-- Zero Deletion Module Under Test
	dut : zero_deletion_module
		port map (
			clock    => clock ,
			din      => din ,
			reset    => reset ,
			enable   => enable ,
			is_valid => is_valid,
			dout     => dout ,
			detected => detected
		);

	-- Clock Generation
	clock <= not clock after 10 ns;

	-- reset before read file and write file
	reset <= '1' after 00 ns, '0' after 40 ns;

	-- enable module after reset
	enable <= '0' after 00 ns, '1' after 40 ns;

	-- write process for read from datain.txt file 
	-- read data when enable be active and stop reading enf of file

	-------------------------------------------------------------------
	-- write process for write to dataout.txt file
	-- write data when data is valid

	-------------------------------------------------------------------
	--  write a process for assert bellow message in console (terminal)
	--	zero deletion detected at [now-time]
	--  total number of deletions: [number of deletions]

end architecture testbench;
