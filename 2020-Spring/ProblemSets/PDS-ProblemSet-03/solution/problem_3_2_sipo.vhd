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
--  Module: ProblemSet 3, Problem 2, Section B
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;

entity sipo is
	port (
		clk : in std_logic ;
		ser_in : in std_logic ;
		reset : in std_logic ;
		shift_en : in std_logic ;
		para_out : out std_logic_vector );

end sipo;

architecture sipo_arc of sipo is

begin

     sipo_proc : process( clk, reset )
	
	begin
		
		if ( reset = '1' ) then
			
			sipo_reg <= ( others => '0' ) ;

		elsif ( rising_edge(clk) ) then
			
			if (shift_en = '1') then
				
				sipo_reg <= ser_in & sipo_reg( sipo_reg'length - 2 downto 0 ) ;
			
			end if;

		end if;

	end process ; -- sipo_proc

	para_out <= sipo_reg ;

end  sipo_arc;

