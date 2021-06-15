library IEEE;
use IEEE.STD_LOGIC_1164.all;

package riscv_types_pkg is

	subtype opcode_type is bit_vector(0 to 6);
	subtype rd_type is bit_vector(0 to 4);
	subtype func3_type is bit_vector(0 to 2);
	subtype rs_type is bit_vector(0 to 4);
	subtype func7_type is bit_vector(0 to 6);
	subtype imm12_type is bit_vector(0 to 11);
	subtype imm5_type is bit_vector(0 to 4);
	subtype imm7_type is bit_vector(0 to 6);
	subtype imm1_type is bit;
	subtype imm4_type is bit_vector(0 to 3);
	subtype imm6_type is bit_vector(0 to 5);
	subtype imm20_type is bit_vector(0 to 19);
	subtype imm8_type is bit_vector(0 to 7);
	subtype imm10_type is bit_vector(0 to 9);
		
	type R is record
	opcode : opcode_type;
	rd : rd_type;
	func3 : func3_type;
	rs1 : rs_type;
	rs2 : rs_type;
	func7 : func7_type;
	end record;
	
	type I is record
	opcode : opcode_type;
	rd : rd_type;
	func3 : func3_type;
	rs1 : rs_type;
	imm0_11 : imm12_type;
	end record;
	
	type S is record
	opcode : opcode_type;
	imm0_4 : imm5_type;
	func3 : func3_type;
	rs1 : rs_type;
	rs2 : rs_type;
	imm5_11 : imm7_type;
	end record;
	
	
	type B is record
	opcode : opcode_type;
	imm11 : imm1_type;
	imm1_4 : imm4_type;
	func3 : func3_type;
	rs1 : rs_type;
	rs2 : rs_type;
	imm5_10 : imm6_type;
	imm12 : imm1_type;
	end record;


	type U is record
	opcode : opcode_type;
	rd : rd_type;
	imm12_31 : imm20_type;
	end record;
	
	type J is record
	opcode : opcode_type;
	rd : rd_type;
	imm12_19 : imm8_type;
	imm11 : imm1_type;
	imm1_10 : imm10_type;
	imm12 : imm1_type;
	end record;

end riscv_types_pkg;

package body riscv_types_pkg is
 
end riscv_types_pkg;
