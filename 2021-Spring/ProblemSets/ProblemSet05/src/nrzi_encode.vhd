library ieee;
use ieee.std_logic_1164.all;

entity nrzi_encode is
	port (
		clk  : in  std_logic;
		rst  : in  std_logic;
		din  : in  std_logic;
		dout : out std_logic);

end nrzi_encode;

architecture fsm of nrzi_encode is

begin

end fsm;
