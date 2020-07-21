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
--  Module: ProblemSet 2, Problem 3, Section B
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity problem_2_3_b is
	port (
		data_inp : in std_logic_vector(7 downto 0) ;
		shamt : in std_logic_vector(2 downto 0) ;
		shmod : in std_logic ; 
		data_out : out std_logic_vector(7 downto 0));

end problem_2_3_b;

architecture problem_2_3_b_arc of problem_2_3_b is

function right_shifter (
	data : std_logic_vector;
	shamt : std_logic_vector;
	shmod : std_logic)
	return std_logic_vector is
	variable result : std_logic_vector(data'range);
begin
	lbl : for i in 0 to shamt'length loop
		if (i + shamt < data'length) then
			result(i) := data(i+ to_integer(unsigned(shamt))) ;
		end if;
	end loop;
	
	sign : for i in to_integer(unsigned(shamt)) to result'length loop
		if (shmod = '0') then
			result(i) := '0' ;
		else
			result(i) := data(data'length-1) ;
		end if;
	end loop;
	
	return result;
    
end function right_shifter;

begin

     data_out <= right_shifter(data_inp, shamt, shmod);

end  problem_2_3_b_arc;
