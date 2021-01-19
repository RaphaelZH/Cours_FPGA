LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Porte_NAND IS
	PORT
	(
		A : IN   STD_LOGIC;
		B : IN   STD_LOGIC;
		S : OUT  STD_LOGIC
	);
END Porte_NAND;

ARCHITECTURE a OF Porte_NAND IS
BEGIN

	S <= A nand B;
	
END a;