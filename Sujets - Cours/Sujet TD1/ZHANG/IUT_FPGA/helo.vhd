LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY helo IS

PORT(
	E : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
	S : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END;

ARCHITECTURE Behavior OF helo IS
BEGIN with E select

	S <= "0001001" when "000",
	     "0000110" when "001",
	     "1000111" when "010",
		  "1000000" when "011",
	     "1111111" when others;
	
END Behavior;