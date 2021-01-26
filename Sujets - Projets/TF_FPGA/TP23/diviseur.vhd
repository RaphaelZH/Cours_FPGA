LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY diviseur IS
GENERIC(
	N : INTEGER 	:= 10
);
	PORT
	(
		--ENTREES
		clk 			:IN   STD_LOGIC;
		--SORTIES
		clk_div 		:OUT  STD_LOGIC
	);
END diviseur;

ARCHITECTURE myarchitecture OF diviseur IS

SIGNAL div 		: STD_LOGIC;

BEGIN
	clk_div <= div;
	PROCESS(clk)
		VARIABLE temp 	: INTEGER := 0;
		BEGIN
			IF (clk'EVENT AND clk = '1') THEN
				temp := temp + 1;
				IF (temp = N) THEN
					div 	<= (NOT(div));
					temp 		:= 0;
				END IF;
			END IF;
	END PROCESS;
END myarchitecture;