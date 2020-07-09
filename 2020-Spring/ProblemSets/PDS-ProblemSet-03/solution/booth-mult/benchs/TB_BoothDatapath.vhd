
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TB_BoothDatapath is
end TB_BoothDatapath;

architecture Behavioral of TB_BoothDatapath is

  component BoothDatapath is
    port(
      clock :in	std_logic;
      reset :in std_logic;
      load :in std_logic;
      shift :in std_logic;
      X	:in std_logic_vector;
      Y	:in std_logic_vector;
      P	:out std_logic_vector);
  end component;

  
  signal clock: std_logic := '0';
  signal load: std_logic := '0';
  signal reset: std_logic := '0';
  signal shift: std_logic := '0';
  
  signal X4: std_logic_vector(3 downto 0);
  signal Y4: std_logic_vector(3 downto 0);
  signal P8: std_logic_vector(7 downto 0);
  
  signal X8: std_logic_vector(7 downto 0);
  signal Y8: std_logic_vector(7 downto 0);
  signal P16: std_logic_vector(15 downto 0);
begin
  uut4: BoothDatapath
  port map(
    clock => clock,
    reset => reset,
    load => load,
    shift => shift,
    X => X4,
    Y => Y4,
    P => P8);

  uut8: BoothDatapath
  port map(
    clock => clock,
    reset => reset,
    load => load,
    shift => shift,
    X => X8,
    Y => Y8,
    P => P16);

  clock <= not clock after 5 ns;
  reset<= '1' after 10 ns, '0' after 20 ns;
  load <= '1' after 30 ns, '0' after 40 ns;
  shift <= '1' after 40 ns;
  
  Y4 <= X"B";
  X4 <= X"A";
  Y8 <= X"BA";
  X8 <= X"A7";
  
   

end Behavioral;
