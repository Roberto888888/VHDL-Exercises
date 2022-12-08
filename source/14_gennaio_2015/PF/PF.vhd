library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--According to the description, the entity functioning seems to be one-shot.

entity PF is
	port(CLK, RST, DIN, DIS: in std_logic;
		  BINGO, DOUT: out std_logic);
end PF;

architecture Behavioral of PF is

signal reg1: std_logic_vector (2 downto 0):= "ZZZ";
signal reg2: std_logic_vector (0 to 2):= "ZZZ";
signal regD, regB: std_logic:='Z';
signal upl: bit:='0';
signal cnt: integer range 0 to 10:=0;

begin

process (CLK, RST)
begin

--After a reset occurs, the entity begins to 'read' a serial input (DIN): 16 bits.
--NB: I've programmed just 6 bits in order to obtain a short testbench;
--in order to have a versatile solution, a constant can be used, but the 
--following source code must be modified.
if (RST = '1') then
 	cnt <= 0;
	reg1 <= "ZZZ";
	reg2 <= "ZZZ";
	upl <= '0';

elsif (rising_edge(CLK)) then
	--The first 8 bits (3) are forward-uploaded 
	--into a register, reg1:
	if (cnt < 3) then
		reg1 <= reg1(1 downto 0) & DIN;
		regB <= '0';
		regD <= 'Z';
		cnt <= cnt + 1;
	--The remaining 8 bits (3 or N) are reverse-uploaded into another
	--register, reg2, in order to execute the subsequent comparison:    
	elsif (cnt > 2 and cnt < 5) then
		reg2 <= DIN & reg2(0 to 1);
		regB <= '0';
		regD <= 'Z';
		cnt <= cnt + 1;
	--When the last bit is uploaded, the output signal 'BINGO' 
	--(normally at low level) goes high level for one clock period of time
	--(regB is actually updated and then tranferred to BINGO, if the entity is 
	--enabled): 
	elsif (cnt = 5) then
		reg2 <= DIN & reg2(0 to 1);
		regB <= '1';
		regD <= 'Z';
		cnt <= cnt + 1;
	--If the first 8 (3) bits and the last 8 (3) ones are specular-like
	--the first 8 (3) bits are tranferred to the serial output 'DOUT'
	--otherwise DOUT is kept in high impedance state.
	--NB: since reg1 is forward-uploaded, it must be tranferred to DOUT
	--from the MSB to the LSB (*);
	--NB: the signal 'upl' is used so that it's not required to control again
	--whether reg1=reg2 or not (**);
	--NB: reg1 and reg2 cannot be compared before this point, since reg2 is not
	--completely uploaded yet.  
	elsif (cnt = 6) then
		regB <= '0';
		cnt <= cnt + 1;
		if (reg1 = reg2) then
			upl <= '1';
			regD <= reg1(2);  --(*)
			reg1 <= reg1(1 downto 0) & 'Z';
		else
			regD <= 'Z';
		end if;
		
	--(**)
	--NB: this 'elsif' body is necessary since as reg1 is tranferred to the output
	--its content is updated and it can nomore be compared to reg2.   
	elsif (cnt = 7) then
		regB <= '0';
		if (upl = '1') then 
			regD <= reg1(2);  --(*)
			reg1 <= reg1(1 downto 0) & 'Z';
		else
			regD <= 'Z';
		end if;
	--NB: after the first DIN 8 (3) bits are tranferred to DOUT, the latter 
	--is kept in high impedance state until a new reset occurs (one-shot).   	   
	end if; 
end if;
end process;

--If the entity is not disabled (DIS = 1), regD and regB are respectively 
--tranferred to DOUT and BINGO. 
DOUT <= regD when (DIS = '0') else 'Z';
BINGO <= regB when (DIS = '0') else 'Z';

end Behavioral;