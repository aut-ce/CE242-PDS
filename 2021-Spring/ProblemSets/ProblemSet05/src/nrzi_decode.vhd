library ieee;
use ieee.std_logic_1164.all;

entity nrzi_decode is
	port (
		clk  : in  std_logic;
		rst  : in  std_logic;
		din  : in  std_logic;
		dout : out std_logic);

end nrzi_decode;

architecture fsm of nrzi_decode is

begin

end fsm;
