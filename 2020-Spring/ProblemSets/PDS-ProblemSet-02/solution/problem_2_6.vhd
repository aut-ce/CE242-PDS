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
--  Module: ProblemSet 2, Problem 6
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;

entity problem_2_6 is
	port (
		din : in std_logic_vector(7 downto 0) ;
		dout : out std_logic_vector(2 downto 0)) ;

end problem_2_6;

architecture problem_2_6_arc of problem_2_6 is

begin
     ---- write your code here -----

	log_2_ceil : process( din )

	begin
    if (din(7) = '1') then
      dout <= "111" ;
    elsif (din(6) = '1') then
      dout <= "110" ;
    elsif (din(5) = '1') then
      dout <= "101" ;
    elsif (din(4) = '1') then
      dout <= "100" ;
    elsif (din(3) = '1') then
      dout <= "011" ;
    elsif (din(2) = '1') then
      dout <= "010" ;
    elsif (din(1) = '1') then
      dout <= "001" ;
    else
      dout <= "000" ;
    end if;
	end process ; -- log_2_ceil

end  problem_2_6_arc;
