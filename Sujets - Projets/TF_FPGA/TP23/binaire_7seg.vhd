LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY binaire_7seg IS
	PORT
	(
		--ENTREES
		val : IN    STD_LOGIC_VECTOR(3 DOWNTO 0);
		--SORTIES
		SEG : OUT   STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END binaire_7seg;

ARCHITECTURE myarchitecture OF binaire_7seg IS

BEGIN
	PROCESS(val)
		BEGIN
			CASE (val) IS
				WHEN "0000" => SEG <= "1000000";
				WHEN "0001" => SEG <= "1111001";
				WHEN "0010" => SEG <= "0100100";
				WHEN "0011" => SEG <= "0110000";
				WHEN "0100" => SEG <= "0011001";
				WHEN "0101" => SEG <= "0010010";
				WHEN "0110" => SEG <= "0000010";
				WHEN "0111" => SEG <= "1111000";
				WHEN "1000" => SEG <= "0000000";
				WHEN "1001" => SEG <= "0011000";
				WHEN OTHERS => SEG <= "1111111";
			END CASE;
		END PROCESS;
END myarchitecture;