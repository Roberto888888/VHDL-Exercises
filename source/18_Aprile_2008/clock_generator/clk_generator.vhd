library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk_generator is
	port(CLK, EN, RST, DIN: in std_logic;
		  CAPTURE: in std_logic_vector (3 downto 0);
		  OUT_CLK: out std_logic);
end clk_generator;

architecture Behavioral of clk_generator is
	--regIN: to store serial input.
	--div: for saving the division factor.
	--W1, W2, W3, W4: for saving the bits position in regIn.
	signal regIn: std_logic_vector (15 downto 0):=(others => '0'); 
	signal div: std_logic_vector (3 downto 0):="0000";	            
	signal W1, W2, W3, W4: integer range 0 to 20:=0;                
																		         
	--cnt: for uploading "regIn", "div" and "W" signals.
	--cnt_out, limit: for the output timing.
	signal cnt: integer range 0 to 20:=0;	   
	signal cnt_out: integer range 0 to 10:=1; 
	signal limit: natural:=0;                 	 
	begin

		process (CLK, RST, EN)
		begin
	
			if (RST = '1') then
				--General reset.
				OUT_CLK <= 'Z';
	   		regIn <= (others => '0');
				div <= (others => '0');
				cnt <= 0;
				cnt_out <= 1;   --It will be seen later the reason why it is initialized to 1.
	
			elsif rising_edge(CLK) then
	   		if (EN = '0') then     --When the entity is disabled, the output is kept in
					OUT_CLK <= 'Z'; 	  --high impedance status.

				elsif (EN = '1') then
					if (cnt <= 16) then		
			 			--16 values are uploaded; for the first 4 clock pulses,
						--4 occurrence of "CAPTURE" are stored also.   		
						case cnt is			
							when 0 => regIn <= regIn(14 downto 0) & DIN;
									 	 W1 <= conv_integer(CAPTURE);
									    cnt <= cnt + 1;
									   
							when 1 => W2 <= conv_integer(CAPTURE);
									 	 regIn <= regIn (14 downto 0) & DIN;
									 	 cnt <= cnt + 1;
									 
							when 2 => W3 <= conv_integer(CAPTURE);
						          regIn <= regIn (14 downto 0) & DIN;
									 cnt <= cnt + 1;
									 								 
							when 3 => W4 <= conv_integer(CAPTURE);
						          	 regIn <= regIn (14 downto 0) & DIN;
									 	 cnt <= cnt + 1;

							--For the rest of the clock pulses the only thing that 
							--is done is the the storage of serial input.		 								 
							when 4 to 15 => regIn <= regIn(14 downto 0) & DIN;  
										    	 cnt <= cnt + 1;							 
											 												
							--Division factor computation:
							--once "regIn" is filled, "div" is computed.
							--This cannot be done before the 17th clock pulse.
							--NOTE: Since the output must be computed after 16 clock pulses from the
							--last reset, the first output bit is computed in this context. 
							--If this is notdone one clock pulse delay occurs.
							--That's why "cnt_one" has been initialized to 1.
							when 16 => div(0) <= regIn (w1);	 
									  	  div(1) <= regIn (w2);	 
									  	  div(2) <= regIn (w3);	 
									  	  div(3) <= regIn (w4);	 
									  	  OUT_CLK <= '0';			 
							    	     cnt <= cnt + 1;			 
									  								  
																	 		  	  									    
							when others => null;
		   			end case;
		
					elsif (cnt > 16) then
						--Output bitstrem generation:
						if (cnt_out < limit) then
							OUT_CLK <= '0';
							cnt_out <= cnt_out + 1;

		   			elsif ((cnt_out >= limit) and (cnt_out < ((2*limit)-1)) )then
							OUT_CLK <= '1';
							cnt_out <= cnt_out + 1;
				  		
						--At the end, "cnt_out" is set to 0 again so that every instruction above
						--(for the Output bitstream generation) can be repeated and	
						--the output bitstream can be generated until a general reset:	
						elsif (cnt_out = ((2*limit)-1) ) then	
							cnt_out <= 0;                			 
					 							               							  
						end if;
								
					end if;
				end if;
			end if;

		end process;

--This is done outside from the process because if this is done within the process
--a clock pulse delay occurs (before computing "limit", "div" must be updated and this 
--cannot be done in just one clock pulse, within the process)					 
limit <= conv_integer(div) when (cnt > 16) else limit;  

end Behavioral;