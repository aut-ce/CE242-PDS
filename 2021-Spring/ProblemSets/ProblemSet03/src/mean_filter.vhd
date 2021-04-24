entity mean_filter is
	port (
		arst : in  std_logic;
		clk  : in  std_logic;
		inp  : in  std_logic_vector(15 downto 0) ;
		outp : out std_logic_vector(15 downto 0)
	) ;
end entity ;

architecture arch of mean_filter is
	-- decleare coef as constant type
begin

end architecture ;
