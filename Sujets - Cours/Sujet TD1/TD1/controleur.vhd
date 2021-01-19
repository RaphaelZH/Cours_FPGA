LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY controleur IS

PORT(
	E           : IN    STD_LOGIC_VECTOR(1 DOWNTO 0);
	A, B, C, D  : OUT   STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END;

ARCHITECTURE Behavior OF controleur IS

	SIGNAL TEMP : STD_LOGIC_VECTOR(11 DOWNTO 0);

BEGIN with E select

	TEMP <=  "000001010011" when "00",
				"011000001010" when "01",
				"010011000001" when "10",
				"001010011000" when "11";
				
	A <=  TEMP(2  DOWNTO 0);
	 
	B <=  TEMP(5  DOWNTO 3);
		
	C <=  TEMP(8  DOWNTO 6);
		
	D <=  TEMP(11 DOWNTO 9);

END Behavior;