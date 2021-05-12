library ieee;
use ieee.std_logic_1164.all;

library xil_defaultlib;
use xil_defaultlib.xpoint_pkg.all;

entity xdsp is
	port (
		inpX : in  xfixed( 7 downto -8);
		inpY : in  xfixed( 7 downto -8);
		outp : out xfixed(15 downto -8));
end xdsp;

architecture xdsp_arc of xdsp is

begin

end xdsp_arc;

