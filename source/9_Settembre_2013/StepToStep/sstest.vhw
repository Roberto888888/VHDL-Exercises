-- C:\USERS\ROBERTO\DESKTOP\STEPTOSTEP
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Wed Sep 18 16:05:44 2013
-- 
-- Notes:
-- 1) This testbench has been automatically generated from
--   your Test Bench Waveform
-- 2) To use this as a user modifiable testbench do the following:
--   - Save it as a file with a .vhd extension (i.e. File->Save As...)
--   - Add it to your project as a testbench source (i.e. Project->Add Source...)
-- 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY sstest IS
END sstest;

ARCHITECTURE testbench_arch OF sstest IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT steptostep
		PORT (
		);
	END COMPONENT;


BEGIN
	UUT : steptostep
	PORT MAP (
	);

	PROCESS
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		BEGIN
		-- --------------------
END testbench_arch;

CONFIGURATION steptostep_cfg OF sstest IS
	FOR testbench_arch
	END FOR;
END steptostep_cfg;
