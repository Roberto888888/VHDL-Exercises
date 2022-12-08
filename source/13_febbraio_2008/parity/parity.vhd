library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity parity is
	port (CLK, RST, EN, sel: in std_logic;
			Din: in std_logic_vector (1 downto 0);
			P0e, P0o, P1e, P1o: out std_logic);
end parity;


architecture Behavioral of parity is
   --In order to the parity bits
	--The values of these signals are sent to the output
	--according to the value of "sel".
   signal P0, P1: std_logic:='0';  
										  										  							 
   begin

      process (CLK, EN, RST)
      begin
		   if (RST = '1') then
			   --General reset.
			   P0e <= '0';
			   P0o <= '0';
			   P1e <= '0';
			   P1o <= '0';
			   P0 <= '0';
			   P1 <= '0';
		   elsif (rising_edge (CLK)) then
			   --When the entity is disabled, output lines are set to high impedance.			
			   if (EN = '0') then  
				   P0e <= 'Z';
				   P0o <= 'Z';
				   P1e <= 'Z';
				   P1o <= 'Z';
				   P0 <= '0';
				   P1 <= '0';
			      --When the entity is enabled, parity bits are computed:
					--the output lines are updated according to the value of "sel".
					--NOTE: parity bits (P0 and P1) are computed in any case, that's why there are 
               --two instructions outside the case construction; otherwise, it is not possible
					--to update correctly the output lines when the value of "sel" changes.
			   elsif (EN = '1') then
				   P0 <= P0 xor Din (0);				
				   P1 <= P1 xor Din (1);
				   case sel is
					   when '0' => P0e <= P0 xor Din (0);
									   P0o <= not (P0 xor Din (0));
					   when '1' =>	P1e <= P1 xor Din (1);
									   P1o <= not (P1 xor Din (1));
					   when others => null;
				   end case;
		      end if;
         end if;
      end process;			  			

end Behavioral;
