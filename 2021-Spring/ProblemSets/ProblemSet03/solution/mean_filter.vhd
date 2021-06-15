library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mean_filter is
	generic (
		m : positive := 16;
		n : positive := 16
	);
	port (
		arst : in  std_logic;
		clk  : in  std_logic;
		inp  : in  std_logic_vector(15 downto 0) ;
		outp : out std_logic_vector(15 downto 0)
	) ;
end entity ;

architecture arch of mean_filter is
	
	type mem is array (7 downto 0) of unsigned(2 downto 0);
	constant coefs : mem :=("010", "011", "101", "110", "110", "101", "011", "010");
	signal regs : mem(7 downto 0);
begin

	process(arst, clk)
	begin
		if (arst='1') then
			regs(0) <= (others => '0');
			regs(1) <= (others => '0');
			regs(2) <= (others => '0');
			regs(3) <= (others => '0');
			regs(4) <= (others => '0');
			regs(5) <= (others => '0');
			regs(6) <= (others => '0');
			regs(7) <= (others => '0');
		elsif (rising_edge(clk)) then
			regs(7) <= regs(6);
			regs(6) <= regs(5);
			regs(5) <= regs(4);
			regs(4) <= regs(3);
			regs(3) <= regs(2);
			regs(2) <= regs(1);
			regs(1) <= regs(0);
			regs(0) <= inp;
		end if;
	end process;
	
	outp <= (regs(0) * coefs(0)) +
			(regs(1) * coefs(1)) +
			(regs(2) * coefs(2)) +
			(regs(3) * coefs(3)) +
			(regs(4) * coefs(4)) +
			(regs(5) * coefs(5)) +
			(regs(6) * coefs(6)) +
			(regs(7) * coefs(7)) ;

end architecture ;
