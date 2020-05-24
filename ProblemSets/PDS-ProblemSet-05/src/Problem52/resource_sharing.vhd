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
--  Module: ProblemSet 5, Problem 2, Resource Sharing
--  *******************************************************
--  Additional Comments:
--*/

------------------------------------------------------------
-- type of condi_p and condi_q is boolean
-- type of other signals (ports) is std_logic_vector
-- Z1, Z2, Z3, and Z4 are output ports
------------------------------------------------------------
process(
		A, B, C, D, E, F, G,
		H, I, J, K, L, M, N,
		condi_p, condi_q)
begin
	Z1 <= A + B;
	if(condi_p) then
		Z2 <= C + D;
	else
		Z2 <= E + F;
		if(condi_q) then
			Z3 <= G + H;
		else
			Z3 <= I + J;
		end if;
	end if;
	if(not condi_p) then
		Z4 <= K + L;
	else
		Z4 <= M + N;
	end if;
end process;
