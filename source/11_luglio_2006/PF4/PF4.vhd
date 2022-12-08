library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity PF4 is
	port(CLK, RST: in std_logic;
		  sel: in std_logic_vector (1 downto 0);
		  A, B: in std_logic_vector (3 downto 0);
		  out1, out2: out std_logic);
end PF4;


architecture Behavioral of PF4 is

   signal cnt: integer range 0 to 15:=0;
   signal reginA: std_logic_vector (3 downto 0):=(others => 'Z');
   signal reginB: std_logic_vector (3 downto 0):=(others => 'Z');
   signal regin1: std_logic_vector (7 downto 0):=(others => 'Z');
   signal regin2: std_logic_vector (7 downto 0):=(others => 'Z');
   signal regsel: std_logic_vector (1 downto 0):="ZZ";

   begin

      process (CLK, RST)
      begin

         if (RST='1') then
	         cnt <= 0;
	         reginA <= (others => 'Z');
	         reginB <= (others => 'Z');
	         regsel <= "ZZ";
	         out1 <= 'Z';
	         out2 <= 'Z';

         elsif rising_edge(CLK) then
		      if (cnt=0) then
			      reginA <= A;
			      reginB <= B;
			      regsel <= sel;

			      regin1(7) <= B(3);
			      regin1(6) <= A(0);
			      regin1(5) <= B(2);
			      regin1(4) <= A(1);
			      regin1(3) <= B(1);
			      regin1(2) <= A(2);
			      regin1(1) <= B(0);
			      regin1(0) <= A(3);
			
			      regin2(7) <= A(3);
			      regin2(6) <= B(0);
			      regin2(5) <= A(2);
			      regin2(4) <= B(1);
			      regin2(3) <= A(1);
			      regin2(2) <= B(2);
			      regin2(1) <= A(0);
			      regin2(0) <= B(3);
			
			      out1 <= 'Z';
			      out2 <= 'Z';
			      cnt <= cnt + 1;
		      
			   elsif (cnt > 0) then
			      case regsel is
				      when "00" => out1 <= 'Z';
					    			    out2 <= 'Z';

				      when "01" => if (cnt <5) then
									       out1 <= reginA(3);
									       out2 <= reginB(3);
									       reginA <= reginA(2 downto 0) & 'Z';
									       reginB <= reginB(2 downto 0) & 'Z';
									       cnt <= cnt + 1;
								       elsif (cnt >= 5) then
								 	       out1 <= 'Z';
								 	       out2 <= 'Z';
								       end if;	 
							
				      when "10" => if (cnt <5) then
									       out1 <= reginB(0);
									       out2 <= reginA(0);
									       reginA <= 'Z' & reginA(3 downto 1);
									       reginB <= 'Z' & reginB(3 downto 1);
									       cnt <= cnt + 1;
								       elsif (cnt >= 5) then
								 	       out1 <= 'Z';
								 	       out2 <= 'Z';
								       end if;

				      when "11" => if (cnt <9) then
								 	       out1 <= regin1(7);
								 	       out2 <= regin2 (7);
								 	       regin1 <= regin1(6 downto 0) & 'Z';
									       regin2 <= regin2(6 downto 0) & 'Z';
								 	       cnt <= cnt + 1;
								       elsif (cnt >= 8) then
								 	       out1 <= 'Z';
								 	       out2 <= 'Z';
								       end if;								  

				      when others => out1 <= 'Z';
								 	      out2 <= 'Z';
						
			      end case;
		
		      end if;	

         end if;

   end process;

end Behavioral;