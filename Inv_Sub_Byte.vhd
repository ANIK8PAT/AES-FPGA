library ieee;
use ieee.std_logic_1164.all;

entity Inv_Sub_Byte is 
	port(inp:in std_logic_vector(127 downto 0);
	      outp:out std_logic_vector(127 downto 0) );
	
end entity;

architecture Struct of Inv_Sub_Byte is 

component Inv_Sbox is
	port (
		input_byte : in std_logic_vector(7 downto 0);
		output_byte : out std_logic_vector(7 downto 0)
	);
end component;

begin

gen: for i in 0 to 15 generate
     sbox_instance: Inv_Sbox port map(input_byte=>inp((i+1)*8-1 downto i*8  ),
	                               output_byte=>outp((i+1)*8-1 downto i*8  ));
	  
	 end generate gen; 


end architecture Struct;