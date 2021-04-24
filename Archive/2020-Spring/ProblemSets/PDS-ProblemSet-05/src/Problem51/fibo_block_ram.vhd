--/*
--**********************************************************
--  Design Automation Course Homework (Spring, 2020 Semester)
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce.aut.ac.ir
--  Created by TA (ali[dot]mohammadpour[at]ac[dot]ir)
--  *******************************************************
--  Student ID  : XXXXXXX
--  Student Name: -----------------
--  Student Mail: -----------------
--  *******************************************************
--  Module: ProblemSet 5, Problem 1, Fibonacci Module
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------------------------------
-- source code should be synthesizable, add ports if needed !
--------------------------------------------------------------
entity fibo_block_ram is
	port (
		clock : in  std_logic ;
		din   : in  std_logic_vector(3 downto 0) ;   -- input: n
		dout  : out std_logic_vector(11 downto 0)) ; -- output : fib(n)
end fibo_block_ram;

--------------------------------------------------------------
-- Describe Block RAM to store Fibonacci series n-th values
-- you can use Primitives and macros like BRAM_SINGLE_MACRO 
-- please read UG953 Page 207 for instantiate MACRO
-- also you can describe Block RAM from scratch
--------------------------------------------------------------

architecture fibo_block_ram_arch of fibo_block_ram is

	-- write your code here

begin

	-- write your code here

end fibo_block_ram_arch;
