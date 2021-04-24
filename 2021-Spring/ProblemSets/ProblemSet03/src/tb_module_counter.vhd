library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity tb_module_counter is
end entity ;

architecture testbench of tb_module_counter is

	component module_counter is
		generic (
			n : positive := 8
		);
		port (
			arst      : in  std_logic;
			clk       : in  std_logic;
			updown    : in  std_logic;
			cmode     : in  std_logic_vector(3 downto 0) ;
			interrupt : out std_logic;
			count     : out std_logic_vector(n-1 downto 0)
		);
	end component module_counter;

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
