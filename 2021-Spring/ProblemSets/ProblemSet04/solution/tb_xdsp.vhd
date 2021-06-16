
library ieee;
use ieee.std_logic_1164.all;

library xil_defaultlib;
use xil_defaultlib.xpoint_pkg.all;

entity xdsp is
	port (
		inpX : in  xfixed( 7 downto -8);
		inpY : in  xfixed( 7 downto -8);
		opr  : in  std_logic_vector(2 downto 0);
		outp : out xfixed(15 downto -8));
end xdsp;

architecture xdsp_arc of xdsp is
	constant cx1 : xfixed(7 downto -8) := "0000100000100000";
	constant cx2 : xfixed(7 downto -8) := "0000000000010000";
	constant cx3 : xfixed(7 downto -8) := "0001000000000000";
	constant cx4 : xfixed(7 downto -8) := "1000000100000000";
	signal temp  : xfixed(15 downto -8);
begin
	process (inpX,inpY,opr)
		variable resize1 : xfixed(7 downto 0)  := (others => '0');
		variable resize2 : xfixed(15 downto 0) := (others => '0');
	begin
		case opr is
			when "000" =>
				resize1 := (others => inpX(inpX'high));
				temp    <= resize1 & inpX;
			when "001" =>
				resize2 := inpX + inpY;
				resize1 := (others => resize2(resize2'high));
				temp    <= resize1 & (inpX + inpY);
			when "010" =>
				resize2 := inpX - inpY;
				resize1 := (others => resize2(resize2'high));
				temp    <= resize1 & (inpX - inpY);
			when "011" =>
				temp <= inpX * inpY;
			when "100" =>
				temp <= cx4 * inpX;
			when "101" =>
				temp <= cx3 * inpX;
			when "110" =>
				temp <= inpX * cx2;
			when "111" =>
				resize2 := inpY + cx1;
				resize1 := (others => resize2(resize2'high));
				temp    <= resize1 & (inpY + cx1);
			when others =>
				temp <= (others => 'X');
		end case;
		outp <= temp;
	end process;

end xdsp_arc;
