library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
package xpoint_pkg is
	----------------------------------------------------------------------------
	type xfixed is array ( integer range <> ) of std_logic;
	type xfloat16 is array (15 downto 0) of std_logic;
	function "+" (left, right  : xfixed) return xfixed;
	function "-" (left, right  : xfixed) return xfixed;
	function "*" (left, right  : xfixed) return xfixed;
	function "<" (left         : integer; right : xfixed) return boolean;
	function ">" (left         : integer; right : xfixed) return boolean;
	function convert (num      : xfixed) return real;
	function conv_to_float (xf : xfixed) return xfloat16;
	function conv_to_real (ff  : std_logic_vector(15 downto 0)) return real;
	PROCEDURE count ( xfix : IN xfixed ; num1 : INOUT Integer ; num2 : INOUT Integer ) ;
----------------------------------------------------------------------------
end package xpoint_pkg;

package body xpoint_pkg is

	function "<" (left : integer; right : xfixed) return boolean is
		variable output    : boolean;
	begin
		output := (right(2)='0') and (right(0)='1');
		return output;
	end;

	function ">" (left : integer; right : xfixed) return boolean is
		variable output    : boolean;
	begin
		output := (right(2)='1') and (right(0)='1');
		return output;
	end ;

	function max (a, b : integer) return integer is
	begin
		if (a > b) then
			return a;
		else
			return b;
		end if;
	end max;

	function min (a, b : integer) return integer is
	begin
		if (a > b) then
			return b;
		else
			return a;
		end if;
	end min;

	function "+" (left, right : xfixed) return xfixed is
		variable output           : xfixed(left'high downto left'low);
		variable signedLeft       : xfixed(max(left'high, right'high) downto min(left'low,right'low));
		variable signedRight      : xfixed(max(left'high, right'high) downto min(left'low,right'low));
		variable signedOutput     : signed(max(left'high, right'high) + abs(min(left'low,right'low)) downto 0);
		variable j                : integer := output'high + 1;
	begin
		for i in left'high downto left'low loop
			signedLeft(i) := left(i);
		end loop;
		for i in right'high downto right'low loop
			signedRight(i) := right(i);
		end loop;
		if (max(left'high, right'high) = left'high) then
			for i in right'high + 1 to left'high loop
				signedRight(i) := right(right'high);
			end loop;
		elsif (max(left'high, right'high) = right'high) then
			for i in left'high + 1 to right'high loop
				signedLeft(i) := left(left'high);
			end loop;
		end if;
		if (min(left'low, right'low) = left'low) then
			for i in right'low - 1 downto left'low loop
				signedRight(i) := '0';
			end loop;
		elsif (min(left'low, right'low) = right'low) then
			for i in left'low - 1 downto right'low loop
				signedLeft(i) := '0';
			end loop;
		end if;
		signedOutput := signed(signedLeft) + signed(signedRight);
		for i in signedOutput'high downto signedOutput'low loop
			j := j - 1;
			if (j >= output'low) then
				output(j) := signedOutput(i);
			end if;
		end loop;
		return output;
	end;
	function "-" (left, right : xfixed) return xfixed is
		variable output           : xfixed(left'high downto left'low);
		variable signedLeft       : xfixed(max(left'high, right'high) downto min(left'low,right'low));
		variable signedRight      : xfixed(max(left'high, right'high) downto min(left'low,right'low));
		variable signedOutput     : signed(max(left'high, right'high) + abs(min(left'low,right'low)) downto 0);
		variable j                : integer := output'high + 1;
	begin
		for i in left'high downto left'low loop
			signedLeft(i) := left(i);
		end loop;
		for i in right'high downto right'low loop
			signedRight(i) := right(i);
		end loop;
		if (max(left'high, right'high) = left'high) then
			for i in right'high + 1 to left'high loop
				signedRight(i) := right(right'high);
			end loop;
		elsif (max(left'high, right'high) = right'high) then
			for i in left'high + 1 to right'high loop
				signedLeft(i) := left(left'high);
			end loop;
		end if;
		if (min(left'low, right'low) = left'low) then
			for i in right'low - 1 downto left'low loop
				signedRight(i) := '0';
			end loop;
		elsif (min(left'low, right'low) = right'low) then
			for i in left'low - 1 downto right'low loop
				signedLeft(i) := '0';
			end loop;
		end if;
		signedOutput := signed(signedLeft) - signed(signedRight);
		for i in signedOutput'high downto signedOutput'low loop
			j := j - 1;
			if (j >= output'low) then
				output(j) := signedOutput(i);
			end if;
		end loop;
		return output;
	end;
	function "*" (left, right : xfixed) return xfixed is
		variable output           : xfixed(1+right'high+left'high downto min(left'low,right'low));
		variable signedLeft       : xfixed(max(left'high, right'high) downto min(left'low,right'low));
		variable signedRight      : xfixed(max(left'high, right'high) downto min(left'low,right'low));
		variable signedOutput     : signed(1+left'high+right'high + abs(left'low+right'low) downto 0);
		variable j                : integer := output'high + 1;
	begin
		for i in left'high downto left'low loop
			signedLeft(i) := left(i);
		end loop;
		for i in right'high downto right'low loop
			signedRight(i) := right(i);
		end loop;
		if (max(left'high, right'high) = left'high) then
			for i in right'high + 1 to left'high loop
				signedRight(i) := right(right'high);
			end loop;
		elsif (max(left'high, right'high) = right'high) then
			for i in left'high + 1 to right'high loop
				signedLeft(i) := left(left'high);
			end loop;
		end if;
		if (min(left'low, right'low) = left'low) then
			for i in right'low - 1 downto left'low loop
				signedRight(i) := '0';
			end loop;
		elsif (min(left'low, right'low) = right'low) then
			for i in left'low - 1 downto right'low loop
				signedLeft(i) := '0';
			end loop;
		end if;
		signedOutput := signed(signedLeft) * signed(signedRight);
		for i in signedOutput'high downto signedOutput'low loop
			j := j - 1;
			if (j >= output'low) then
				output(j) := signedOutput(i);
			end if;
		end loop;
		return output;
	end;
	function convert (num : xfixed) return real is
		variable intNumber    : integer := 0;
		variable n            : integer := 0;
		variable output       : real    := 0.0;
		variable sign         : std_logic;
	begin
		sign      := num(num'high);
		intNumber := to_integer(unsigned(num(num'high-1 downto num'low)));
		n         := num'LENGTH - num'high -1;
		if (sign='1') then
			output := real(-1)*real(intNumber)/real(2**n);
		else
			output := real(intNumber)/real(2**n);
		end if;
		return output;
	end;
	function conv_to_real (ff : std_logic_vector(15 downto 0)) return real is
		variable sign             : std_logic;
		variable exp              : integer := 0;
		variable output           : real    := 0.0;
		variable S                : real;
	begin
		sign := ff(ff'high);
		exp  := to_integer(unsigned(ff(14 downto 10))) - 24;
		S    := real(to_integer(unsigned('1' & ff(9 downto 0))));
		if (sign = '1') then
			output := real(-1)*real(2**exp)*S;
		else
			output := real(2**exp)*real(S);
		end if;
		return output;
	end;
	PROCEDURE count ( xfix : IN xfixed ; num1 : INOUT Integer ; num2 : INOUT Integer ) is
begin
	for i in xfix'high to -1 loop
		num1 := num1 + 1;
	end loop;
	for i in -1 to xfix'low loop
		num2 := num2 + 1;
	end loop;
	end;

	function conv_to_float (xf : xfixed) return xfloat16 is
		variable vecOut            : std_logic_vector(15 downto 0);
		variable fout              : xfloat16;
		variable signF             : std_logic;
		variable fracF             : std_logic_vector(2 downto 0);
	begin
		signF := xf(xf'high);
		fracF := xf(-1) & xf(-2) & xf(-3);
		if ((xf(1) = '0') and (xf(0) = '0')) then
			vecOut := signF & "01110" & fracF & "0000000" ;
		elsif ((xf(1) = '0') and (xf(0) = '1')) then
			vecOut := signF & "01111" & fracF & "0000000" ;
		elsif ((xf(1) = '1') and (xf(0) = '0')) then
			vecOut := signF & "100000" & fracF & "000000" ;
		elsif ((xf(1) = '1') and (xf(0) = '1')) then
			vecOut := signF & "100001" & fracF & "000000" ;
		else
			vecOut := (others => 'X');
		end if;
		for i in 15 downto 0 loop
			fout(i) := vecOut(i);
		end loop;
		return fout;
	end conv_to_float;
	end package body xpoint_pkg;
	