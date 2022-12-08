library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity selection is
	port (CLK, RST, EN, DIN, ROT: in std_logic;
			SEL: in std_logic_vector (1 downto 0);
			OUT1, OUT2, OUT3: out std_logic);
end selection;

architecture Behavioral of selection is

	signal REG: std_logic_vector (1 downto 0):="00";
	signal reg1, reg2, reg3: std_logic:='Z';

	begin

		process (CLK, RST)
		begin
			if (RST = '1') then
				REG <= SEL;
				OUT1 <= 'Z';
				OUT2 <= 'Z';
				OUT3 <= 'Z';
			elsif rising_edge (CLK) then
				if (REG = "00") then
					REG <= SEL;
					OUT1 <= 'Z';
		   		OUT2 <= 'Z';
		 			OUT3 <= 'Z';
				elsif (REG = "01") then
					reg1 <= DIN;  
					reg2 <= 'Z';
    				reg3 <= 'Z';
						if (ROT = '1') then 
							REG <= "10";
						end if;
				elsif (REG = "10") then
					reg1 <= 'Z'; 
					reg2 <= DIN;
					reg3 <= 'Z';   		
					if (ROT = '1') then 
						REG <= "11";
					end if;
				elsif (REG = "11") then
					reg1 <= 'Z';
					reg2 <= 'Z'; 
					reg3 <= DIN; 
					if (ROT = '1') then 
						REG <= "01"; 
					end if;
				end if;

			end if;
		end process;

OUT1 <= reg1 when (EN = '1') else 'Z';
OUT2 <= reg2 when (EN = '1') else 'Z';
OUT3 <= reg3 when (EN = '1') else 'Z';

end Behavioral;