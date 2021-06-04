library ieee;
use ieee.std_logic_1164.all;

entity tb_nrzi is
end tb_nrzi;

architecture testbench of tb_nrzi is

	component nrzi_encode is
		port (
			clk  : in  std_logic;
			rst  : in  std_logic;
			din  : in  std_logic;
			dout : out std_logic);

	end component;

	component nrzi_decode is
		port (
			clk  : in  std_logic;
			rst  : in  std_logic;
			din  : in  std_logic;
			dout : out std_logic);
	end component;

	constant vector : std_logic_vector(34 downto 0) := "11101010010010000100101010101001001";

begin

	encode : nrzi_encode port map (
			clk  => clk;
			rst  => encode_rst;
			din  =>  ???
			dout => ???);
	);

	decode : nrzi_decode port map (
			clk  => clk;
			rst  => decode_rst;
			din  =>  ???
			dout => ???);
	);	


end testbench;
