LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY compteurN IS
	PORT
	(
		--ENTREES
		clk        :IN   STD_LOGIC;
		reset      :IN   STD_LOGIC;
		enable     :IN   STD_LOGIC;
		--SORTIES
		unite      :OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		dizaine    :OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		centaine   :OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		millier    :OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END;

ARCHITECTURE myarchitecture OF compteurN IS
SIGNAL count_u : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL count_d : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL count_c : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL count_m : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
unite        <= count_u;
dizaine      <= count_d;
centaine     <= count_c;
millier      <= count_m;

	PROCESS(clk, reset)
	BEGIN
		IF reset    = '1' THEN
			count_u <= (OTHERS => '0');
			count_d <= (OTHERS => '0');
			count_c <= (OTHERS => '0');
			count_m <= (OTHERS => '0');
		ELSIF (clk'EVENT AND clk = '1') THEN
			count_u <= count_u + 1;
			IF count_u = "1001" THEN
				count_u <= "0000";
				count_d <= count_d + 1;
			ELSIF count_d = "1001" THEN
				count_d <= "0000";
				count_c <= count_c + 1;
			ELSIF count_c = "1001" THEN
				count_c <= "0000";
				count_m <= count_m + 1;
			ELSIF count_m = "1001" THEN
				count_m <= "0000";
			END IF;
		END IF;
	END PROCESS;
END myarchitecture;