library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity TicTacToe is
	port(CLK, LOAD, STOP, DATAIN: in std_logic;
		  tris_0: out std_logic_vector (3 downto 0) );
end TicTacToe;


architecture Behavioral of TicTacToe is
   --reg: for uploding tic tac toe table;
	--zero_V1, zero_V2, zero_V3: for VERTICAL tris combinations;
	--zero_Or1, zero_Or2, zero_Or3: for HORIZONTAL ones;
	--zero_Ob1, zero_Ob2: for OBLIQUE ones;
	--cnt_1: to count during the DATAIN uploading;
	--check: for splitting the possible tris combinations storage 
	--and the count of tris combinations.
   signal reg: std_logic_vector (8 downto 0);  
   signal zero_V1, zero_V2, zero_V3: std_logic_vector (2 downto 0);      
   signal zero_Or1, zero_Or2, zero_Or3: std_logic_vector (2 downto 0);   
   signal zero_Ob1, zero_Ob2: std_logic_vector (2 downto 0);				 
   signal cnt_1: integer range 0 to 20:=0;  
   signal check: std_logic:='0';	 
   begin

      process (CLK, STOP)
		--to count tris combinations.
	   --NOTE: it's a variable because an immediate count is required.
      variable cnt_2: integer range 0 to 10:=0; 
														
      begin
			--If a STOP pulse occurs, a general reset is executed:
         if (STOP = '1') then   
	      	reg <= (others => '0');
	         tris_0 <= (others => '0');
	         cnt_1 <= 0;
	         cnt_2 := 0;
	         check <= '0';

         elsif (rising_edge(CLK)) then
	      	if (LOAD = '1') then
	         	if (cnt_1 < 9)then   --Just 9 values must be uploaded.
		         	reg <= reg(7 downto 0) & DATAIN;
		            cnt_1 <= cnt_1 + 1;
		         end if;
		
		         if(cnt_1 >= 9) then
		       		--if DATAIN uploading is complete, all the possible tris combination 
						--are stored.
			         --Since the signal assignation is done on the next clock pulse 
			         --"check" is used so that tris combinations are counted once all 
						--the "zeroes" vectors have been assigned: 
			         --at the beginning check is equal to '0'; after the storage of 
						--zeroes vectors, check is assigned to '1', but it will be equal 
						--to '1' on the next clock pulse, so just the first case is executed;
						-- on the next clock pulse, just the second case is executed; 
						--if check is equal to another value, nothing is executed.
			         case check is
				      	when '0' => --Horizontal combinations:
						               zero_Or1 <= reg (8 downto 6);
								         zero_Or2 <= reg (5 downto 3);
								         zero_Or3 <= reg (2 downto 0);

								         --vertical combinations
								         zero_V1 <= reg(8) & reg(5) & reg (2);
								         zero_V2 <= reg(7) & reg(4) & reg (1);
								         zero_V3 <= reg(6) & reg(3) & reg (0);

								         --oblique combinations
								         zero_Ob1 <= reg(8) & reg(4) & reg (0);
								         zero_Ob2 <= reg(6) & reg(4) & reg (2);
								         check <= '1';  

				         --After all of the possible tris combination are stored, 
				         --occurring tris combinations are counted by an increment 
						   --of cnt_2 for each occurrence.
				         when '1' => if(zero_V1 = "000") then cnt_2 := cnt_2 + 1; end if;
						 		         if(zero_V2 = "000") then cnt_2 := cnt_2 + 1; end if;
						 		         if(zero_V3 = "000") then cnt_2 := cnt_2 + 1;	end if;
						 		         if(zero_Or1 = "000") then cnt_2 := cnt_2 + 1; end if;
		   			 		         if(zero_Or2 = "000") then cnt_2 := cnt_2 + 1; end if;
						 		         if(zero_Or3 = "000") then cnt_2 := cnt_2 + 1; end if;
						 		         if(zero_Ob1 = "000") then cnt_2 := cnt_2 + 1; end if;
						 		         if(zero_Ob2 = "000") then cnt_2 := cnt_2 + 1; end if;

						 			 	   --Outuput is computed!
											if ( cnt_2 /= 0) then
								         	tris_0 <= conv_std_logic_vector (cnt_2, 4);
											else
												tris_0 <= "ZZZZ";
											end if;

								         cnt_2 := 0; 
										   --the last instruction is necessary, because this case 
										   --will be executed until a STOP pulse occurs.
									      --So, everytime this case is executed, cnt_2 starts 
										   --from 0 and the same value is used to compute tris_0.
			            when others => null;
			         end case;
               end if;
				
            else --if (LOAD /= '1') 
		         tris_0 <= "ZZZZ";
	         end if;
         end if;

      end process;

end Behavioral;