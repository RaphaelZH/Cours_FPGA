LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY comparateur IS
	PORT
	(
		--ENTREES
		touche  : IN     STD_LOGIC_VECTOR(3 DOWNTO 0);
		--SORTIES
		LedR    : OUT    STD_LOGIC;
		LedV    : OUT    STD_LOGIC
	);
END comparateur;

ARCHITECTURE moncodage OF comparateur IS
SIGNAL CODE : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0101";
BEGIN
	LedV   <= '1' when CODE  = touche else '0';
	LedR   <= '1' when CODE /= touche else '0';
END moncodage;