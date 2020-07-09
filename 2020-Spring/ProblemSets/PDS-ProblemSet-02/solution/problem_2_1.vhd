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
--  Module: ProblemSet 2, Problem 1
--  *******************************************************
--  Additional Comments:
--*/

library ieee;
use ieee.std_logic_1164.all;

package problem_2_1 is

	subtype ip_t is std_logic_vector(31 downto 0) ;
	subtype port_t is std_logic_vector(15 downto 0);
	subtype mac_addr_t is std_logic_vector(47 downto 0);
	subtype service_t is std_logic_vector(15 downto 0);

	type mac_udp_ip_stack_t is record
		src_ip : ip_t;
		dst_ip : ip_t;
		src_port : port_t;
		dst_port : port_t;
		mac_addr: mac_addr_t;
		seq_num : service_t;
		ack_num : service_t;
		qos_num : service_t;
	end record;

end package problem_2_1;

package body problem_2_1 is

	-- write codes here 

end package body problem_2_1;
