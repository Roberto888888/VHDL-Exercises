library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Key_Rec is
	port(CLK, DATAIN, ENABLE, RESET: in std_logic;
		  CTL4: in std_logic_vector (3 downto 0);
		  OUT12: out std_logic_vector(11 downto 0) );
end Key_Rec;


architecture Behavioral of Key_Rec is

	signal key: std_logic_vector (3 downto 0);  --For sampling the key word in CTL4.
	signal reg: std_logic_vector (11 downto 0); --For uploading the input DATAIN.
	signal cnt: integer range 0 to 15:=0; 

	begin

		process (CLK, RESET)

		begin

			if (RESET='1') then
				--If a reset pulse occurs, a general reset is executed:
				reg <= (others =>'0');
				out12 <= (others =>'0');
				key <= (others =>'0');
				cnt <= 0;
			elsif (rising_edge (CLK)) then
				if(cnt < 12) then
					reg <= reg(10 downto 0) & DATAIN;
			
					--At the beginning of the upload (cnt=0), control input is sampled;
					--for the remaining values from DATAIN, just the increment of cnt is executed
					case cnt is
						when 0 => key <= CTL4;  
									 cnt <= cnt + 1;

						when 1 to 12 => cnt <= cnt + 1;
					
						--No action is required in this case.  
						when others => null;  
					end case;
				end if;
		
				--After the upload is complete, the output is computed: 
				--if the output is enabled and the first four bits
				--of DATAIN are equal to the control input, the serial input is sent to parallel 
				--output; otherwise, the output is set to high impedance.  
				if ((cnt >= 12) and (ENABLE = '1') and (reg (11 downto 8) = key)) then 
					out12 <= reg;
				else
					out12 <= (others => 'Z');				
				end if;
				
			end if;

		end process;

end Behavioral;
				