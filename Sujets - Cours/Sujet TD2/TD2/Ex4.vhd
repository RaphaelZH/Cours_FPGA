library ieee;
use ieee.std_logic_1164.all;

entity Ex4 is

port
(
	clk, set, reset : in  std_logic;
	D               : in  std_logic_vector (3 downto 0);
	Q               : out std_logic_vector (3 downto 0)
);
end Ex4;

Architecture behav of Ex4 is

component Ex1 is

port (
clk   : in  std_logic;
set   : in  std_logic;
reset : in  std_logic;
d     : in  std_logic;
q     : out std_logic
);
end component;

signal Qq : std_logic_vector(3 downto 0);

begin

	Q <= Qq;
	c1 : Ex1 port map(clk, set, reset, (not Qq(0)), Qq(0));
	c2 : Ex1 port map(clk, set, reset, (Qq(0) xor Qq(1)), Qq(1));
	c3 : Ex1 port map(clk, set, reset, ((Qq(2) and (not Qq(0))) or (Qq(2) and (not Qq(1))) or (Qq(0) and Qq(1) and (not Qq(2)))), Qq(2));
	c4 : Ex1 port map(clk, set, reset, ((Qq(3) and (not Qq(0))) or (Qq(3) and (not Qq(1))) or (Qq(3) and (not Qq(2))) or (Qq(0) and Qq(1) and Qq(2) and (not Qq(3)))), Qq(3));

end behav;