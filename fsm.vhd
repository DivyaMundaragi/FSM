library ieee ;
use ieee.std_logic_1164.all;

entity seq_design is
port(a: in std_logic;
	 clk: in std_logic;
	 rst: in std_logic;
	 x: out std_logic
);
end seq_design;

architecture FSM of seq_design is

type state_type is (S0, S1, S2, S3);
signal next_state, current_state: state_type;

begin

state_reg: process(clk)
begin

if (rst='1') then
	current_state <= S0;
elsif (rst='0') then
	current_state <= next_state;
end if;

end process;

comb_logic: process(current_state, a)
begin

case current_state is

when S0 => x <= '0';
if a='0' then
	next_state <= S0;
elsif a ='1' then
	next_state <= S1;
end if;

when S1 => x <= '0';
if a='0' then 
	next_state <= S1;
elsif a='1' then 
	next_state <= S2;
end if;

when S2 => x <= '0';
if a='0' then
	next_state <= S2;
elsif a='1' then
	next_state <= S3;
end if;

when S3 => x <= '1';
if a='0' then 
	next_state <= S3;
elsif a='1' then 
	next_state <= S0;
end if;

when others => x <= '0';
next_state <= S0;

end case;

end process;

end FSM;