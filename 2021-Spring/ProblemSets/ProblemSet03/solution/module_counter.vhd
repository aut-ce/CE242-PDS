library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity module_counter is
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
end entity ;

architecture arch of module_counter is

	signal value  : std_logic_vector(n-1 downto 0) ;
	signal pvalue : std_logic_vector(n-1 downto 0) ;
begin

	process (arst, clk)
	begin
		if (arst = '1') then
			value <= (others => '0');
	  	elsif (rising_edge(clk)) then
			if (updown = '1') then
				value = value + cmode ;
			else
				value = value - cmode ;
	  		end if;
	  end if;
	end process ;

	process (clk)
	begin
		if (rising_edge(clk)) then
			pvalue <= value;
		end if;
	end process;

	interrupt <= ((value < pvalue) and (updown)) or ((value > pvalue) and (not updown));

end architecture ;
