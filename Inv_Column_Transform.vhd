library ieee;
use ieee.std_logic_1164.all;

entity Inv_Column_Transform is 
 port(inp:in std_logic_vector(31 downto 0);
	      outp:out std_logic_vector(31 downto 0) );

end entity;


architecture Struct of Inv_Column_Transform is

component MUL_2 is
	port (
		input_byte : in std_logic_vector(7 downto 0);
		output_byte : out std_logic_vector(7 downto 0)
	);
end component;

signal t02,t12,t22,t32,t04,t14,t24,t34,t08,t18,t28,t38 : std_logic_vector(7 downto 0);

begin 
m02: MUL_2 port map (input_byte=>inp(31 downto 24),output_byte=>t02);
m12: MUL_2 port map (input_byte=>inp(23 downto 16),output_byte=>t12);
m22: MUL_2 port map (input_byte=>inp(15 downto 8),output_byte=>t22);
m32: MUL_2 port map (input_byte=>inp(7 downto 0),output_byte=>t32);

m04: MUL_2 port map (input_byte=>t02, output_byte=>t04);
m14: MUL_2 port map (input_byte=>t12, output_byte=>t14);
m24: MUL_2 port map (input_byte=>t22, output_byte=>t24);
m34: MUL_2 port map (input_byte=>t32, output_byte=>t34);

m08: MUL_2 port map (input_byte=>t04, output_byte=>t08);
m18: MUL_2 port map (input_byte=>t14, output_byte=>t18);
m28: MUL_2 port map (input_byte=>t24, output_byte=>t28);
m38: MUL_2 port map (input_byte=>t34, output_byte=>t38);

outp(31 downto 24)<= t02 xor t04 xor t08 xor t18 xor t12 xor inp(23 downto 16) xor t28 xor t24 xor inp(15 downto 8) xor t38 xor inp(7 downto 0);
outp(23 downto 16)<= t08 xor inp(31 downto 24) xor t18 xor t14 xor t12 xor t28 xor t22 xor inp(15 downto 8) xor t38 xor t34 xor inp(7 downto 0);
outp(15 downto 8)<= t08 xor t04 xor inp(31 downto 24) xor t18 xor inp(23 downto 16) xor t28 xor t24 xor t22 xor t38 xor t32 xor inp(7 downto 0);
outp(7 downto 0)<= t08 xor t02 xor inp(31 downto 24) xor t18 xor t14 xor inp(23 downto 16) xor t28 xor inp(15 downto 8) xor t38 xor t34 xor t32;

end architecture Struct;
