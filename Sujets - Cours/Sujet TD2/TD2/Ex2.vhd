library ieee;
use ieee.std_logic_1164.all;

entity Ex2 is

port
(
	clk, set, reset : in  std_logic;
	DR              : in  std_logic_vector (7 downto 0);
	QR              : out std_logic_vector (7 downto 0)
);
end Ex2;

Architecture behav of Ex2 is

component Ex1 is

port (
clk   : in  std_logic;
set   : in  std_logic;
reset : in  std_logic;
d     : in  std_logic;
q     : out std_logic
);
end component;

begin

	c1 : Ex1 port map(clk, set, reset, DR(0), QR(0));
	c2 : Ex1 port map(clk, set, reset, DR(1), QR(1));
	c3 : Ex1 port map(clk, set, reset, DR(2), QR(2));
	c4 : Ex1 port map(clk, set, reset, DR(3), QR(3));
	c5 : Ex1 port map(clk, set, reset, DR(4), QR(4));
	c6 : Ex1 port map(clk, set, reset, DR(5), QR(5));
	c7 : Ex1 port map(clk, set, reset, DR(6), QR(6));
	c8 : Ex1 port map(clk, set, reset, DR(7), QR(7));

end behav;