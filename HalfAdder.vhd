-- Half Adder
-- By: Ryan Vickramasinghe

library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity HalfAdder is
  port (
    X  : in STD_LOGIC;
    Y  : in STD_LOGIC;
    --
    S   : out STD_LOGIC;
    Cout : out STD_LOGIC
 );
end HalfAdder;
 
architecture gate_level of HalfAdder is
begin
  S   <= X xor Y;
  Cout <= X and Y;
end gate_level;