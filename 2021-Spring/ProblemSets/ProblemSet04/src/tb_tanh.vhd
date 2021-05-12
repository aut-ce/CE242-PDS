library ieee;
use ieee.std_logic_1164.all;

library xil_defaullib;
use xil_defaullib.xpoint_pkg.all;

entity tb_tanh is
end tb_tanh;

architecture testbench of tb_tanh is

	component tanh is
		port (
			x : in  xfixed( 2 downto -3);
			outp : out std_logic_vector(15 downto 0);
	end component xdsp;

	signal x : xfixed( 2 downto -3);
	signal out_lutx : std_logic_vector(15 downto 0);
	signal out_mult : std_logic_vector(15 downto 0);
begin
		tanh_lutx : port map (
			x => x,
			outp => out_lutx
		);
		tanh_mult : port map (
			x => x,
			outp => out_mult
		);


end testbench;
