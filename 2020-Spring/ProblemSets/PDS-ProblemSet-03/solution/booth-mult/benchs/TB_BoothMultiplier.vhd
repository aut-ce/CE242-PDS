-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY TB_BoothMultiplier IS
  END TB_BoothMultiplier;

  ARCHITECTURE behavior OF TB_BoothMultiplier IS 

  -- Component Declaration
  component BoothMultiplier is
  generic(COUNTER_SIZE : positive := 2);
  port(
    clock : in  std_logic;
    clear : in   std_logic;
    start : in  std_logic;
    X_data: in   std_logic_vector(2**COUNTER_SIZE-1 downto 0);
    Y_data: in   std_logic_vector(2**COUNTER_SIZE-1 downto 0);
    ready : out std_logic;
    Result: out std_logic_vector(2*(2**COUNTER_SIZE)-1 downto 0));
  end component;

		signal	clock :std_logic := '0';
		signal	reset :std_logic := '0';
		signal	start :std_logic := '0';
		signal	ready4 :std_logic := '0';
		signal	ready8 :std_logic := '0';
		
		signal	X_data4 :std_logic_vector(3 downto 0);
		signal	Y_data4 :std_logic_vector(3 downto 0);
		signal	Result8 :std_logic_vector(7 downto 0);
    signal	X_data8 :std_logic_vector(7 downto 0);
    signal  Y_data8 :std_logic_vector(7 downto 0);
    signal  Result16 :std_logic_vector(15 downto 0);
        		
  begin
	desing_under_test4bit: BoothMultiplier
	generic map(
    COUNTER_SIZE => 2)
	port map(
    clock => clock,
    clear => reset,
    start => start,
    X_data => X_data4,
    Y_data => Y_data4,
    ready => ready4,
    Result => Result8);
    
	desing_under_test8bit: BoothMultiplier
    generic map(
      COUNTER_SIZE => 3)
    port map(
      clock => clock,
      clear => reset,
      start => start,
      X_data => X_data8,
      Y_data => Y_data8,
      ready => ready8,
      Result => Result16);

	 clock 	<= not clock after 5 ns;	 
	 start 	<= '1' after 10 ns ;
  
  reset <=  '1' after 0010 ns ,'0' after 0020 ns;
--            '1' after 0410 ns, '0' after 0420 ns,	 
--            '1' after 0810 ns, '0' after 0820 ns,	 
--            '1' after 1210 ns, '0' after 1220 ns;
--            	 
  X_data8 <=  X"23" , -- 35
              X"03" after 0400 ns, -- 3
              X"FA" after 0800 ns, -- -8
              X"F5" after 1200 ns; -- -10

  Y_data8 <=  X"03" , -- 3 
              X"23" after 0400 ns, -- 35
              X"F5" after 0800 ns, -- -10
              X"FA" after 1200 ns;  -- -8
  X_data4 <=  X"3" , -- 35
              X"3" after 0400 ns, -- 3
              X"A" after 0800 ns, -- -8
              X"5" after 1200 ns; -- -10
  
  Y_data4 <=  X"3" , -- 3 
              X"3" after 0400 ns, -- 35
              X"5" after 0800 ns, -- -10
              X"A" after 1200 ns;  -- -8

end;
