-- Full Adder
-- By: Ryan Vickramasinghe

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity FullAdder is
 Port ( 
	 X : in STD_LOGIC;
	 Y : in STD_LOGIC;
	 Cin : in STD_LOGIC;
	 S : out STD_LOGIC;
	 Cout : out STD_LOGIC
 );
end FullAdder;
 
architecture gate_level of FullAdder is
 
begin
 
 S <= X XOR Y XOR Cin ;
 Cout <= (X AND Y) OR (Cin AND X) OR (Cin AND Y) ;
 
end gate_level;
