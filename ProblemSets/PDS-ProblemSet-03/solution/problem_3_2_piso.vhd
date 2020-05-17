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
--  Module: ProblemSet 3, Problem 2, Section A
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;

entity piso is
	port (
		clk      : in  std_logic ;
		para_in  : in  std_logic_vector ;
		reset    : in  std_logic ;
		load     : in  std_logic ;
		shift_en : in  std_logic ;
		ser_out  : out std_logic) ;
end piso;

architecture piso_arc of piso is

	signal piso_reg : std_logic_vector( para_in'range ) ;

begin

	piso_proc : process( clk, reset )
	
	begin
		
		if ( reset = '1' ) then
			
			piso_reg <= ( others => '0' ) ;

		elsif ( rising_edge(clk) ) then
			
			if load = '1' then
				
				piso_reg <= para_in;
			
			elsif (shift_en = '1') then
				
				piso_reg <= '0' & piso_reg( piso_reg'length - 1 downto 1 ) ;
			
			end if;

		end if;

	end process ; -- piso_proc

end piso_arc;

