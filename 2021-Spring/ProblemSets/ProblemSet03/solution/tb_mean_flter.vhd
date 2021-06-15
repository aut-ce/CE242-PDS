library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity tb_mean_filter is
end entity ;

architecture testbench of tb_mean_filter is

	component mean_filter is
		port (
			arst : in  std_logic;
			clk  : in  std_logic;
			inp  : in  std_logic_vector(15 downto 0) ;
			outp : out std_logic_vector(15 downto 0)
		) ;
	end component mean_filter;

	signal arst : std_logic;
	signal clk  : std_logic;



	-- Other constants
	constant C_CLK_PERIOD : time := 10 ns;

begin
	-----------------------------------------------------------
	-- Clocks and Reset
	-----------------------------------------------------------
	clk <= not clk after C_CLK_PERIOD/2;

	-----------------------------------------------------------
	-- Testbench Stimulus
	-----------------------------------------------------------

	-----------------------------------------------------------
	-- Designs Under Test
	-----------------------------------------------------------

end architecture testbench;
