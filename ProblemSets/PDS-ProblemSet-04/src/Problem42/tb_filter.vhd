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
--  Module: ProblemSet 4, Problem 2, Fiter Testbench
--  *********************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

-----------------------------------------------------------

entity tb_flter is
end entity tb_flter;

-----------------------------------------------------------

architecture testbench of tb_flter is

	component filter is
		port (
			clock    : in  std_logic ;
			reset    : in  std_logic ;
			input_x  : in  std_logic_vector(7 downto 0) ;
			coef_0   : in  std_logic_vector(3 downto 0) ;
			coef_1   : in  std_logic_vector(3 downto 0) ;
			coef_2   : in  std_logic_vector(3 downto 0) ;
			coef_3   : in  std_logic_vector(3 downto 0) ;
			output_y : out std_logic_vector(7 downto 0) ) ;
	end component;

	signal clock    : std_logic;
	signal reset    : std_logic;
	signal input_x  : std_logic_vector(7 downto 0);
	signal coef_0   : std_logic_vector(3 downto 0);
	signal coef_1   : std_logic_vector(3 downto 0);
	signal coef_2   : std_logic_vector(3 downto 0);
	signal coef_3   : std_logic_vector(3 downto 0);
	signal output_y : std_logic_vector(7 downto 0);

begin
	-- Filter Under Test
	dut : filter
		port map (
			clock    => clock ,
			reset    => reset ,
			input_x  => input_x ,
			coef_0   => coef_0 ,
			coef_1   => coef_1 ,
			coef_2   => coef_2 ,
			coef_3   => coef_3 ,
			output_y => output_y
		);

	-- Clock Generation
	clock <= not clock after 10 ns;

	-- Input Data
	coef_0 <= X"1" ;
	coef_1 <= X"1" ;
	coef_2 <= X"1" ;
	coef_3 <= X"1" ;

	-- reset before read file
	reset <= '1' after 00 ns, '0' after 40 ns;

	-- write process for read from filter.data file

	-- save image of waveform from time 0 ns to 150 ns

end architecture testbench;
