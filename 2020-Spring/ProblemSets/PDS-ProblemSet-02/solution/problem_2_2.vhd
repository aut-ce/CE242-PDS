--/*
--**********************************************************
--  Design Automation Course Homework (Spring, 2020 Semester)
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce.aut.ac.ir
--  Designed TA (ali[dot]mohammadpour[at]ac[dot]ir)
--  *******************************************************
--  Student ID  : TA
--  Student Name: TA
--  Student Mail: TA
--  *******************************************************
--  Module: ProblemSet 2, Problem 2
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

entity problem_2_2 is
	port (
		a  : in  std_logic_vector(7 downto 0) ;
		b  : in  std_logic_vector(7 downto 0) ;
		c  : in  std_logic_vector(7 downto 0) ;
		d  : in  std_logic_vector(7 downto 0) ;
		
		mode : in  std_logic;
		
		y0 : out std_logic_vector(7 downto 0) ;
		y1 : out std_logic_vector(7 downto 0) ;
		y2 : out std_logic_vector(7 downto 0) ;
		y3 : out std_logic_vector(7 downto 0)) ;

end problem_2_2;

architecture problem_2_2_arc of problem_2_2 is

	component crossbar is
		port (
			inp_1 : in  std_logic_vector(7 downto 0) ;
			inp_2 : in  std_logic_vector(7 downto 0) ;
			mode  : in  std_logic ;
			out_1 : out std_logic_vector(7 downto 0) ;
			out_2 : out std_logic_vector(7 downto 0)) ;
	end component ; -- crossbar

	signal	w10, w11, w12, w13,
			w21, w22, w31, w32
							: std_logic_vector(7 downto 0) ;

begin
	
	-- instances of level 1 (up module)
	cb_11 : crossbar
		port map (
			inp_1 => a,
			inp_2 => b,
			mode  => mode,
			out_1 => w10,
			out_2 => w11
		);
	
	cb_12 : crossbar
		port map (
			inp_1 => c,
			inp_2 => d,
			mode  => mode,
			out_1 => w12,
			out_2 => w13
		);
	
	-- instances of level 2
	cb_2 : crossbar
		port map (
			inp_1 => w11,
			inp_2 => w12,
			mode  => mode,
			out_1 => w21,
			out_2 => w22
		);
	-- instances of level 3
	cb_31 : crossbar
		port map (
			inp_1 => w10,
			inp_2 => w21,
			mode  => mode,
			out_1 => y0,
			out_2 => w31
		);
	
	cb_32 : crossbar
		port map (
			inp_1 => w22,
			inp_2 => w13,
			mode  => mode,
			out_1 => w32,
			out_2 => y3
		);

	-- instances of level 4
	cb_4 : crossbar
		port map (
			inp_1 => w31,
			inp_2 => w32,
			mode  => mode,
			out_1 => y1,
			out_2 => y2
		);

end problem_2_2_arc;

------------------------------------------------
------- describe new modules here --------------
------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

entity crossbar is
	port (
		inp_1 : in  std_logic_vector(7 downto 0) ;
		inp_2 : in  std_logic_vector(7 downto 0) ;
		mode  : in  std_logic;
		out_1 : out std_logic_vector(7 downto 0) ;
		out_2 : out std_logic_vector(7 downto 0)) ;

end entity ; -- crossbar

architecture behavioral of crossbar is

begin
    
	arch_proc : process( inp_1, inp_2, mode)

	begin
		 
		
		if (mode = '0') then
			if ((to_integer(signed(inp_2)) < to_integer(signed(inp_1)))) then

				out_1 <= inp_1 ;
				out_2 <= inp_2 ;

			else

				out_1 <= inp_2 ;
				out_2 <= inp_1 ;

			end if;
		else
			if ((to_integer(signed(inp_2)) < to_integer(signed(inp_1)))) then

				out_1 <= inp_2 ;
				out_2 <= inp_1 ;

			else

				out_1 <= inp_1 ;
				out_2 <= inp_2 ;

			end if;

		end if;
	end process ; -- arch_proc

end architecture ; -- behavioral