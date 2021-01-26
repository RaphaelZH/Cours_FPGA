LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Fenetre_Mesure IS
	PORT
	(
		--ENTREES
		clk					: IN	STD_LOGIC; -- l'horloge
		reset					: IN	STD_LOGIC; -- rest
		measure				: IN	STD_LOGIC; -- mesure
		--SORTIES
		clk_compteur		: OUT	STD_LOGIC; -- sortie clk
		reset_compteur		: OUT	STD_LOGIC; -- sortie reset
		enable_compteur	: OUT	STD_LOGIC; -- sortie enable
		latch_compteur		: OUT	STD_LOGIC  -- sortie lanch
	);
END;
ARCHITECTURE behav OF Fenetre_Mesure IS

SIGNAL temp					: 		STD_LOGIC; -- signal temp
Signal enable_temp 		: 		STD_LOGIC; -- signal enable
signal count				: 		STD_LOGIC; -- signal count

BEGIN
clk_compteur	<= clk WHEN enable_temp='1' ELSE '0'; -- lien entre clk_compteur et clk
PROCESS(reset,clk) -- le process va etre sensible par reset et clk
BEGIN

	IF (reset ='1') THEN
		reset_compteur 	<= '1'; -- si reset = 1
		
		temp 					<= '0'; -- signal temp => 0
		enable_temp 		<= '0'; -- signal enable_temp => 0
		count 				<= '0'; -- signal count => 0
		
		enable_compteur 	<= '0'; -- sortie enable_compteur => 0

	ELSIF(clk'EVENT AND clk = '1') THEN -- si l'horgole fonctionne
		IF (measure = '1' AND temp = '1') THEN -- mesure et temp = 1
			reset_compteur 			<= '1'; -- signal rest_compteur = 1
			count 						<= '1'; -- signal count = 1
				if count='1' then -- si count = 1
					reset_compteur 			<= '0'; -- sortie reset_compteur = 0
					temp 							<= '0'; -- signal temp = 0
					enable_temp 				<= '1'; -- siganl enable_temp = 1
					count 						<= '0'; -- signal count = 0
					enable_compteur 			<= '1'; -- sortie enable_compteur = 0
				end if; -- end if
		elsif (measure = '0' and temp ='0') then -- si dans le cas measure and temp = 0
			enable_compteur <= '0'; -- sortie enable_compteur = 0
			enable_temp<='0'; -- siganl enable_temp = 0
			latch_compteur <= '1'; -- sortie latch_compteur = 1
			count<='1'; -- signal count = 1
			if count='1' then -- if count = 1
				latch_compteur <='0'; -- sortie latch_compteur = 0
				temp<='1'; -- signal temp = 1
				count <='0'; --signal count = 0
			end if; -- end if
		else -- dernier cas
			reset_compteur <='0';-- sortie reset_compteur = 0
			latch_compteur <='0';-- sortie latch_compteur = 0
			count <='0';-- signal count = 0
		end if; -- end if
	end if; --end if
end process; --end process
END; -- end architecture