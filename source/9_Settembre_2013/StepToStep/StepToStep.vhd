library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity StepToStep is
	port (CLK, EN: in std_logic;
			DIN: in std_logic_vector (1 downto 0);
			POR, PANT, POR10, PANT10: out std_logic);
end StepToStep;

--In this version it is supposed that the entity starts
--from "00" so at the beginning, the value of DIN must be equal to
--"00"; after this value occurs, the entity starts counting the revolutions. 

architecture Behavioral of StepToStep is 

--cntOR, cntANT: for counting revolutions;
--REG: to store the occurences of DIN and control the right occurrence succession;
--regOR, regANT, regOR10, regANT10: for computing the output. 
signal cntOR, cntANT: integer range 0 to 10:=0; 
signal REG: std_logic_vector (7 downto 0):=(others => '0');
signal regOR, regANT, regOR10, regANT10: std_logic:='0';
signal cnt: integer range 0 to 10:=0;

--According to the request, 10 revolutions should be counted, but the testbench 
--will be too long and confused. It is enough to set the value of FS (Full Scale) to 10
--to fulfill the required purpose.
constant FS: integer:=3; 

begin

   process (CLK, EN)
   begin
      --Entity disabled:
	   if (EN = '0') then 
		   regOR <= '1';
		   regANT <= '1';
      --Entity enabled:
	   elsif rising_edge (CLK) then
		   --does nothing until "00" occurs...  	
		   if ((DIN /= "00") and (cnt = 0)) then  
			   regOR <= '0';
			   regANT <= '0';
         --when "00" occurs, it goes on...
		   elsif ((DIN = "00") and (cnt = 0)) then  
			   regOR <= '0';
			   regANT <= '0';
			   cnt <= cnt + 1;
		   ------------------------------------------------------------------
		   --four instances of DIN are stored into REG...
		   elsif (cnt > 0) then  
			   case cnt is
				   when 1 => REG (7 downto 6) <= DIN;
							    regOR <= '0';
							    regANT <= '0';
							    cnt <= cnt + 1;
				   when 2 => REG (5 downto 4) <= DIN;
							    regOR <= '0';
							    regANT <= '0';
							    cnt <= cnt + 1;
				   when 3 => REG (3 downto 2) <= DIN;
							    regOR <= '0';
							    regANT <= '0';
							    cnt <= cnt + 1;
				   when 4 => REG (1 downto 0) <= DIN;
							    regOR <= '0';
							    regANT <= '0';
							    cnt <= cnt + 1;
				   when others => null;
			   end case;
		      --NOTE: output has been kept at low level so far...
		      -----------------------------------------------------------------------------
		      
				
				
				--The storage of the instances of DIN is complete; the sequence of them can be 
				--contolled now:
			   if (cnt = 5) then
					--If a clockwise revolution occurs* it is counted unless 10 clockwise revolutions
					--have already been counted, in this case it is not counted since the full scale 
					--is reached.
				   if ((REG = "10110100") and (cntOR < FS)) then				
					   if (cntOR = (FS -1)) then 
						   regOR10 <= '1'; 
						end if;	   
					   cntOR <= cntOR + 1;												
					   cnt <= 2;
				   elsif ((REG = "10110100") and (cntOR = FS)) then
					   cnt <= 2;

					--Analogous operations are executed when an anticlockwise** revolution occurs.
			      elsif ((REG = "01111000") and (cntANT < FS)) then			 
					   if (cntANT = (FS - 1)) then 
						   regANT10 <= '1'; 
						end if;	
					   cntANT <= cntANT + 1;
					   cnt <= 2;
				   elsif ((REG = "01111000") and (cntANT = FS)) then
					   cnt <= 2;

					--If the values of DIN don't follow a succession which corresponds
					--to a revolution, nothing is done, plus, if the last instance
					--of DIN has not been "00", the entity restarts from the beginning (line 42);
					--otherwise, if the last instance od DIN has been "00", the entity can restart
					--from line 58, since it is as if the first required instance of DIN has occurred

					--NOTE: all the previous cases exclude each other, and this is correct!***
					--NOTE: in any case before line 111, the entity restarts from line 58, since it is
					--as if the required instance of DIN has occurred for the next revolution.
				   elsif (REG (1 downto 0) /= "00") then							
					   if (DIN = "00") then												
						   cnt <= 1;														
					   else																  	
						   cnt <= 0;														
					   end if;																 
				   elsif (REG (1 downto 0) = "00") then							 
					   cnt <= 2;															
				   end if;																	
																																									
				   ----------------------------------------------------------------------------
					--If 10 clockwise (anticlockwise) revolutions have been counted and an 
					--anticlockwise (clockwise) revolution occurs, cntOR (cntANT) is set to 0	
					--so that the number of revolutions can be counted again from 0
					--and regOR (regANT) is set to '0' so that the output can go back to low
					--level, as it is required.
					--***NOTE: this section is not an elsif of the previous if contruct because it is
					--not an alternative set of operations among the previous ones, it must be 
					--executed in any case!
				   if ((REG = "10110100") and (cntANT = FS)) then				 
					   cntANT <= 0;														 
					   regANT10 <= '0';														 
				   elsif ((REG = "01111000") and (cntOR = FS)) then			
					   cntOR <= 0;															
					   regOR10 <= '0';														
				   end if;

					--In any case, when the succession of the occurences of DIN is controlled, the 
					--occurrence of DIN for the next revolution must be stored, because the entity
					--restarts from line 58 where the second occurrence of DIN (the first one is 
					--the final "00" of the previous revolution which has been completed) should 
					--has been already stored.
				   REG (7 downto 6) <= DIN;											 
																						   																																								
			   end if;																		  
		   end if;

	   end if;

   end process;

--When a clockwise revolution* is complete, the clock signal is sent to output so that it can 
--go to high level for half a clock period; otherwise, the output is set to regOR that is set 
--to '0' until the entity is disabled (when the entity is enabled regOR and regANT both are set 
--to '1'). Analogous operation for an anticlockwise revolution**.
POR <= CLK when ((REG = "10110100") and (cnt = 5)) else regOR;		  
PANT <= CLK when ((REG = "01111000") and (cnt = 5)) else regANT;	  
  																						  
--POR10 and PORANT are simply set to regOR10 and regANT10 respectively. 																						 
POR10 <= regOR10;		  
PANT10 <= regANT10;

end Behavioral;