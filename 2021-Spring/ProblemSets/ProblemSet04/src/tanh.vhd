library ieee;
use ieee.std_logic_1164.all;

library xil_defaultlib;
use xil_defaultlib.xpoint_pkg.all;

entity tanh is
	port (
		x    : in  xfixed(2 downto -3);
		outp : out std_logic_vector(15 downto 0));
end tanh;

architecture arc_lutx of tanh is

begin

end arc_lutx;

architecture arc_hard of tanh is

begin

end arc_hard;

