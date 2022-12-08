library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Parity_Gen is
	port(CLK, LOAD, parity: in std_logic;
		  DATAIN: in std_logic_vector (3 downto 0);
		  DATAOUT: out std_logic);
end Parity_Gen;


architecture Behavioral of Parity_Gen is

	--regOut must contain 4 words of 4 bits, 4 trasverse parity bits,
	--4 longitudinal parity bits and one trasverse and longitudinal bit. 
	signal regOut: std_logic_vector (24 downto 0):=(others => 'Z');
	signal cnt: integer range 0 to 35:=0;
  
	--to store parity input
	signal p: std_logic;	 

	begin
	
	process (CLK, LOAD)
	begin
		if (LOAD = '0') then		  
			DATAOUT <= 'Z';
			cnt <= 0;
		elsif rising_edge(CLK) then
			if (cnt < 31) then
				--Parity bit is computed as follows: the exclusive or (XOR) of the 4 bits of 
				--DATAIN tells if the number of ones is even (0) or odd (1); 
				--the XOR of this result and parity input gives the correct longitudinal 
				--parity input for each DATAIN. 
			
				--At the beginning, parity input is stored so that the same value (the first one
				--after LOAD becomes '1') is used during the output processing.
				--NOTE: Parity bit cannot be processed right after the assignment because the
				--present value of every signal is used during the process execution and the
				--new values are assigned once the process is ended. So the parity bit, for each
				--case, must be processed in the next case:
				case cnt is  
				   when 0 => p <= parity; 
							 	 regOut(24 downto 21) <= DATAIN;
							 	 DATAOUT <= 'Z';
						 		 cnt <= cnt + 1;
							 	
				   when 1 => regOut(19 downto 16) <= DATAIN;
							 	 regOut(20) <= regOut(24) xor regOut(23) xor regOut(22) xor regOut(21) xor p;									 
							 	 DATAOUT <= 'Z';
							 	 cnt <= cnt + 1;

					when 2 => regOut(14 downto 11) <= DATAIN;
							 	 regOut (15) <= regOut(19) xor regOut(18) xor regOut(17) xor regOut(16) xor p;
							 	 DATAOUT <= 'Z';
							 	 cnt <= cnt + 1;
						 		
					when 3 => regOut(9 downto 6) <= DATAIN;
				  	       	 regOut (10) <= regOut(14) xor regOut(13) xor regOut(12) xor regOut(11) xor p;						 						 
							 	 DATAOUT <= 'Z';
							 	 cnt <= cnt + 1;
				
					--Trasverse parity bits must be processed after the whole input data is stored
					--for sure; in this context also the last longitudinal parity bit is processed.
					when 4 => regOut(5) <= regOut(9) xor regOut(8) xor regOut(7) xor regOut(6) xor p;
				  	       	 regOut(4) <= regOut(24) xor regOut(19) xor regOut(14) xor regOut(9) xor p;
							 	 regOut(3) <= regOut(23) xor regOut(18) xor regOut(13) xor regOut(8) xor p;
							 	 regOut(2) <= regOut(22) xor regOut(17) xor regOut(12) xor regOut(7) xor p;
						 		 regOut(1) <= regOut(21) xor regOut(16) xor regOut(11) xor regOut(6) xor p;				  							 
							 	 cnt <= cnt + 1;
  					 	 		 DATAOUT <= 'Z';

					--When every longitudinal parity bit is processed, the last trasverse parity bit 
					--can be processed as well
					when 5 => regOut(0) <= regOut(4) xor regOut(3) xor regOut(2) xor regOut(1) xor p;
								 cnt <= cnt + 1;
  					 			 DATAOUT <= 'Z';
					
					--Output processing: the MSB of regOut is sent to serial output and then all of 
					--the values of regOut are shifted to the left and the LSB is replaced by 'Z':
					when 6 to 31 => DATAOUT <= regOut(24);
								    	 regOut <= regOut(23 downto 0) & 'Z'; 
									 	 cnt <= cnt + 1;
					when others => null;
			 		
				end case;
		
			--After the output processing is finished, the output bitstream is set to high impedance
			elsif (cnt >= 31) then 
				DATAOUT <= 'Z';
			end if;
			
		end if;

	end process;	

end Behavioral;
