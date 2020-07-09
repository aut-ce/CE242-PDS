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


entity resource_sharing is
	port (
		condi_p : in std_logic;
		condi_q : in std_logic;

		A  : in  std_logic_vector;
		B  : in  std_logic_vector;
		C  : in  std_logic_vector;
		D  : in  std_logic_vector;
		E  : in  std_logic_vector;
		F  : in  std_logic_vector;
		G  : in  std_logic_vector;
		H  : in  std_logic_vector;
		I  : in  std_logic_vector;
		J  : in  std_logic_vector;
		K  : in  std_logic_vector;
		L  : in  std_logic_vector;
		M  : in  std_logic_vector;
		N  : in  std_logic_vector;
		Z1 : out std_logic_vector;
		Z2 : out std_logic_vector;
		Z3 : out std_logic_vector;
		Z4 : out std_logic_vector);
	
end resource_sharing;

architecture resource_sharing_arc of resource_sharing is
begin
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
end resource_sharing_arc;

