LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY switch_led IS

PORT(
	SW  :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
	LED :  OUT STD_LOGIC_VECTOR(9 DOWNTO 0)

);
END switch_led;

ARCHITECTURE Behavior OF switch_led IS
BEGIN
	LED <= SW;
END Behavior;