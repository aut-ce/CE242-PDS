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
--  Module: ProblemSet 3, Problem 5
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;

entity problem_3_5 is
	port (
		time_x    : in  aut_time_t ;
		time_y    : in  aut_time_t ;
		operation : in  std_logic ;
		time_o    : out aut_time_t );
end problem_3_5;

architecture problem_3_5_arc of problem_3 is

	-- write your code here

begin

	-- write your code here

end problem_3_5_arc;

------------------------------------------------------
------------------------------------------------------

-- create new package and add time type to it.
-- in problem_3_5_arc use time type + and - opetations

package my_time is

	subtype aut_time_t is std_logic_vector(16 downto 0);

	function "+" (time_x : aut_time_t ; time_y : aut_time_t ) return aut_time_t ;
	function "-" (time_x : aut_time_t ; time_y : aut_time_t ) return aut_time_t ;

			end my_time;


			package body my_time is
				function "+" (time_x                                                                             : aut_time_t ; time_y : aut_time_t ) return aut_time_t is
					variable second1 , min1 , hour1 , second2 , min2 , hour2 , ex1 , ex2, resSec , resMin , resHour : integer;
					variable res                                                                                    : aut_time_t;
				begin
					ex1     := 0;
					ex2     := 0;
					second1 := to_integer(unsigned(time_x(5 downto 0)));
					min1    := to_integer(unsigned(time_x(11 downto 6)));
					hour1   := to_integer(unsigned(time_x(16 downto 12)));

					second2 := to_integer(unsigned(time_y(5 downto 0)));
					min2    := to_integer(unsigned(time_y(11 downto 6)));
					hour2   := to_integer(unsigned(time_y(16 downto 12)));

					resSec := second1 + second2;
					if resSec > 59 then
						resSec := resSec mod 60 ;
						ex1    := 1 ;
					end if;

					resMin := min1 + min2 +ex1;
					if resMin > 59 then
						resMin := resMin -60;
						ex2    := 1;
					end if;

					resHour := hour1 + hour2 + ex2 ;
					if resHour >23 then
						resHour := resHour - 24;
					end if;

					res(16 downto 12) := std_logic_vector(to_signed(resHour , 5));
					res(11 downto 6)  := std_logic_vector(to_signed(resMin , 6));
					res(5 downto 0)   := std_logic_vector(to_signed(resSec , 6));

					return res;
				end "+";
				function "-" (time_x                                                                             : aut_time_t ; time_y : aut_time_t ) return aut_time_t is
					variable second1 , min1 , hour1 , second2 , min2 , hour2 , ex1 , ex2, resSec , resMin , resHour : integer;
					variable res                                                                                    : aut_time_t;
				begin
					ex1     := 0;
					ex2     := 0;
					second1 := to_integer(unsigned(time_x(5 downto 0)));
					min1    := to_integer(unsigned(time_x(11 downto 6)));
					hour1   := to_integer(unsigned(time_x(16 downto 12)));

					second2 := to_integer(unsigned(time_y(5 downto 0)));
					min2    := to_integer(unsigned(time_y(11 downto 6)));
					hour2   := to_integer(unsigned(time_y(16 downto 12)));

					resSec := second1 - second2;
					if resSec < 0 then
						resSec := resSec + 60 ;
						ex1    := 1 ;
					end if;

					resMin := min1 - min2 - ex1;
					if resMin < 0 then
						resMin := resMin + 60;
						ex2    := 1;
					end if;

					resHour := hour1 - hour2 - ex2 ;
					if resHour < 0 then
						resHour := 0; resMin := 0; resSec := 0;
					end if;

					res(16 downto 12) := std_logic_vector(to_signed(resHour , 5));
					res(11 downto 6)  := std_logic_vector(to_signed(resMin , 6));
					res(5 downto 0)   := std_logic_vector(to_signed(resSec , 6));

					return res;
				end "-";
			end my_time;

