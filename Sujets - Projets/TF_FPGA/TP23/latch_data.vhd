LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY latch_data IS
	PORT
	(
		--ENTREES
		latch    : IN  STD_LOGIC;
		entree   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		--SORTIES
		sortie   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END;

ARCHITECTURE myarchitecture OF latch_data IS

BEGIN
	PROCESS(latch)
	BEGIN
		IF (latch'EVENT AND latch = '1') THEN
			sortie <= entree;
		END IF;
	END PROCESS;
END myarchitecture;