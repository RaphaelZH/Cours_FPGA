LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux21 IS

PORT(
	X    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
	Y    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
	S    : IN  STD_LOGIC;
	LED  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END mux21;

ARCHITECTURE Behavior OF mux21 IS
BEGIN
	LED <= X when S = '0' else Y;
END Behavior;