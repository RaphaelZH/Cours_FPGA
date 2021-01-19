library ieee;
use ieee.std_logic_1164.all;

Entity Ex1 is

port
(
	D, clk, set, reset : in  std_logic;
	Q                  : out std_logic
);
end Ex1;

Architecture behav of Ex1 is

begin

Process(clk, set, reset)

begin

if (set = '1') then

	Q <= '1';

elsif (reset = '1') then

	Q <= '0';

elsif (clk'event and clk = '1') then -- rising_edge(clk)

	Q <= D;

end if;

end process;

end behav;