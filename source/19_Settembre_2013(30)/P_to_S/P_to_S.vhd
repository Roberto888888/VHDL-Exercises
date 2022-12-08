library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity P_to_S is
	port (CLK, EN: in std_logic;
			DIN: in std_logic_vector (3 downto 0);
			SEL: in std_logic_vector(1 downto 0);
			DOUT, PULSE: out std_logic);
end P_to_S;

architecture Behavioral of P_to_S is

	signal cnt, index: integer range 0 to 10:=0;
	signal regin: std_logic_vector(3 downto 0):="0000";
	signal regout: std_logic:='Z';

	begin

		process (CLK, EN)
		begin

			if rising_edge(CLK) then
				if (cnt = 0) then
					regin <= DIN;
					regout <= 'Z';
					index <= conv_integer(SEL);
					cnt <= cnt + 1;
				elsif ((cnt > 0) and (cnt < (index + 1))) then
					regout <= regin (cnt - 1);
					cnt <= cnt + 1;
				elsif ((cnt > 0) and (cnt = (index + 1))) then
					regout <= regin (cnt - 1);
					cnt <= 0;
				end if;
			end if;

		end process;

DOUT <= regout when (EN = '1') else 'Z';
PULSE <= '1' when (cnt = 0) else '0';

end Behavioral;