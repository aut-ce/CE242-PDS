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

	end process ; -- log_2_ceil



end  problem_2_6_arc;
