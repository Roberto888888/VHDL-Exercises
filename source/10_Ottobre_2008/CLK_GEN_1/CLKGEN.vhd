library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CLKGEN is
	port (CLK, RST, EN, DIN: in std_logic;
			CLK_OUT: out std_logic);
end CLKGEN;

architecture Behavioral of CLKGEN is

--cnt: to scan the input;
--cnt1: to display the output;
--regOUT: to store what must be sent to output;
--regIN: To store the input.
signal cnt: integer range 0 to 10:=0; 
signal cnt1: integer range 0 to 20:=0; 
signal regOUT: std_logic:='Z';  
signal regIN: std_logic_vector (4 downto 0):="00000";  

begin

   process (CLK, RST, EN)
   begin
	   if (RST = '1') then
		   cnt <= 0;
		   cnt1 <= 0;
		   regIN <= "00000";
		   regOUT <= 'Z';	
	   elsif rising_edge (CLK) then
		   if (cnt < 5) then
			   regIN <= regIN (3 downto 0) & DIN;
			   cnt <= cnt + 1;
			   regOUT <= 'Z';
			 
		   elsif (cnt = 5) then
		      case regIN is
				   --12: Period = 8 clock pulses;
					--output is high for 2 clock pulses:
				   when "01100" => if (cnt1 < 2) then
									 	   regOUT <= '1';
										   cnt1 <= cnt1 + 1;
									    elsif ((cnt1 >= 2) and (cnt1 < 7)) then
									 	   regOut <= '0';
										   cnt1 <= cnt1 + 1;
									    elsif (cnt1 = 7) then 
									 	   regOUT <= '0';
										   cnt1 <= 0;
											--In this way, the "loop" can be repeated.   	
									    end if;
					
					--18: Period = 4 clock pulses;
					--output is high for 2 clock pulses:					 
				   when "10010" => if (cnt1 < 2) then
							   		 	regOUT <= '1';
								   		cnt1 <= cnt1 + 1;
									    elsif ((cnt1 >= 2) and (cnt1 < 3)) then
									 	   regOut <= '0';
										   cnt1 <= cnt1 + 1;
									    elsif (cnt1 = 3) then 
									 	   regOUT <= '0';
										   cnt1 <= 0;
											--In this way, the "loop" can be repeated.   	
									    end if;

					--20: Period = 8 clock pulses;
					--output is high for 4 clock pulses:
				   when "10100" => if (cnt1 < 4) then
							   		 	regOUT <= '1';
								   		cnt1 <= cnt1 + 1;
									    elsif ((cnt1 >= 3) and (cnt1 < 7)) then
									 	   regOut <= '0';
										   cnt1 <= cnt1 + 1;
									    elsif (cnt1 = 7) then 
									    	regOUT <= '0';
									   	cnt1 <= 0;
											--In this way, the "loop" can be repeated.   	
									    end if;

					--23 Period = 16 clock pulses;
				   --output is high for 8 clock pulses:
			   	when "10111" => if (cnt1 < 8) then
						   			 	regOUT <= '1';
							   			cnt1 <= cnt1 + 1;
								   	 elsif ((cnt1 >= 7) and (cnt1 < 15)) then
									    	regOut <= '0';
										   cnt1 <= cnt1 + 1;
									    elsif (cnt1 = 15) then 
									 	   regOUT <= '0';
										   cnt1 <= 0;
											--In this way, the "loop" can be repeated.   	
									    end if;

					--28: Period = 8 clock pulses;
					--output is high for 6 clock pulses:
				   when "11100" => if (cnt1 < 6) then
									 	   regOUT <= '1';
										   cnt1 <= cnt1 + 1;
									    elsif ((cnt1 >= 5) and (cnt1 < 7)) then
									 	   regOut <= '0';
										   cnt1 <= cnt1 + 1;
									    elsif (cnt1 = 7) then 
									 	   regOUT <= '0';
										   cnt1 <= 0;
											--In this way, the "loop" can be repeated.   	
									    end if;

					--31: Period = 16 clock pulses;
					--output is high for 12 clock pulses;
				   when "11111" => if (cnt1 < 12) then
							   		 	regOUT <= '1';
								   		cnt1 <= cnt1 + 1;
								   	 elsif ((cnt1 >= 11) and (cnt1 < 15)) then
									    	regOut <= '0';
										   cnt1 <= cnt1 + 1;
									    elsif (cnt1 = 15) then 
									    	regOUT <= '0';
										   cnt1 <= 0;
											--In this way, the "loop" can be repeated.   	
								   	 end if;
				   when others => regOUT <= 'Z'; 
			   end case;
				
		   end if;
	   end if;
   end process;

CLK_OUT <= regOUT when (EN = '1') else 'Z'; 

end Behavioral;
