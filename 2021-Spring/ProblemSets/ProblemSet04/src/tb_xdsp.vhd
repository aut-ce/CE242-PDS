library ieee;
use ieee.std_logic_1164.all;

library xil_defaultlib;
use xil_defaultlib.xpoint_pkg.all;

entity tb_xdsp is
end tb_xdsp;

architecture testbench of tb_xdsp is
component xdsp is
	port (
		inpX : in  xfixed( 7 downto -8);
		inpY : in  xfixed( 7 downto -8);
		outp : out xfixed(15 downto -8));
end component xdsp;
signal x : xfixed( 7 downto -8);
signal y : xfixed( 7 downto -8);
signal o : xfixed(15 downto -8);
begin
	xdsp_unit : xdsp port map (
		inpX => x,
		inpY => y,
		outp => o
	);
end testbench;
