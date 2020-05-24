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
--  Module: ProblemSet 5, Problem 3, Sine_Cosine_Module TB
--  *********************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

-----------------------------------------------------------

entity tb_sine_cosine_module is
end entity tb_sine_cosine_module;

-----------------------------------------------------------

architecture testbench of tb_sine_cosine_module is

	component sine_cosine_module is
		port (
			aclk        : in  std_logic ;
			din_tvalid  : in  std_logic ;
			din         : in  std_logic_vector(16 downto 0) ;
			din_tready  : out std_logic ;
			dout_tvalid : out std_logic ;
			dout_sine   : out std_logic_vector(16 downto 0);
			dout_cosine : out std_logic_vector(16 downto 0)
		) ;
	end component sine_cosine_module;

	signal aclk        : std_logic ;
	signal din_tvalid  : std_logic ;
	signal din         : std_logic_vector(16 downto 0) ;
	signal din_tready  : std_logic ;
	signal dout_tvalid : std_logic ;
	signal dout_sine   : std_logic_vector(16 downto 0);
	signal dout_cosine : std_logic_vector(16 downto 0)

begin

	-- Design Under Test
	dut : sine_cosine_module
		port map (
			aclk        => aclk,
			din_tvalid  => din_tvalid,
			din         => din,
			din_tready  => din_tready,
			dout_tvalid => dout_tvalid,
			dout_sine   => dout_sine,
			dout_cosine => dout_cosine
		);

	-- Clock Generation
	aclk <= not clock after 5 ns; -- 100 MHz

end architecture testbench;
