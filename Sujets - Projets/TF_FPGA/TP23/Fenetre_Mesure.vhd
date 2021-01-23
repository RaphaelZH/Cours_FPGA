LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Fenetre_Mesure IS
	PORT
	(
		--ENTREES
		clk					: IN	STD_LOGIC; -- déclaration de l’horloge de référence
		reset					: IN	STD_LOGIC; -- déclaration de la fonction de réinitialisation
		measure				: IN	STD_LOGIC; -- déclaration du signal de mesure à analyser
		--SORTIES
		clk_compteur		: OUT	STD_LOGIC; -- 
		reset_compteur		: OUT	STD_LOGIC; -- 
		enable_compteur	: OUT	STD_LOGIC; -- 
		latch_compteur		: OUT	STD_LOGIC  -- 
	);
END;
ARCHITECTURE behav OF Fenetre_Mesure IS

SIGNAL temp					: 		STD_LOGIC; -- 
Signal enable_temp 		: 		STD_LOGIC; -- 
signal count				: 		STD_LOGIC; -- 

BEGIN
clk_compteur	<= clk WHEN enable_temp='1' ELSE '0';
PROCESS(reset,clk)
BEGIN

	IF (reset ='1') THEN
		reset_compteur 	<= '1';
		
		temp 					<= '0';
		enable_temp 		<= '0';
		count 				<= '0';
		
		enable_compteur 	<= '0';

	ELSIF(clk'EVENT AND clk = '1') THEN
		IF (measure = '1' AND temp = '1') THEN
			reset_compteur 			<= '1';
			count 						<= '1';
				if count='1' then
					reset_compteur 			<= '0';
					temp 							<= '0';
					enable_temp 				<= '1';
					count 						<= '0';
					enable_compteur 			<= '1';
				end if;
		elsif (measure = '0' and temp ='0') then
			enable_compteur <= '0';
			enable_temp<='0';
			latch_compteur <= '1';
			count<='1';
			if count='1' then
				latch_compteur <='0';
				temp<='1';
				count <='0';
			end if;
		else
			reset_compteur <='0';
			latch_compteur <='0';
			count <='0';
		end if;
	end if; 
end process;
END;