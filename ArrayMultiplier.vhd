-- 3x3 Array Multiplier
-- By: Ryan Vickramasinghe
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ArrayMultiplier is
	port (
		X, Y: in std_logic_vector(2 downto 0);
		P: out std_logic_vector(5 downto 0)
	);
end ArrayMultiplier;

architecture Behavioural of ArrayMultiplier is
signal C1, C2, C3: std_logic_vector(2 downto 0);
signal S1, S2, S3: std_logic_vector(2 downto 0);
signal XY0, XY1, XY2: std_logic_vector(2 downto 0);

component FullAdder
	port(
		X, Y, Cin: in std_logic;
		Cout, S: out std_logic
	);
end component;

component HalfAdder
	port(
		X, Y: in std_logic;
		Cout, S: out std_logic
	);
end component;

begin
	XY0(0) <= X(0) and Y(0); XY1(0) <= X(0) and Y(1);
	XY0(1) <= X(1) and Y(0); XY1(1) <= X(1) and Y(1);
	XY0(2) <= X(2) and Y(0); XY1(2) <= X(2) and Y(1);
	
	XY2(0) <= X(0) and Y(2);
	XY2(1) <= X(1) and Y(2); 
	XY2(2) <= X(2) and Y(2);
	
	FA1: FullAdder port map (XY0(2), XY1(1), C1(0), C1(1), S1(1)); --row1
	FA2: FullAdder port map (S1(2), XY2(1), C2(0), c2(1), s2(1)); --row2
	FA3: FullAdder port map (C1(2), XY2(2), C2(1), C2(2), s2(2));
	
	
	
	HA1: HalfAdder port map (XY0(1), XY1(0), C1(0), S1(0)); --row1
	HA2: HalfAdder port map (XY1(2), C1(1), C1(2), S1(2));
	HA3: HalfAdder port map (S1(1), XY2(0), C2(0), s2(0)); --row2
	
	P(0) <= XY0(0); P(1) <= S1(0); P(2) <= S2(0);
	P(3) <= S2(1); P(4) <= S2(2); P(5) <= C2(2);

end Behavioural;