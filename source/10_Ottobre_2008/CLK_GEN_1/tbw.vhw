-- C:\USERS\ASUS\DESKTOP\CLK_GEN_1
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Tue Nov 18 15:10:57 2014
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

ENTITY tbw IS
END tbw;

ARCHITECTURE testbench_arch OF tbw IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT clkgen
		PORT (
			CLK : In  std_logic;
			RST : In  std_logic;
			EN : In  std_logic;
			DIN : In  std_logic;
			CLK_OUT : Out  std_logic
		);
	END COMPONENT;

	SIGNAL CLK : std_logic;
	SIGNAL RST : std_logic;
	SIGNAL EN : std_logic;
	SIGNAL DIN : std_logic;
	SIGNAL CLK_OUT : std_logic;

BEGIN
	UUT : clkgen
	PORT MAP (
		CLK => CLK,
		RST => RST,
		EN => EN,
		DIN => DIN,
		CLK_OUT => CLK_OUT
	);

	PROCESS -- clock process for CLK,
	BEGIN
		CLOCK_LOOP : LOOP
		CLK <= transport '0';
		WAIT FOR 10 ns;
		CLK <= transport '1';
		WAIT FOR 10 ns;
		WAIT FOR 40 ns;
		CLK <= transport '0';
		WAIT FOR 40 ns;
		END LOOP CLOCK_LOOP;
	END PROCESS;

	PROCESS   -- Process for CLK
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_CLK_OUT(
			next_CLK_OUT : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (CLK_OUT /= next_CLK_OUT) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns CLK_OUT="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, CLK_OUT);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_CLK_OUT);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		BEGIN
		-- --------------------
		RST <= transport '1';
		EN <= transport '1';
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		RST <= transport '0';
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 200 ns; -- Time=400 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 500 ns; -- Time=1000 ns
		EN <= transport '0';
		-- --------------------
		WAIT FOR 400 ns; -- Time=1400 ns
		EN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1500 ns
		RST <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1600 ns
		RST <= transport '0';
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1700 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1800 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1900 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 900 ns; -- Time=2800 ns
		RST <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=2900 ns
		RST <= transport '0';
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 300 ns; -- Time=3200 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 800 ns; -- Time=4000 ns
		EN <= transport '0';
		-- --------------------
		WAIT FOR 300 ns; -- Time=4300 ns
		EN <= transport '1';
		-- --------------------
		WAIT FOR 1400 ns; -- Time=5700 ns
		RST <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=5800 ns
		RST <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=5900 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 200 ns; -- Time=6100 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 3000 ns; -- Time=9100 ns
		-- --------------------

		IF (TX_ERROR = 0) THEN 
			STD.TEXTIO.write(TX_OUT,string'("No errors or warnings"));
			STD.TEXTIO.writeline(results, TX_OUT);
			ASSERT (FALSE) REPORT
				"Simulation successful (not a failure).  No problems detected. "
				SEVERITY FAILURE;
		ELSE
			STD.TEXTIO.write(TX_OUT, TX_ERROR);
			STD.TEXTIO.write(TX_OUT, string'(
				" errors found in simulation"));
			STD.TEXTIO.writeline(results, TX_OUT);
			ASSERT (FALSE) REPORT
				"Errors found during simulation"
				SEVERITY FAILURE;
		END IF;
	END PROCESS;
END testbench_arch;

CONFIGURATION clkgen_cfg OF tbw IS
	FOR testbench_arch
	END FOR;
END clkgen_cfg;
