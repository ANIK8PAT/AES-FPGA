library ieee;
use ieee.std_logic_1164.all;

entity Inv_Mix_Column is 
 port(inp:in std_logic_vector(127 downto 0);
	      outp:out std_logic_vector(127 downto 0) );

end entity;


architecture Struct of Inv_Mix_Column is

component Inv_Column_Transform is 
 port(inp:in std_logic_vector(31 downto 0);
	      outp:out std_logic_vector(31 downto 0) );

end component;
begin 

--c1:Column_Transform port map (inp=>inp(31  downto 0  ),outp=>outp(31 downto 0));
--c2:Column_Transform port map (inp=>inp(63  downto 32 ),outp=>outp(63  downto 32));
--c3:Column_Transform port map (inp=>inp(95  downto 64 ),outp=>outp(95  downto 64));
--c4:Column_Transform port map (inp=>inp(127 downto 96 ),outp=>outp(127 downto 96));

--f1: for i in 0 to 15  generate 
--
--inp1((i+1)*8-1 downto i*8)<=inp((135-(i+1)*8) downto (120-8*i));
--end generate ;


c1:Inv_Column_Transform port map (inp=>inp(31  downto 0),outp=>outp(31 downto 0));
c2:Inv_Column_Transform port map (inp=>inp(63  downto 32),outp=>outp(63  downto 32));
c3:Inv_Column_Transform port map (inp=>inp(95  downto 64),outp=>outp(95  downto 64));
c4:Inv_Column_Transform port map (inp=>inp(127 downto 96),outp=>outp(127 downto 96));
--
--f2: for i in 0 to 15  generate 
--
--outp((i+1)*8-1 downto i*8)<=outp1((135-(i+1)*8) downto (120-8*i));
--end generate ;

end architecture Struct;
