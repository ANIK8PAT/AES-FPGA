library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestBench is 
end; 

architecture bhv of TestBench is 
	component Inv_Mix_Coulumn is 
	port(inp:in std_logic_vector(127 downto 0);
	      outp:out std_logic_vector(127 downto 0) );
end component;
	
	signal output: std_logic_vector(127 downto 0);
	--signal input: std_logic_vector(127 downto 0) := "";
begin 
	dut_instance: Inv_Mix_Coulumn port map (inp => x"529f16c2978615cae01aae54ba1a2659", outp => output);
end bhv;