library ieee;
use ieee.std_logic_1164.all;

entity counter is
	port (
		clock  : in     std_logic;
		reset  : in     std_logic;
		enable : in     std_logic;
		count  : buffer std_logic_vector(7 downto 0));

end counter;

architecture behavioral of counter is

	signal active_clock : std_logic;

begin

	active_clock <= clock and enable;

	process (active_clock)
	begin
		if reset = '1' then
			count <= (others => '0')
			else
				if rising_edge(active_clock) then
					count <= count + '1';
				end if;
		end if;
	end process;
			
end behavioral;
