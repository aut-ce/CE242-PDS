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
--  Module: ProblemSet 2, Problem 4, Section A
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;

entity problem_2_4_a is
	port (
		data_inp : in std_logic_vector(7 downto 0) ;
		shamt : in std_logic_vector(2 downto 0) ;
		shmod : in std_logic ; 
		data_out : out std_logic_vector(7 downto 0));

end problem_2_4_a;

architecture problem_2_4_a_arc of problem_2_4_a is
	
	component mux_8 is
		port (
			inputs : in std_logic_vector(7 downto 0) ;
			sel : in std_logic_vector(2 downto 0) ;
			outp : out std_logic);
	end component mux_8;

	
	type xvector is array (0 to 7) of std_logic_vector(7 downto 0);
	signal muxs_inps: xvector;
	signal sh_left_bit : std_logic;

begin
	
	sh_left_bit <= shmod and data_inp(0) ;

	muxs_inps(0) <= data_inp(7) & data_inp(6) & data_inp(5) & data_inp(4) & data_inp(3) & data_inp(2) & data_inp(1) & data_inp(0) ;
    muxs_inps(1) <= sh_left_bit & data_inp(7) & data_inp(6) & data_inp(5) & data_inp(4) & data_inp(3) & data_inp(2) & data_inp(1) ;
    muxs_inps(2) <= sh_left_bit & sh_left_bit & data_inp(7) & data_inp(6) & data_inp(5) & data_inp(4) & data_inp(3) & data_inp(2) ;
    muxs_inps(3) <= sh_left_bit & sh_left_bit & sh_left_bit & data_inp(7) & data_inp(6) & data_inp(5) & data_inp(4) & data_inp(3) ;
    muxs_inps(4) <= sh_left_bit & sh_left_bit & sh_left_bit & sh_left_bit & data_inp(7) & data_inp(6) & data_inp(5) & data_inp(4) ;
    muxs_inps(5) <= sh_left_bit & sh_left_bit & sh_left_bit & sh_left_bit & sh_left_bit & data_inp(7) & data_inp(6) & data_inp(5) ;
    muxs_inps(6) <= sh_left_bit & sh_left_bit & sh_left_bit & sh_left_bit & sh_left_bit & sh_left_bit & data_inp(7) & data_inp(6) ;
    muxs_inps(7) <= sh_left_bit & sh_left_bit & sh_left_bit & sh_left_bit & sh_left_bit & sh_left_bit & sh_left_bit & data_inp(7) ;

	muxs_gen : for index in 0 to 7 generate
		muxs : mux_8 port map (
				inputs => muxs_inps(index)
				sel => shamt,
				outp => data_out(index) );
  		
	end generate muxs_gen;

end  problem_2_4_a_arc;

------------------------------------------------
--- describe new modules here if needed --------
------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity mux_8 is
	port (
		inputs : in std_logic_vector(7 downto 0) ;
		sel : in std_logic_vector(2 downto 0) ;
		outp : out std_logic);
end mux_8;

architecture mux_arch of mux_8 is

begin

	with sel select
    	outp <= inputs(0) when "000",
				inputs(1) when "001",
				inputs(2) when "010",
				inputs(3) when "011",
				inputs(4) when "100",
				inputs(5) when "101",
				inputs(6) when "110",
				inputs(7) when "111",
				'0' when others;

end mux_arch;
