
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package xpoint_pkg is
----------------------------------------------------------------------------
	type xfixed is array ( integer range <> ) of std_logic;
	function "+" (left, right : xfixed) return xfixed;
----------------------------------------------------------------------------
end package xpoint_pkg;

package body xpoint_pkg is

end package body xpoint_pkg;

