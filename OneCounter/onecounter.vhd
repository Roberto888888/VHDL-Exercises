library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity onecounter is
	port (CLK, RST, SDIN, EN: in std_logic;
		OUTBCD: out std_logic);
end onecounter;

architecture Behavioral of onecounter is
--BCD is used for processing the output bitstream;
--cnt1 is used to count the first 8 clock pulses;
--cnt2 is used to count the next 4 cock pulses.
signal BCD: std_logic_vector (3 downto 0):="0000"; 
signal cnt1: integer range 0 to 10:=0;
signal cnt2: integer range 0 to 5:=0;

--NOTE: just one counter is enough (using a case construct)
--but it would be harder to understand the resulting source code.

begin

  process (CLK, EN, RST)
  begin
     if (EN = '1') then
	      if (rising_edge(CLK)) then
	         --counting the occurences of 1 in SDIN:
		      --they are counted directly incrementing BCD
		      --instead of incrementing a dedicated counter
		      --(BCD acts as a 4-bits unsigned integer since
		      --the package "unsigned" is used); in the meantime
		      --the output is forced to high impedance.
		      if (cnt1 < 8) then
		         OUTBCD <= 'Z';
		         if (SDIN = '1') then
		            BCD <= BCD + 1;
		         end if;
		         cnt1 <= cnt1 + 1;
            elsif (cnt2 < 4) then
		 	      OUTBCD <= BCD (3 - cnt2);
			      cnt2 <= cnt2 + 1;
			      --NOTE: this part is harder to understand if just one 
			      --counter is used.
		      end if;
	    
	         --Everything is set to 0 and OUTBCD is set to high impedance
		      --so that the entity can work indefinitely when it's enabled.
		      if (cnt2 = 4) then
		         OUTBCD <= 'Z';
			      cnt1 <= 0;
			      cnt2 <= 0;
			      BCD <= "0000";
		      end if;
	      end if;
	      --Asynchronous reset
	      if (RST = '1') then
	         OUTBCD <= 'Z';
		      cnt1 <= 0;
	         cnt2 <= 0;
		      BCD <= "0000";
	      end if;

	  --if (EN = 0): nothing is supposed to work and OUTBCD must be set to 
	  --high impedance
	  else
	     OUTBCD <= 'Z';
	     cnt1 <= 0;
	     cnt2 <= 0;
	     BCD <= "0000";
	  end if;
	
  end process;

end Behavioral;