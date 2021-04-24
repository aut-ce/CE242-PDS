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

begin



end architecture ;
