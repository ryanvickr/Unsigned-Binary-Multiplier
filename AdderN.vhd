-- N-bit Adder

library ieee;
use ieee.std_logic_1164.all;

entity AdderN is
  generic (  num_bits : positive := 4 );
	port ( 
		X, Y: in STD_LOGIC_VECTOR(num_bits-1 downto 0);
		Cin: in STD_LOGIC; 
	  --
		Cout: out STD_LOGIC;
		Sum: out STD_LOGIC_VECTOR(num_bits-1 downto 0)
  );
end AdderN;

architecture Structure of AdderN is

component FullAdder
  port ( 
	  X, Y, Cin: in STD_LOGIC;
	  Cout, S: out STD_LOGIC
  );
end component;

signal C: STD_LOGIC_VECTOR(num_bits-1 downto 0);
begin
Stages: for index in num_bits-1 downto 0 generate
		LowBit :  if index = 0 generate
			FA:FullAdder port map (X(0),Y(0),Cin,C(0),Sum(0));
		end generate;
		
		OtherBits :  if index /= 0 generate
			FA:FullAdder port map  (X(index),Y(index),C(index-1),C(index),Sum(index));
		end generate;
	end generate;
	
	Cout <= C(num_bits-1);
end;